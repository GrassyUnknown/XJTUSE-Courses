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

# 词法分析
def lex_analyze(input_file, output_file):
    with open(input_file, "r") as file:
        lines = file.readlines()

    output = []
             
    tokens = []
    for line in lines:
        tokens.extend(re.findall(r":=|[<>+\-*/(),;:]|[A-Za-z][A-Za-z0-9]*|\d+", line))
    
    for token in tokens:
        if token in reserved_words:
            output.append((reserved_words[token], "-"))
        elif token in operators_and_delimiters:
            output.append((operators_and_delimiters[token], "-"))
        elif is_identifier(token):
            output.append((11, token))
        elif is_integer(token):
            output.append((12, token))
        else:
            print(f"Unknown token: {token}")

    with open(output_file, "w") as file:
        for item in output:
            file.write(f"({item[0]}, {item[1]})\n")

input_file = "input.txt"
output_file = "output.txt"
lex_analyze(input_file, output_file)