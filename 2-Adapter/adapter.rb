require './old_unit'

# newでoldのメゾットを使うための変換アダプタ(Adapter)
class Adapter 
  def initialize(new_unit)
    @old_unit = OldUnit.new(new_unit.metere / 0.0303,
                            new_unit.kiro_gram / 3.75,
                            new_unit.square_metre / 3.3,
                            new_unit.milli_liter / 180.0)
  end

  def show
    @old_unit.show_unit
  end
end
