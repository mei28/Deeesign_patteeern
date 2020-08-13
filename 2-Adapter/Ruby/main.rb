#Targetのメゾットを呼び出す(Client)
require './adapter'
require './new_unit'

new_unit = NewUnit.new(Adapter.new(100, 100, 100, 100))
new_unit.show
