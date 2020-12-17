#!/usr/bin/ruby

class Code
  attr_reader :opcode, :level
  attr_accessor :offset

  def initialize(c, l, o)
    @opcode = c
    @level  = l
    @offset = o
  end
end


io = open("code.output", "r")

$cstack = []
$label  = {}
cindex  = 0
lindex  = 0


while line = io.gets

  /\(\s+([A-Z]+),\s+([0-9]+),\s+(\-?[0-9]+)\s+\)/ =~ line

  case $1
  when "LAB"
    $label[$3] = cindex
  else
    $cstack.push(Code.new($1, $2, $3))
    cindex +=1
  end
end

io.close

$cstack.each{|c|
  case c.opcode
  when "JMP", "JPC", "CAL"
    c.offset = $label[c.offset]
  end
}

$cstack.each_with_index{ |c, i|
  printf("%4d [ #{c.opcode}, #{c.level}, #{c.offset} ]\n", i)
}

#
# interpreter
#

$estack = []
$pc = 0
$sp = 0
$bp = 0

$estack.push 0
$estack.push 0
$estack.push 0


def sl(l)
  b1 = $bp
  while l>0 do
    b1 = $estack[b1]
    l = l - 1
  end
  b1
end

while true
  code = $cstack[$pc]
  case code.opcode
  when "LOD"
    spt = sl(code.level.to_i) + code.offset.to_i
    $estack.push($estack[spt])
    $sp += 1
    $pc += 1
  when "LIT"
    $estack.push(code.offset.to_i)
    $sp += 1
    $pc += 1
  when "STO"
    spt = sl(code.level.to_i) + code.offset.to_i
    $estack[spt] = $estack[$sp-1]
    $estack.pop
    $sp -= 1
    $pc += 1
  when "OPR" then
    case code.offset.to_i
    when 0
      $pc = $estack[$bp+2]
      if $pc == 0
        break
      else
        $sp = $bp
        $bp = $estack[$bp+1]
      end
    when 1  # unary -
      $estack[$sp-1] = - $estack[$sp-1]
    when 2  # +
      right = $estack.pop
      left  = $estack.pop
      $estack.push(left+right)
      $pc += 1
      $sp -= 1
    when 3  # -
      right = $estack.pop
      left  = $estack.pop
      $estack.push(left-right)
      $pc += 1
      $sp -= 1
    when 4 # *
      right = $estack.pop
      left  = $estack.pop
      $estack.push(left*right)
      $pc += 1
      $sp -= 1
    when 5 # /
      right = $estack.pop
      left  = $estack.pop
      $estack.push(left/right)
      $pc += 1
      $sp -= 1
    when 6 # odd
      left = $estack.pop
      $estack.push(left % 2)
      $pc += 1
    when 7 # nop
#      do nothing      
    when 8 # =
      right = $estack.pop
      left  = $estack.pop
      if left != right
        $estack.push 0
      else
        $estack.push 1
      end
      $sp -= 1
      $pc += 1
    when 9 # !=
      right = $estack.pop
      left  = $estack.pop
      if left != right
        $estack.push 1
      else
        $estack.push 0
      end
      $sp -= 1
      $pc += 1
    when 10 #<
      right = $estack.pop
      left  = $estack.pop
      if left < right
        $estack.push 1
      else
        $estack.push 0
      end
      $sp -= 1
      $pc += 1
    when 11 # >=
      right = $estack.pop
      left  = $estack.pop
      if left >= right
        $estack.push 1
      else
        $estack.push 0
      end
      $sp -= 1
      $pc += 1
    when 12 # >
      right = $estack.pop
      left  = $estack.pop
      if left > right
        $estack.push 1
      else
        $estack.push 0
      end
      $sp -= 1
      $pc += 1
    when 13 # =<
      right = $estack.pop
      left  = $estack.pop
      if left <= right
        $estack.push 1
      else
        $estack.push 0
      end
      $sp -= 1
      $pc += 1
    end
  when "INT"
    # assume that the first 3 elements are set by CAL.
    $sp += 3
    tmp = code.offset.to_i - 3
    tmp.times{ |i|
      $estack.push 0
    }
    $sp+=tmp
    $pc+=1
  when "JMP"
    $pc = code.offset.to_i
  when "JPC"
    cond = $estack.pop
    $sp -= 1
    if cond == 0 
      $pc = code.offset.to_i
    else
      $pc += 1
    end
  when "CAL"
    $estack.push(sl(code.level.to_i+1))
    $estack.push($bp)
    $estack.push($pc+1)
    $bp = $sp
    $pc = code.offset.to_i
  when "CSP"
    case code.offset.to_i
    when 0 # read
      rinput = $stdin.gets
      $estack.push rinput.to_i
      $sp += 1
      $pc += 1
    when 1 # write
      print $estack.pop
      $pc += 1
      $sp -= 1
    when 2 # writeln
      print "\n"
      $pc += 1
    end
  when "RET"
    tmp = $estack.pop
    tmp2 = $bp
    $pc = $estack[$bp+2]
    $bp = $estack[$bp+1]
    ($sp-tmp2+code.offset.to_i-1).times{|i|
      $estack.pop
    }
    $estack.push tmp
    $sp = $estack.length
  when "ALD"
    tmp = $estack.pop
    spt = sl(code.level.to_i) + code.offset.to_i + tmp
    $estack.push($estack[spt])
    $pc += 1
  when "AST"
    tmp = $estack.pop
    spt = sl(code.level.to_i) + code.offset.to_i + tmp
    $estack[spt] = $estack.pop
    $sp -= 2
    $pc += 1
  end
end
