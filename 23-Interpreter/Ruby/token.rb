# frozen_string_literal: true

# 字句の種類
module TOKENKIND
  NUMBER = 'Number'
  SYMBOL = 'Symbol'
  EOL = 'EOL'
end

# 字句を表現する
class Token
  attr_reader :type, :value

  # @param [TOKENKIND] type 字句のタイプ
  # @param [String] value 字句の値
  # @return [Token]
  def initialize(type, value)
    @type = type
    @value = value
  end
end

# トークン列を表現する
class TokenSequence
  # @return [TokenSequence]
  def initialize
    # トークンの配列
    @tokens = []
    # 今見ているトークンの位置
    @pos = 0
  end

  # 数値をトークン列に追加する
  # @param [String] value 字句の値
  # @return [Nil]
  def push_number(value)
    @tokens.push(Token.new(TOKENKIND::NUMBER, value))
  end

  # 記号をトークン列に追加する
  # @param [String] value 字句の値
  # @return [Nil]
  def push_symbol(value)
    @tokens.push(Token.new(TOKENKIND::SYMBOL, value))
  end

  # 入力の終了をトークン列に追加する
  # @param [Nil]
  # @return [Nil]
  def push_eol
    @tokens.push(Token.new(TOKENKIND::EOL, ''))
  end

  # トークン列を表示する
  def show
    @tokens.each do |token|
      puts "#{token.type}(#{token.value})"
    end
  end

  # トークンの値を比較する
  # @param [String] value 比較する値
  # @return [Boolean] 一致するかどうか
  def value_is?(value)
    @tokens[@pos].value == value
  end

  # トークンの種類を比較する
  # @param [TOKENKIND] type 比較するタイプ
  # @return [Boolean] 一致するかどうか
  def type_is?(type)
    @tokens[@pos].type == type
  end

  # 期待するトークンかどうか調べる
  # @param [String] value 期待するトークン
  # @return [Boolean] 期待するトークンである
  def expect?(value)
    if value_is?(value)
      step
      true
    end
    warn "Error: #{value} expected but next token is #{@tokens[@pos].value}"
    false
  end

  # 閉じカッコを読み飛ばす
  # @param [Nil]
  # @return [Nil]
  def skip_close_blacket
    (step if value_is?(')'))
  end

  # トークンを1つ進める
  # @param [Nil]
  # @return [Nil]
  def step
    @pos += 1
  end

  # 現在の位置のトークンを取得し，その後トークンを1つ進める
  # @param [Nil]
  # @return [Token] トークン
  def step_with_getting
    step
    @tokens[@pos - 1]
  end
end
