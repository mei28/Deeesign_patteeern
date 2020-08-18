import cv2
import numpy as np
from matplotlib import pyplot as plt

from gray import GrayPrinter
from mosaic import MosaicPrinter
from rgb import RgbPrinter


class MyImg():
    """画像を表示するクラス
    表示する画像は固定されている

    Attributes
    ----------
    SRC_PATH : str
        画像の相対パス
    printer : ImgProc
        表示方法を定義したクラスのインスタンス
    """
    printer_dict = {
        "rgb": RgbPrinter(),
        "gray": GrayPrinter(),
        "mosaic": MosaicPrinter()
    }

    def __init__(self, img_path: str, printer_id: str = "rgb"):
        """
        Parameters
        ----------
        img_path : str
            画像ファイルのパス
        printer_id : str
            表示方法を決めるための識別子
            "rgb" or "gray" or "mosaic"
        """
        self.SRC_PATH = img_path
        self.set_printer(printer_id)
        self.img = cv2.imread(self.SRC_PATH)
        # グレー画像を表示するために必要
        plt.gray()

    def show_img(self):
        """画像をそのままの大きさで表示する
        """
        converted_img = self.printer.convert_full(self.img)
        self.__show(converted_img)

    def show_square(self):
        """画像を(480x480)に切り取って表示する
        """
        converted_img = self.printer.convert_square(self.img)
        self.__show(converted_img)

    def set_printer(self, printer_id: str):
        """表示方法を設定する
        コンストラクタで必ず呼ばれる

        Parameters
        ----------
        printer_id : str
            表示方法を決めるための識別子
            "rgb" or "gray" or "mosaic"
        """
        printer = self.printer_dict.get(printer_id, None)
        if printer is None:
            raise ValueError(f'printer_idは次から選んでください -> {list(printer_dict.keys())}')
        self.printer = printer

    def __show(self, converted_img: np.ndarray):
        """matplotlib.pyplotで表示する共通部分をメソッド化したもの

        Parameters
        ----------
        converted_img : np.ndarray
            画像処理後のNumPy配列
        """
        plt.imshow(converted_img)
        plt.axis("off")
        # 余白をなくしている
        plt.subplots_adjust(left=0, right=1, bottom=0, top=1)
        plt.show()
