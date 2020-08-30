# frozen_string_literal: true

# 抽象構文木のノードの種類
module NODE
  NUMBER = 'Number'
  BINARY = 'Binary'
end

# 抽象構文木を表現する抽象クラス
class Ast
  attr_reader :type

  # 左右のノードを再帰的に辿りながら，標準出力に表示する
  # @param [Nil]
  # @param [Nil]
  def show
    case @type
    when NODE::NUMBER
      print "#{@value} "
    when NODE::BINARY
      print "(#{@operator} "
      @left.show
      @right.show
      print ') '
    else
      puts 'Error'
    end
  end
end

# 数値のノード，葉
class Number < Ast
  attr_reader :value

  # @param [Integer] num 数値
  # @return [Number]
  def initialize(num)
    @type = NODE::NUMBER
    @value = num
  end
end

# 二項演算子のノード，節
class Binary < Ast
  attr_reader :operator, :left, :right

  # @param [String] operator 演算子
  # @param [Ast] left 左辺のノード
  # @param [Ast] right 右辺のノード
  # @return [Binary]
  def initialize(operator, left, right)
    @type = NODE::BINARY
    @operator = operator
    @left = left
    @right = right
  end
end
