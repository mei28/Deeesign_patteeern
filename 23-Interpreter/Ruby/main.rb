require './lexer'
require './parser'
require './vm'

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
ast = parser.run(tokens)
puts '== 構文解析の結果 =='
ast.show
puts ''
puts ''

# 解析したコードを仮想マシンで実行する
vm = Vm.new
calc_result = vm.run(ast)
puts '== 仮想マシンによる計算の結果 =='
puts calc_result
