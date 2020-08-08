# mainで使われるメゾットを持つ(Target)
class NewUnit
  # def metere; @metere; endみたいにインスタンス変数を外部で参照できるようになる。
  attr_reader :metere, :kiro_gram, :square_metre, :milli_liter

  def initialize(metere, kiro_gram, square_metre, milli_liter)
    @metere = metere
    @kiro_gram = kiro_gram
    @square_metre = square_metre
    @milli_liter = milli_liter
  end

  def show_unit
    puts "#{@metere}m"
    puts "#{@kiro_gram}Kg"
    puts "#{@square_metre}m^2"
    puts "#{@milli_liter}mL"
  end
end
