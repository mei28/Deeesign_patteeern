# 抽象構文木を構成する葉や節を表現する抽象クラス
class Node
  # 構文木を評価する
  # @param [Nil]
  # @return [Float] 評価結果値
  def evaluate
    raise NotImplementedError
  end

  # 構文木を文字列に変換する
  # @param [Nil]
  # @return [String] 変換後の文字列
  def to_str
    raise NotImplementedError
  end
end

# 数値を表現するノード(葉)
class NumNode < Node
  attr_reader :value

  # @param [String] 値
  # @return [Nil]
  def initialize(value)
    @value = value
  end

  # 構文木を評価する
  # @param [Nil]
  # @return [Float] 評価結果値
  def evaluate
    @value.to_f
  end

  # 構文木を文字列に変換する
  # @param [Nil]
  # @return [String] 変換後の文字列
  def to_str
    @value
  end
end

# 加算を表現するノード
class AddNode < Node
  attr_reader :left, :right

  # @param [Node] 左のノード
  # @param [Node] 右のノード
  # @return [Nil]
  def initialize(left, right)
    @left = left
    @right = right
  end

  # 構文木を評価する
  # @param [Nil]
  # @return [Float] 評価結果値
  def evaluate
    @left.evaluate + @right.evaluate
  end

  # 構文木を文字列に変換する
  # @param [Nil]
  # @return [String] 変換後の文字列
  def to_str
    "(+ #{@left.to_str} #{@right.to_str})"
  end
end

# 減算を表現するノード
class SubNode < Node
  attr_reader :left, :right

  # @param [Node] 左のノード
  # @param [Node] 右のノード
  # @return [Nil]
  def initialize(left, right)
    @left = left
    @right = right
  end

  # 構文木を評価する
  # @param [Nil]
  # @return [Float] 評価結果値
  def evaluate
    @left.evaluate - @right.evaluate
  end

  # 構文木を文字列に変換する
  # @param [Nil]
  # @return [String] 変換後の文字列
  def to_str
    "(- #{@left.to_str} #{@right.to_str})"
  end
end

# 乗算を表現するノード
class MulNode < Node
  attr_reader :left, :right

  # @param [Node] 左のノード
  # @param [Node] 右のノード
  # @return [Nil]
  def initialize(left, right)
    @left = left
    @right = right
  end

  # 構文木を評価する
  # @param [Nil]
  # @return [Float] 評価結果値
  def evaluate
    @left.evaluate * @right.evaluate
  end

  # 構文木を文字列に変換する
  # @param [Nil]
  # @return [String] 変換後の文字列
  def to_str
    "(* #{@left.to_str} #{@right.to_str})"
  end
end

# 除算を表現するノード
class DivNode < Node
  attr_reader :left, :right

  # @param [Node] 左のノード
  # @param [Node] 右のノード
  # @return [Nil]
  def initialize(left, right)
    @left = left
    @right = right
  end

  # 構文木を評価する
  # @param [Nil]
  # @return [Float] 評価結果値
  def evaluate
    @left.evaluate / @right.evaluate
  end

  # 構文木を文字列に変換する
  # @param [Nil]
  # @return [String] 変換後の文字列
  def to_str
    "(/ #{@left.to_str} #{@right.to_str})"
  end
end
