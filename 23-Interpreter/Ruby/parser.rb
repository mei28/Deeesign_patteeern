require './token'
require './node'

# 構文解析器
class Parser
  # @param [TokenSequence] tokens トークン列
  # @return [Node] 解析後の抽象構文木
  def parse(tokens)
    @tokens = tokens
    parse_add
  end

  # 加減表現を解析する
  # @param [Nil]
  # @return [Node] 解析後の抽象構文木
  def parse_add
    left = parse_mul
    loop do
      if @tokens.value_is?('+')
        @tokens.step
        left = AddNode.new(left, parse_mul)
      elsif @tokens.value_is?('-')
        @tokens.step
        left = SubNode.new(left, parse_mul)
      else
        return left
      end
    end
  end

  # 乗除表現を解析する
  # @param [Nil]
  # @return [Node] 解析後の抽象構文木
  def parse_mul
    left = parse_primary
    loop do
      if @tokens.value_is?('*')
        @tokens.step
        left = MulNode.new(left, parse_mul)
      elsif @tokens.value_is?('/')
        @tokens.step
        left = DivNode.new(left, parse_mul)
      else
        return left
      end
    end
  end

  # その他の表現を解析する
  # @param [Nil]
  # @return [Node] 解析後の抽象構文木
  def parse_primary
    loop do
      if @tokens.type_is?(TOKENKIND::NUMBER)
        return parse_num(@tokens.step_with_getting)
      elsif @tokens.value_is?('(')
        @tokens.step
        left = parse_add
        @tokens.skip_close_blacket
        return left
      else
        warn "???: #{@tokens.step_with_getting.value}"
        return nil
      end
    end
  end

  # 数値を解析する
  # @param [Token] トークン
  # @return [Node] 解析後の抽象構文木
  def parse_num(token)
    NumNode.new(token.value)
  end
end
