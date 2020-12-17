# これは??
ソフトウェア構成の授業で作った、milという独自言語のインタープリターです。
# 実行方法
```
cat <path/to/mil/file> | ruby main.rb | ruby pl0id.rb
```
- milファイルを入力し`ruby main.rb`を実行することでoutputの中間言語が出力されます。
- 中間言語を入力し`ruby pl0id.rb`を実行することでmil言語を実行できます。