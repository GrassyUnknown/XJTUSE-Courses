import re

# 保留字、界符、运算符
reserved_words = {
    "program": 1, "begin": 2, "end": 3, "var": 4, "integer": 5,
    "if": 6, "then": 7, "else": 8, "do": 9, "while": 10
}
operators_and_delimiters = {
    '+': 13, '-': 14, '(': 15, ')': 16, '=': 17,
    '>': 18, '<': 19, ';': 20, ',': 21, ':': 22, ':=': 23,
    '*': 24, '/': 25
}

# 是否标识符
def is_identifier(word):
    return re.match(r"^[A-Za-z][A-Za-z0-9]*$", word) is not None

# 是否整数
def is_integer(word):
    return re.match(r"^\d+$", word) is not None

class Lexer:
    def __init__(self, source_code):
        self.tokens = []
        words = re.findall(r":=|[<>+\-*/(),;:]|[A-Za-z][A-Za-z0-9]*|\d+", source_code)
        
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
        
        self.pos = 0

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
    
    def error(self, message):
        position = self.lexer.pos if self.current_token is not None else "End of input"
        raise Exception(f"语法错误，位置 {position}: {message}")
    
    def consume(self, expected_type):
        if self.current_token and self.current_token[0] == expected_type:
            self.current_token = self.lexer.next_token()
        else:
            self.error(f"Expected token type {expected_type} but found {self.current_token[0] if self.current_token else None}")
    
    def parse(self):
        if self.current_token is None:
            return "Empty input"
        result = self.statement()
        if self.current_token is not None:
            self.error("Unexpected token after end of statement")
        return result
    
    floor = 0 # 嵌套层数
    def statement(self):
        statefloor = self.floor
        if self.current_token[0] == 6:  # if
            self.consume(6)
            self.expression()
            self.consume(7)  # then
            self.floor = 1
            nested_result = self.statement()
            if self.current_token and self.current_token[0] == 8:  # else
                self.consume(8)
                self.floor = 1
                self.statement()
                if(statefloor == 0):
                    self.consume(20)
                return f"if-then-else 分支语句, 嵌套 {nested_result}"
            if(statefloor == 0):
                self.consume(20)
            return f"if-then 分支语句, 嵌套 {nested_result}"
        elif self.current_token[0] == 10:  # while
            self.consume(10)
            self.expression()
            self.consume(9)  # do
            self.floor = 1
            nested_result = self.statement()
            if(statefloor == 0):
                self.consume(20)
            return f"while-do 循环语句, 嵌套 {nested_result}"
        elif self.current_token[0] == 11:  # identifier
            self.assignment()
            if(statefloor == 0):
                self.consume(20)
            return "赋值语句"
        else:
            self.error("Unsupported statement")
    
    def assignment(self):
        self.consume(11)  # identifier
        self.consume(23)  # :=
        self.expression()
        
    
    def expression(self): # 形如 expression * expression + expression / expression，其中expression可以是factor
        self.term()
        while self.current_token and self.current_token[0] in (13, 14):  # +, -
            self.consume(self.current_token[0])
            self.term()
    
    def term(self):
        self.factor()
        while self.current_token and self.current_token[0] in (24, 25):  # *, /
            self.consume(self.current_token[0])
            self.factor()

    def factor(self):
        if self.current_token and self.current_token[0] in (11, 12):  # identifier or number
            self.consume(self.current_token[0])
        elif self.current_token and self.current_token[0] == 15:  # '('
            self.consume(15)
            self.expression()
            if self.current_token and self.current_token[0] == 16:  # ')'
                self.consume(16)
            else:
                self.error("Unmatched '('")
        else:
            self.error("Invalid factor")


def analyze(input_file, output_file):
    with open(input_file, 'r', encoding='utf-8') as f:
        input_lines = f.readlines()

    output_lines = []

    for index, line in enumerate(input_lines, start=1):
        source_code = line.strip()
        lexer = Lexer(source_code)
        parser = Parser(lexer)
        try:
            result = parser.parse()
            output_lines.append(f"{index}\t{source_code}\t{result}")
        except Exception as e:
            output_lines.append(f"{index}\t{source_code}\t{e}")
    
    with open(output_file, 'w', encoding='utf-8') as f:
        for line in output_lines:
            f.write(line + '\n')
    for line in output_lines:
        print(line)



input_file = "input.txt"
output_file = "output.txt"
analyze(input_file, output_file)