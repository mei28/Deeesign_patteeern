class Lexer
  def initialize(f)
    @srcf=f
    @line=""
    @linenumber=0
    @keywords = {
      "var" => :var, 
      "print" => :print,
      "for" => :for,
      "to" => :to,
      "downto" => :downto,
      "do" => :do,
      "end" => :end
    }
  end

  attr_reader :linenumber

  def lex()
    if /^\s+/ =~ @line
      @line = $'
    end
    while @line.empty? do
      @line = @srcf.gets
      if @line == nil
        return :eof
      end
      @linenumber += 1
      if /\A\s+/ =~ @line
        @line = $'
      end
    end

    case @line
    when /\A,/
      yield $&
      token = :comma
    when /\A;/
      yield $&
      token = :semi
    when /\A:=/
      yield $&
      token = :coleq
    when /\A\(/
      yield $&
      token = :lpar
    when /\A\)/
      yield $&
      token = :rpar
    when /\A\+/
      yield $&
      token = :op
    when /\A-/
      yield $&
      token = :op
    when /\A\*/
      yield $&
      token = :op
    when /\A\//
      yield $&
      token = :op
    when /\A\d+/
      yield $&
      token = :num
    when /\A[a-z]+/
      kw = @keywords[$&]
      if kw then
        token = kw
      else
        token = :id
      end
      yield $&
    when /\A\S/
      # ignore
      token = :other
    end
    @line = $'
#    puts "matched is #{token}(#{$&})"
    return token
  end
end
