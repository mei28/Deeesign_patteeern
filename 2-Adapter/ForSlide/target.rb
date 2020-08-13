require './adaptee.rb'
class Student <Human

  def initialize(adapter)
    @adapter = adapter
  end

  def showName
    @adapter.showName
  end

  def showAge
    @adapter.showAge
  end
end
