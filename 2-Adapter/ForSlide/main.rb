require './adapter'
require './target'

student=Student.new(HumanAdapter.new("Hotsukai",20))
student.showName
student.showAge