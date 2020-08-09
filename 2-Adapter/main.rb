#Targetのメゾットを呼び出す(Client)
require './adapter'
require './new_unit'

new_unit = NewUnit.new(100, 100, 100, 100)
new_unit.show_unit

# new_unitからold_unitをつかいたいのでadapterをつくる。
adapter = Adapter.new(new_unit)
adapter.show
