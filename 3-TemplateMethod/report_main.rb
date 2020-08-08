require "./report"

SEPARATOR_COUNT = 40

title = "月次報告"
text = ["最高！", "順調", "普通"]

html_report = HTMLReport.new(title, text)
plaintext_report = PlainTextReport.new(title, text)

puts "=" * SEPARATOR_COUNT
html_report.output_report

puts "=" * SEPARATOR_COUNT
plaintext_report.output_report
