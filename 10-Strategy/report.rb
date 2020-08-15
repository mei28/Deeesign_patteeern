# 以下のコードを参考にした
# https://github.com/nipe0324/design_patterns_ruby/blob/master/strategy/report.rb

# 報告書を表現するクラス
# @!attribute [r] title
#   タイトル
# @!attribute [r] text
#   本文
# @!attribute [rw] formatter
#   報告書を整形するためのクラス
class Report
  attr_reader :title, :body
  attr_accessor :formatter

  # @param [Formatter] 報告書を整形するクラス
  # @return [Nil]
  def initialize(formatter)
    @title = '月次報告'
    @body = ['最高！', '順調', '普通']
    @formatter = formatter
  end

  # 整形後の報告書を表示する
  # @param [Nil]
  # @return [Nil]
  def print_output
    puts @formatter.do_format(@title, @body)
  end
end
