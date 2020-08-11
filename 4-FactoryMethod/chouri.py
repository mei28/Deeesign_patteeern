from abc import ABCMeta, abstractmethod

#---Recipe---#

# レシピの抽象クラス
class Recipe(metaclass=ABCMeta):
    """レシピの抽象クラス

    Parameters
    ----------
    metaclass : [type], optional
        [description], by default ABCMeta
    """
    @abstractmethod
    def __init__(self, shokuzai):
        """コンストラクタ

        Parameters
        ----------
        shokuzai : list 
            食材たち
        """
        self.shokuzai = shokuzai

class Cookpad(Recipe):
    """Recipeを継承したCookpadクラス

    Parameters
    ----------
    Recipe : String 
        cookpadのレシピをみる
    """
    def __init__(self, shokuzai):
        super().__init__(shokuzai)
        self.recipe = 'Cookpad'


class Kurashiru(Recipe):
    """Recipeを継承したKurashiruクラス

    Parameters
    ----------
    Recipe : String 
        kurashiruのレシピをみる
    """
    def __init__(self, shokuzai):
        super().__init__(shokuzai)
        self.recipe = 'Kurashiru'

#---Template Method---#


class Shoshinsya_Chouri(metaclass=ABCMeta):
    """初心者の調理方法のクラス
    Raises
    ------
    NotImplemented
        [食材を切る抽象メソッド]
    NotImplemented
        [食材を焼く抽象メソッド]
    NotImplemented
        [食材を煮込む抽象メソッド]
    """
    @abstractmethod
    def kiru(self):
        raise NotImplemented

    @abstractmethod
    def yaku(self):
        raise NotImplemented

    @abstractmethod
    def nikomu(self):
        raise NotImplemented

    def chouri(self):
        """調理を行うメソッド
        """
        # ここでCookpadしか選べなくなっている
        cookpad = Cookpad(self.shokuzai)
        self.kiru(cookpad.recipe)
        self.yaku(cookpad.recipe)
        self.nikomu(cookpad.recipe)
        print("できた！")


class Shoshinsya(Shoshinsya_Chouri):
    def __init__(self, shokuzai):
        self.shokuzai = shokuzai

    def kiru(self, cookpad):
        print(f'{cookpad}を参考にして{self.shokuzai}を切るぞ')

    def yaku(self, cookpad):
        print(f'{cookpad}を参考にして{self.shokuzai}を焼いていく')

    def nikomu(self, cookpad):
        print(f'{cookpad}を参考にして{self.shokuzai}を煮込むよ')

#---Factory Method---#

class Chukyusha_Chouri(metaclass=ABCMeta):
    """中級者の料理方法のクラス
    """
    @abstractmethod
    def kiru(self):
        raise NotImplemented

    @abstractmethod
    def yaku(self):
        raise NotImplemented

    @abstractmethod
    def nikomu(self):
        raise NotImplemented

    def chouri(self):
        # サブクラスに何をつかうかを任せる
        recipe = self.nanidetsukuru()
        self.kiru(recipe.recipe)
        self.yaku(recipe.recipe)
        self.nikomu(recipe.recipe)
        print("できた！")

    @abstractmethod
    def nanidetsukuru(self):
        # サブクラスでどのレシピを使うかを任せる
        raise NotImplementedError


class Chukyusha(Chukyusha_Chouri):
    def __init__(self, shokuzai):
        self.shokuzai = shokuzai

    def kiru(self, recipe):
        print(f'{recipe}を参考にして{self.shokuzai}を切るぞ')

    def yaku(self, recipe):
        print(f'{recipe}を参考にして{self.shokuzai}を焼いていく')

    def nikomu(self, recipe):
        print(f'{recipe}を参考にして{self.shokuzai}を煮込むよ')

    def nanidetsukuru(self):
        # 使うレシピを任されたところ
        return Kurashiru(self.shokuzai)
