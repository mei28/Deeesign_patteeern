from abc import ABC

import numpy as np


class ImgProc(ABC):
    """画像処理を行う抽象クラス
    インタフェース定義のため
    """
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
        raise NotImplementedError

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
        raise NotImplementedError

    def trim(self, img: np.ndarray) -> np.ndarray:
        """(480x480)にトリミングする

        Parameters
        ----------
        img : np.ndarray
            元の画像

        Returns
        -------
        np.ndarray
            トリミング後の画像
        """
        img_height = img.shape[0]
        img_width = img.shape[1]
        # img[top : bottom, left : right]
        return img[
            int(img_height / 2 - 240): int(img_height / 2 + 240),
            int(img_width / 2 - 240): int(img_width / 2 + 240)]
