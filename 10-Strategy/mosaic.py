import cv2
import numpy as np

from img_processor import ImgProc


class MosaicPrinter(ImgProc):
    def __init__(self):
        """内部状態を持たないので空メソッド
        """
        pass

    def convert_full(self, img: np.ndarray) -> np.ndarray:
        """画像を受け取り，大きさを変えずに画像処理を施す

        Parameters
        ----------
        img : np.ndarray
            元の画像

        Returns
        -------
        np.ndarray
            画像処理後の画像
        """
        print("モザイクをかけて表示する")
        return self.__mosaic(img)

    def convert_square(self, img: np.ndarray) -> np.ndarray:
        """画像を受け取り，アイコンなどで使用できるように正方形に切り取った後，画像処理を施す

        Parameters
        ----------
        img : np.ndarray
            元の画像

        Returns
        -------
        np.ndarray
            画像処理後の画像
        """
        print("モザイクをかけて(480x480)に表示する")
        return self.__mosaic(self.trim(img))

    def __mosaic(self, src, ratio=0.08):
        """BGR画像にモザイク処理を施して，さらにRGB画像に変換する

        Parameters
        ----------
        img : np.ndarray
            元の画像
            cv2.imread()の返り値

        Returns
        -------
        np.ndarray
            モザイク処理後のRGB画像
        """
        small_img = cv2.resize(src, None, fx=ratio, fy=ratio, interpolation=cv2.INTER_NEAREST)
        ori_size_img = cv2.resize(small_img, src.shape[:2][::-1], interpolation=cv2.INTER_NEAREST)
        return cv2.cvtColor(ori_size_img, cv2.COLOR_BGR2RGB)
