require "./old_unit"

# newでoldのメゾットを使うための変換アダプタ(Adapter)
class Adapter
  def initialize(sun, kan, tubo, gou)
    @old_unit = OldUnit.new(sun, kan, tubo, gou)
  end

  def show
    puts "#{@old_unit.sun / 33.0}m"
    puts "#{@old_unit.kan * 3.75}Kg"
    puts "#{@old_unit.tubo * 3.30579}m^2"
    puts "#{@old_unit.gou * 180.39}mL"
  end
end
