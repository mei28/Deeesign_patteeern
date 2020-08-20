# 以下のコードを参考にした
# https://github.com/nipe0324/design_patterns_ruby/blob/master/strategy/html_formatter.rb

require './formatter'

# HTML形式で提出するためのフォーマッタ
class HTMLFormatter < Formatter
  # @param [String] title タイトル
  # @param [Array] body 本文の文言を改行で区切って配列にしたもの
  # @return [String] 整形後の文章
  def do_format(title, body)
    # head要素を作成
    formatted_title = "    <title>#{title}</title>\n"
    formatted_title = _surround_str_with_tags(formatted_title, 'head', 2)

    # body要素を作成
    formatted_body = ''
    body.each do |line|
      formatted_body += "    <p>#{line}</p>\n"
    end
    formatted_body = _surround_str_with_tags(formatted_body, 'body', 2)

    # head要素とbody要素を連結して<html>で囲む
    formatted_text = formatted_title + formatted_body
    formatted_text = _surround_str_with_tags(formatted_text, 'html', 0)
    formatted_text
  end

  # 文章の上下をタグで囲む
  # @param [String] ori_text 元の文章
  # @param [String] tag_name タグ名
  # @param [Integer] space_num_for_indent タグの前に入れるスペースの数
  # @return [String] タグで囲んだあとの文章
  def _surround_str_with_tags(ori_text, tag_name, space_num_for_indent)
    indent = ' ' * space_num_for_indent
    surrounded_text = indent + "<#{tag_name}>\n"
    surrounded_text += ori_text
    surrounded_text += indent + "</#{tag_name}>\n"
    surrounded_text
  end
end
