# cite: https://qiita.com/kidach1/items/7c2a80bfc8a87a05051f

class Report

  # コンストラクタ
  # @param [String] title 報告書のタイトル
  # @param [Array] text_list 内容の配列
  # @return [Nil]
  def initialize(title, text_list)
    @title = title
    @text = text_list
  end

  # テンプレートメソッド
  # 抽象メソッドを用いて処理手順のみを記述する
  #
  # 報告書を作成する
  # @param [Nil]
  # @return [Nil]
  def output_report
    output_start
    output_title
    output_body_start
    @text.each do |line|
      output_line(line)
    end
    output_body_end
    output_end
  end

  # ここからは抽象メソッド
  # 具体的な処理はサブクラスで実装する

  # 報告書のヘッダを記述する
  # @param [Nil]
  # @return [Nil]
  def output_start
  end

  # 報告書のタイトルを記述する
  # @param [Nil]
  # @return [Nil]
  def output_title
    output_line(@title)
  end

  # 報告書のボディの開始タグを記述する
  # @param [Nil]
  # @return [Nil]
  def output_body_start
  end

  # 報告書のヘッダを記述する
  # 全サブクラスでオーバーライドする必要がある
  # 実装しないと実行時にエラーになる
  # @param [String] line 本文の1行
  # @return [Nil]
  def output_line(line)
    raise 'Called abstract method: output_line'
  end

  # 報告書のボディの終了タグを記述する
  # @param [Nil]
  # @return [Nil]
  def output_body_end
  end

  # 報告書のフッタを記述する
  # @param [Nil]
  # @return [Nil]
  def output_end
  end
end

# HTML形式の場合の実装
class HTMLReport < Report
  def output_start
    puts('<html>')
  end

  def output_title
    puts('  <head>')
    puts("    <title>#{@title}</title>")
    puts('  </head>')
  end

  def output_body_start
    puts('  <body>')
  end

  def output_line(line)
    puts("    <p>#{line}</p>")
  end

  def output_body_end
    puts('  </body>')
  end

  def output_end
    puts('</html>')
  end
end

# プレーンテキスト形式の場合の実装
class PlainTextReport < Report
  def output_title
    puts("*** #{@title} ***")
  end

  def output_line(line)
    puts(line)
  end
end
