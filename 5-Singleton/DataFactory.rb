require 'singleton'

class DataFactory
  include Singleton
end

dataFactory1 = DataFactory.instance
dataFactory2 = DataFactory.instance

# 同じであることが確認できる
p [dataFactory1,dataFactory2] 

