class CloneableObject
    attr_accessor :name
    attr_accessor :array

    # コンストラクタ
    def initialize(name)
        @name = name
        @array = []
    end

    # cloneメソッド
    def clone
        obj = CloneableObject.new(@name)
        obj.array = @array.clone
        return obj
    end
end

if __FILE__ == $0

    str = "ほげほげ"
    str2 = "ふがふが"
    array = [str, str2]

    # CloneableObjectクラスのインスタンス
    a = CloneableObject.new("ぴよぴよ")
    a.array = array

    # クローンする
    b = a.clone

    # オリジナルとコピーが同じなのを確認
    puts "aの名前: #{a.name}, aの配列: #{a.array}"
    puts "bの名前: #{b.name}, bの配列: #{b.array}"

    puts "\n************\n\n"

    # コピーの内容を変更
    b.name = "fugafuga"
    b.array[1] = "hogehoge"

    # オリジナルとコピーの内容を再度確認
    puts "aの名前: #{a.name}, aの配列: #{a.array}"
    puts "bの名前: #{b.name}, bの配列: #{b.array}"
end