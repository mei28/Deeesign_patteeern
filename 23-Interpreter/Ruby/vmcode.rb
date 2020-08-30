# frozen_string_literal: true

# 四則演算に必要な命令群
module OPCODE
  PUSH = 'Push'
  ADD = 'Add'
  SUB = 'Sub'
  MUL = 'Mul'
  DIV = 'Div'
end

# 実行コード
class VmCode
  attr_reader :type, :value

  # @param [OPCODE] opcode 演算の種類
  # @param [Integer] value PUSHのオペランド, その他の演算のときはnil
  def initialize(opcode, value)
    @type = opcode
    # PUSH命令のときだけ値を格納する
    @value = @type == OPCODE::PUSH ? value : nil
  end
end
