# 以下のコードを参考にした
# https://github.com/nipe0324/design_patterns_ruby/blob/master/strategy/main.rb

require './report'
require './html_formatter'
require './plain_text_formatter'
require './json_formatter'

puts '===== HTML形式の場合 ====='
report = Report.new(HTMLFormatter.new)
report.print_output

puts '===== プレーンテキスト形式の場合 ====='
report.formatter = PlainTextFormatter.new
report.print_output

puts '===== JSON形式の場合 ====='
report.formatter = JsonFormatter.new
report.print_output
