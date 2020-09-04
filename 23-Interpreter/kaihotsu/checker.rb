# frozen_string_literal: true

class Checker
  def initialize
    @ids_hash = {}
  end

  def add_id(name, _value)
    # puts "debug #{name}"
    if @ids_hash.key?(name)
      puts "#{name} is already declared!!"
      exit(1)
    else
      @ids_hash[name] = hash_len
    end
  end

  def search(name)
    unless @ids_hash[name]
      puts "#{name} is not  declared!! at mStmt"
      exit(1)
    end
    @ids_hash[name]
  end

  def hash_len
    @ids_hash.length
  end
end
