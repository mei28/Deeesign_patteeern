require './ast'
require './vmcode'

# 抽象構文木をもとに命令を擬似コードに変換するクラス
class Compiler
  attr_reader :codes

  def initialize
    # 変換した擬似コード列
    @codes = []
  end

  # 擬似コードに変換する
  # @param [Ast] ast 解析した抽象構文木
  # @return [Array] 変換後の擬似コード列
  def compile(ast)
    case ast.type
    when NODE::NUMBER
      emit_number(ast)
    when NODE::BINARY
      emit_binary(ast)
    end
    @codes
  end

  # 数値をスタックにプッシュする
  # @param [Ast] ast 解析した抽象構文木
  # @return [Nil]
  def emit_number(ast)
    @codes.push(VmCode.new(OPCODE::PUSH, ast.value.to_f))
  end

  # 二項演算子のとき
  # @param [Ast] ast 解析した抽象構文木
  # @return [Nil]
  def emit_binary(ast)
    # 左右のノードを再帰的にコンパイル
    compile(ast.left)
    compile(ast.right)

    case ast.operator
    when '+'
      @codes.push(VmCode.new(OPCODE::ADD, 0))
    when '-'
      @codes.push(VmCode.new(OPCODE::SUB, 0))
    when '*'
      @codes.push(VmCode.new(OPCODE::MUL, 0))
    when '/'
      @codes.push(VmCode.new(OPCODE::DIV, 0))
    end
  end
end

# 疑似コードを実行する仮想マシン
# PUSH, ADD, SUB, MUL, DIVしか解釈できない
class Vm
  def initialize
    @stack = []
    @compiler = Compiler.new
  end

  # 計算する
  # @param [Array] 翻訳後のコード
  # @return [Integer] 計算結果
  def run(ast)
    # 擬似コードにコンパイル
    codes = @compiler.compile(ast)
    if codes.empty?
      warn 'no codes'
      -1
    end

    # スタック上の命令を逐次実行
    codes.each do |code|
      exec(code)
    end

    @stack.pop
  end

  # コードを実行する
  # @param [VmCode] code スタック上の命令1つ
  # @return [Nil]
  def exec(code)
    # PUSH命令なら値をスタックにプッシュして終わり
    (return @stack.push(code.value) if code.type == OPCODE::PUSH)

    # オペランドの取り出し
    right = @stack.pop
    left = @stack.pop

    case code.type
    when OPCODE::ADD
      @stack.push(left + right)
    when OPCODE::SUB
      @stack.push(left - right)
    when OPCODE::MUL
      @stack.push(left * right)
    when OPCODE::DIV
      @stack.push(left / right)
    end
  end
end
