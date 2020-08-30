require './token'
require './ast'

# 構文解析器
class Parser
  def run(tokens)
    @tokens = tokens
    # 根が加減表現で，根から再帰的に構文解析をするから
    ast = expr_add
    ast
  end

  # 加減表現を解析する
  # @param [Nil]
  # @return [Ast] 解析後の抽象構文木
  def expr_add
    left = expr_mul
    loop do
      if @tokens.value_is?('+')
        @tokens.step
        left = Binary.new('+', left, expr_mul)
      elsif @tokens.value_is?('-')
        @tokens.step
        left = Binary.new('-', left, expr_mul)
      else
        return left
      end
    end
  end

  # 乗除表現を解析する
  # @param [Nil]
  # @return [Ast] 解析後の抽象構文木
  def expr_mul
    left = expr_primary
    loop do
      if @tokens.value_is?('*')
        @tokens.step
        left = Binary.new('*', left, expr_mul)
      elsif @tokens.value_is?('/')
        @tokens.step
        left = Binary.new('/', left, expr_mul)
      else
        return left
      end
    end
  end

  # その他の表現を解析する
  # @param [Nil]
  # @return [Ast] 解析後の抽象構文木
  def expr_primary
    loop do
      if @tokens.type_is?(TOKENKIND::NUMBER)
        return expr_num(@tokens.step_with_getting)
      elsif @tokens.value_is?('(')
        @tokens.step
        left = expr_add
        @tokens.skip_close_blacket
        return left
      else
        warn "???: #{@tokens.step_with_getting.value}"
        return nil
      end
    end
  end

  # 数値表現を解析する
  # @param [Nil]
  # @return [Ast] 解析後の抽象構文木
  def expr_num(token)
    Number.new(token.value)
  end
end
