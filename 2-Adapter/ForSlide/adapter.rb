require "./adaptee"

class HumanAdapter < Human
  def initialize(name, age)
    @human = Human.new(name, age)
  end

  def showName
    @human.printName
  end

  def showAge
    @human.printAge
  end
end
