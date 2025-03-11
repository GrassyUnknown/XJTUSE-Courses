import re

reserved_words = {
    "program": 1, "begin": 2, "end": 3, "var": 4, "integer": 5,
    "if": 6, "then": 7, "else": 8, "do": 9, "while": 10, "int": 28,
    "not": 29, "and": 30, "or": 31
}
operators_and_delimiters = {
    '+': 13, '-': 14, '(': 15, ')': 16, '=': 17,
    '>': 18, '<': 19, ';': 20, ',': 21, ':': 22, ':=': 23,
    '*': 24, '/': 25, '{': 26, '}': 27, "==" : 32, "!=" : 33, ">=" : 34, "<=" : 35
}

def is_identifier(word):
    return re.match(r"^[A-Za-z][A-Za-z0-9]*$", word) is not None

def is_integer(word):
    return re.match(r"^\d+$", word) is not None

class Lexer:
    def __init__(self, source_code):
        self.tokens = []
        self.generate_tokens(source_code)
        self.pos = 0

    def generate_tokens(self, source_code):
        words = re.findall(r":=|[<>+\-*/(),;:{}]|[A-Za-z][A-Za-z0-9]*|\d+", source_code)

        for word in words:
            if word in reserved_words:
                self.tokens.append((reserved_words[word], word))
            elif word in operators_and_delimiters:
                self.tokens.append((operators_and_delimiters[word], word))
            elif is_identifier(word):
                self.tokens.append((11, word))
            elif is_integer(word):
                self.tokens.append((12, word))
            else:
                raise ValueError(f"Unknown token: {word}")
        
    def next_token(self):
        if self.pos < len(self.tokens):
            token = self.tokens[self.pos]
            self.pos += 1
            return token
        else:
            return None

    def peek_token(self):
        if self.pos < len(self.tokens):
            return self.tokens[self.pos]
        else:
            return None
class Parser:
    def __init__(self, lexer):
        self.lexer = lexer
        self.current_token = lexer.next_token()
        self.symbol_table = {}
        self.quadruples = []
        self.temp_counter = 0

    def get_temp(self):
        self.temp_counter += 1
        return f"T{self.temp_counter}"

    def emit(self, op, arg1, arg2, result):
        self.quadruples.append((op, arg1, arg2, result))

    def error(self, message):
        position = self.lexer.pos if self.current_token is not None else "End of input"
        raise Exception(f"Syntax error at {position}: {message}")

    def consume(self, expected_type):
        if self.current_token and self.current_token[0] == expected_type:
            self.current_token = self.lexer.next_token()
        else:
            self.error(f"Expected token type {expected_type} but found {self.current_token[0] if self.current_token else None}")

    def parse(self):
        if self.current_token is None:
            return "Empty input"
        result = self.program()
        if self.current_token is not None:
            self.error("Unexpected token after end of statement")
        return result

    def program(self):
        result = []
        while self.current_token is not None:
            result.append(self.statement())
        return result

    def statement(self):
        if self.current_token[0] == 28:  # int
            self.consume(28)
            if self.current_token[0] != 11:
                self.error("Expected identifier after int")
            symbol_name = self.current_token[1]
            self.symbol_table[symbol_name] = "int"
            self.consume(11)
            self.consume(20)
            return

        elif self.current_token[0] == 6:  # if
            self.consume(6)
            cond = self.comparison_expression()
            self.consume(7)  # then
            self.consume(26)  # '{'
            if_body = []
            while self.current_token[0] != 27:
                if_body.append(self.statement())
            self.consume(27)  # '}'
            label_else = self.get_temp()
            label_end = self.get_temp()
            self.emit("if_false", cond, "", label_else)
            for stmt in if_body:
                pass
            if self.current_token and self.current_token[0] == 8:  # else
                self.consume(8)
                self.consume(26)  # '{'
                else_body = []
                while self.current_token[0] != 27:
                    else_body.append(self.statement())
                self.consume(27)  # '}'
                self.emit("goto", "", "", label_end)
                self.emit("label", label_else, "", "")
                for stmt in else_body:
                    pass
            else:
                self.emit("label", label_else, "", "")
            self.emit("label", label_end, "", "")
            self.consume(20)
            return

        elif self.current_token[0] == 10:  # while
            label_start = self.get_temp()
            label_end = self.get_temp()
            self.emit("label", label_start, "", "")
            self.consume(10)
            cond = self.comparison_expression()
            self.consume(9)  # do
            self.emit("if_false", cond, "", label_end)
            self.consume(26)  # '{'
            while_body = []
            while self.current_token[0] != 27:
                while_body.append(self.statement())
            self.consume(27)  # '}'
            for stmt in while_body:
                pass
            self.emit("goto", "", "", label_start)
            self.emit("label", label_end, "", "")
            self.consume(20)
            return

        elif self.current_token[0] == 11:  # identifier
            self.assignment()
            self.consume(20)
            return

        else:
            self.error("Unsupported statement")

    def assignment(self):
        var_name = self.current_token[1]
        self.consume(11)  # identifier
        self.consume(23)  # :=
        expr_val = self.simple_expression()
        if var_name not in self.symbol_table:
            self.error(f"Variable not defined: {var_name}")
        self.emit(":=", expr_val, '', var_name)

    def comparison_expression(self):
        left_expr = self.simple_expression()
        while self.current_token and self.current_token[0] in (18, 19, 32, 33, 34, 35):  # >, <, ==, !=, >=, <=
            op = self.current_token[1]
            self.consume(self.current_token[0])
            right_expr = self.simple_expression()
            temp = self.get_temp()
            self.emit(op, left_expr, right_expr, temp)
            left_expr = temp
        return left_expr

    def logical_expression(self):
        left_expr = self.and_expression()
        while self.current_token and self.current_token[0] == 31:  # or
            op = self.current_token[1]
            self.consume(self.current_token[0])
            right_expr = self.and_expression()
            temp = self.get_temp()
            self.emit(op, left_expr, right_expr, temp)
            left_expr = temp
        return left_expr

    def and_expression(self):
        left_expr = self.not_expression()
        while self.current_token and self.current_token[0] == 30:  # and
            op = self.current_token[1]
            self.consume(self.current_token[0])
            right_expr = self.not_expression()
            temp = self.get_temp()
            self.emit(op, left_expr, right_expr, temp)
            left_expr = temp
        return left_expr

    def not_expression(self):
        if self.current_token and self.current_token[0] == 29:  # not
            op = self.current_token[1]
            self.consume(29)
            operand = self.not_expression()
            temp = self.get_temp()
            self.emit(op, operand, '', temp)
            return temp
        else:
            return self.simple_expression()

    def simple_expression(self):
        t1 = self.term()
        while self.current_token and self.current_token[0] in (13, 14):  # +, -
            op = self.current_token[1]
            self.consume(self.current_token[0])
            t2 = self.term()
            temp = self.get_temp()
            self.emit(op, t1, t2, temp)
            t1 = temp
        return t1

    def term(self):
        f1 = self.factor()
        while self.current_token and self.current_token[0] in (24, 25):  # *, /
            op = self.current_token[1]
            self.consume(self.current_token[0])
            f2 = self.factor()
            temp = self.get_temp()
            self.emit(op, f1, f2, temp)
            f1 = temp
        return f1

    def factor(self):
        if self.current_token[0] == 11:  # identifier
            result = self.current_token[1]
            self.consume(11)
        elif self.current_token[0] == 12:  # number
            result = self.current_token[1]
            self.consume(12)
        elif self.current_token[0] == 15:  # (
            self.consume(15)
            result = self.simple_expression()
            self.consume(16)  # )
        else:
            self.error("Expected identifier, number, or (")
        return result



def analyze(input_file, output_file):
    with open(input_file, 'r', encoding='utf-8') as f:
        source_code = f.read().strip()

    lexer = Lexer(source_code)
    parser = Parser(lexer)
    output_lines = []

    try:
        result = parser.parse()
        symbol_table_str = f"符号表: {parser.symbol_table}"
        quadruples_str = f"四元式: {parser.quadruples}"
        output_lines.append(f"{result}\n{symbol_table_str}\n{quadruples_str}")
    except Exception as e:
        output_lines.append(f"{e}")
    
    with open(output_file, 'w', encoding='utf-8') as f:
        for line in output_lines:
            f.write(line + '\n')
    for line in output_lines:
        print(line)

input_file = "input.txt"
output_file = "output.txt"
analyze(input_file, output_file)