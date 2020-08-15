# 以下のコードを参考にした
# https://github.com/nipe0324/design_patterns_ruby/blob/master/strategy/plain_text_formatter.rb

require './formatter'

# プレーンテキスト形式で提出するためのフォーマッタ
class PlainTextFormatter < Formatter
  # @param [String] title タイトル
  # @param [Array] body 本文の文言を改行で区切って配列にしたもの
  # @return [String] 整形後の文章
  def do_format(title, body)
    formatted_text = "***** #{title} *****\n\n"
    body.each do |line|
      formatted_text += "#{line}\n"
    end
    formatted_text
  end
end
