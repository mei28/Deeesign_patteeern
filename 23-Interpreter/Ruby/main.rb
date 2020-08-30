require './lexer'
require './parser'

# コマンドライン引数から計算式を受け取る
if ARGV.empty?
  puts '計算式を入力してください'
  exit
end
input = ARGV[0]

# 字句解析をする
lexer = Lexer.new
tokens = lexer.run(input)
puts '== 字句解析の結果 =='
tokens.show
puts ''

# 構文解析をする
parser = Parser.new
ast = parser.parse(tokens)
puts '== 構文解析の結果 =='
puts ast.to_str
puts ''

# 抽象構文木の評価
puts '== 評価の結果 =='
puts ast.evaluate
