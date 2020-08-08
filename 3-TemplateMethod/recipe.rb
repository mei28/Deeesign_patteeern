class Recipe
  attr_reader :title, :foods

  # コンストラクタ
  # @param [String] title レシピ名
  # @param [Array] foods 使用する食材(切る必要があるもののみ)
  # @return [Nil]
  def initialize(title, foods=[])
    @title = title
    @foods = foods
  end
end

class Cooker

  # コンストラクタ
  # @param [Recipe] recipe レシピオブジェクト
  # @return [Nil]
  def initialize(title, foods=[])
    @recipe = Recipe.new(title, foods)
  end

  # テンプレートメソッド
  #
  # 調理する
  # @param [Nil]
  # @return [Nil]
  def cook
    show_title
    puts "-- 材料を切る --"
    cut
    puts "-- 下味をつける --"
    season
    puts "-- 加熱する --"
    heat
    puts "-- 味付けする --"
    flavor
    puts "-- 盛り付ける --"
    serve
  end

  # 作るものを宣言する
  # @param [Nil]
  # @return [Nil]
  def show_title
    puts "[#{@recipe.title}の作り方]"
  end

  # 材料を切る
  # @param [Nil]
  # @return [Nil]
  def cut
    @recipe.foods.each do |food|
      puts "    ・#{food}を切ります"
    end
  end

  # 下味をつける
  # @param [Nil]
  # @return [Nil]
  def season
    puts "    ・特になし"
  end

  # 加熱する
  # @param [Nil]
  # @return [Nil]
  def heat
  end

  # 味付けする
  # @param [Nil]
  # @return [Nil]
  def flavor
    puts "    ・特になし"
  end

  # 盛り付ける
  # @param [Nil]
  # @return [Nil]
  def serve
  end
end

class CurryCooker < Cooker
  def heat
    puts "    ・肉の色が変わるまで炒めます"
    puts "    ・中火で煮ます"
  end

  def flavor
    puts "    ・カレールウを入れます"
  end

  def serve
    puts "    ・スプーンを用意します"
    puts "    ・福神漬を添えます"
  end
end

class GingerPorkCooker < Cooker
  def season
    puts "    ・生姜，酒，醤油，みりんを混ぜます"
    puts "    ・30分冷蔵庫で寝かせます"
  end

  def heat
    puts "    ・中火で色が変わるまで焼きます"
  end

  def serve
    puts "    ・キャベツを盛ります"
    puts "    ・箸を用意します"
  end
end
