# 報告書を整形するための抽象クラス
class Formatter
  # @param [String] title タイトル
  # @param [Array] body 本文の文言を改行で区切って配列にしたもの
  # @return [String] 整形後の文章
  def do_format(title, body)
    raise NotImplementedError
  end
end
