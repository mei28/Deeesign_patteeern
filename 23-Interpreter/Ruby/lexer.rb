require './token'

# 字句解析器
class Lexer
  # 字句解析をする
  # @param [String] input 入力値
  # @return [TokenSequence] トークン列
  def run(input)
    tokens = TokenSequence.new

    idx = 0
    # 入力された文字列を1文字ずつ見ていく
    while idx < input.length
      if digit?(input[idx])
        # 数値は2文字異常の場合があるので，探索する
        num, idx = seek_number(input, idx)
        tokens.push_number(num)
      elsif symbol?(input[idx])
        tokens.push_symbol(input[idx])
      elsif blank?(input[idx])
        nil
      else
        warn "invalid syntax: \" #{input[idx]} \""
      end
      idx += 1
    end

    tokens.push_eol
    tokens
  end
end

# 入力された文字列の現在の探索位置から，数値を1つ取得して返す
def seek_number(input, idx)
  num = ''
  while digit?(input[idx])
    num += input[idx]
    idx += 1
  end
  # ループ中の最後のインクリメントが余分なので1つ戻している
  idx -= 1
  [num, idx]
end

# 入力した文字列が数値かどうか判定する
# @param [String] input 入力値
# @return [Boolean] 数値かどうか
def digit?(input)
  input =~ /^[0-9]+$/
end

# 入力した文字列が記号かどうか判定する
# @param [String] input 入力値
# @return [Boolean] 記号かどうか
def symbol?(input)
  ['+', '-', '*', '/', '(', ')'].include?(input)
end

# 入力した文字列が空白かどうか判定する
# @param [String] input 入力値
# @return [Boolean] 空白かどうか
def blank?(input)
  input == ' '
end
