from my_img import MyImg

# 最初はRGB画像で表示するとする
img = MyImg("景色.jpg", "rgb")
img.show_img()
img.show_square()

# グレー画像の場合
img = MyImg("夜景.jpg", "gray")
img.show_square()
# 途中で別のアルゴリズム(モザイク画像)に切り替えることも可能
img.set_printer("mosaic")
img.show_img()
img.show_square()
