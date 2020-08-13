# すでに存在していたクラス。(Adaptee)
# 複雑などの理由で手を加えられないとする。
class OldUnit
  attr_reader :sun, :kan, :tubo, :gou

  def initialize(sun, kan, tubo, gou)
    @sun = sun
    @kan = kan
    @tubo = tubo
    @gou = gou
  end

  def show_unit
    puts "#{@sun}寸"
    puts "#{@kan}貫"
    puts "#{@tubo}坪"
    puts "#{@gou}合"
  end
end
