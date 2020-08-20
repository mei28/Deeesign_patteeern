require './formatter'
require 'json'

# JSON形式で提出するためのフォーマッタ
class JsonFormatter < Formatter
  # @param [String] title タイトル
  # @param [Array] body 本文の文言を改行で区切って配列にしたもの
  # @return [String] 整形後の文章
  def do_format(title, body)
    text_json = {
      'title' => title,
      'body' => body
    }
    JSON.pretty_generate(text_json)
  end
end
