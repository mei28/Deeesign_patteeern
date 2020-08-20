import cv2
import numpy as np

from img_processor import ImgProc


class RgbPrinter(ImgProc):
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
        print("RGB画像で表示する")
        return self.__bgr2rgb(img)

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
        print("RGB画像で(480x480)に表示する")
        return self.__bgr2rgb(self.trim(img))

    def __bgr2rgb(self, img: np.ndarray) -> np.ndarray:
        """BGR画像をRGB画像に変換する

        Parameters
        ----------
        img : np.ndarray
            元の画像
            cv2.imread()の返り値

        Returns
        -------
        np.ndarray
            RGB画像
        """
        return cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
