# mainで使われるメゾットを持つインターフェイス(Target)
class NewUnit
  def initialize(adapter_object)
    @adapter = adapter_object
  end

  def show
    @adapter.show
  end
end
