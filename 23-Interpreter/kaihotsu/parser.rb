# frozen_string_literal: true

class Parser
  def initialize(lexer, checker)
    @lexer = lexer
    @checker = checker
    @pl_code = ''
  end

  def parse
    @token = @lexer.lex do |l|
      @lexime = l
    end
    mProgram
  end

  def code
    puts @pl_code
  end

  private

  def checktoken(f, expected)
    # puts "debug : #{@token} : #{@lexime} : #{f}"
    if @token == expected
      @token = @lexer.lex do |l|
        @lexime = l
      end
    else
      puts "syntax error (#{f}): #{expected} is expected"
      exit(1)
    end
  end

  def mDirect
    case @token
    when :to
      checktoken('mDirect', :to)
    when :downto
      checktoken('mDirect', :downto)
    else
      puts "syntax error at mDirect : expected 'to' or 'downto'  but input is #{@lexime} (#{@token})"
      exit(1)
    end
  end

  def mForst
    checktoken('mForst', :for)
    offset = @checker.search(@lexime)
    checktoken('mForst', :id)
    checktoken('mForst', :coleq)
    mSexp # この時点でスタックトップにsexpの結果の数字が入ってる
    # #条件文###
    # 初期化はじめ
    @pl_code += "( STO, 0, #{offset + 3} )\n" # スタックトップをpopして変数に記録
    @pl_code += "( LOD, 0, #{offset + 3} )\n" # スタックトップに変数をプッシュ.........①
    case @token
    when :to
      @pl_code += "( LIT, 0, 1 )\n" # スタックトップに1をプッシュ........②
      @pl_code += "( OPR, 0, 3 )\n" # 変数-1がスタックトップ
    when :downto
      @pl_code += "( LIT, 0, 1 )\n" # スタックトップに1をプッシュ........②
      @pl_code += "( OPR, 0, 2 )\n" # 変数+1がスタックトップ
    end
    # #初期化終わり
    @pl_code += "( LAB, 0, 1 )\n" # ジャンプ先のラベル1を定義

    # 変数を+-1して更新
    @pl_code += "( LIT, 0, 1 )\n" # スタックトップに1をプッシュ........②
    case @token
    when :to
      @pl_code += "( OPR, 0, 2 )\n" # ①②を足す...③
      @pl_code += "( STO, 0, #{offset + 3} )\n" # スタックトップをpopして変数に記録
      @pl_code += "( LOD, 0, #{offset + 3} )\n" # スタックトップに変数をプッシュ.........①
      @pl_code += "( LIT, 0, 1 )\n" # スタックトップに1をプッシュ........②
      @pl_code += "( OPR, 0, 3 )\n" # 変数-1がスタックトップ
    when :downto
      @pl_code += "( OPR, 0, 3 )\n" # ①②を引く...③
      @pl_code += "( STO, 0, #{offset + 3} )\n" # スタックトップをpopして変数に記録
      @pl_code += "( LOD, 0, #{offset + 3} )\n" # スタックトップに変数をプッシュ.........①
      @pl_code += "( LIT, 0, 1 )\n" # スタックトップに1をプッシュ........②
      @pl_code += "( OPR, 0, 2 )\n" # 変数+1がスタックトップ
    end
    mDirect
    mSexp # この時点でスタックトップにsexpの結果の数字が入ってる .....⑤
    @pl_code += "( OPR, 0, 3 )\n" # (変数-+1)-⑤がスタックトップ

    # ##条件文####
    @pl_code += "( JPC, 0, 2 )\n" # スタックトップが0なら2へジャンプ

    checktoken('mForst', :do)
    mStmts
    @pl_code += "( LOD, 0, #{offset + 3} )\n"
    @pl_code += "( JMP, 0, 1 )\n" # 1へジャンプ
    @pl_code += "( LAB, 0, 2 )\n"
    checktoken('mForst', :end)
  end

  def mSexp
    case @token
    when :num
      num = @lexime
      @pl_code += "( LIT, 0, #{num} )\n"
      checktoken('mSexp', :num)
    when :id
      offset = @checker.search(@lexime)
      @pl_code += "( LOD, 0, #{offset + 3} )\n"
      checktoken('mSexp', :id)
    when :lpar
      checktoken('mSexp', :lpar)
      operator = @lexime
      checktoken('mSexp', :op)

      num_count = 0
      loop do
        mSexp
        num_count += 1
        if num_count > 1
          case operator
          when '+'
            @pl_code += "( OPR, 0, 2 )\n"
          when '-'
            @pl_code += "( OPR, 0, 3 )\n"
          when '*'
            @pl_code += "( OPR, 0, 4 )\n"
          when '/'
            @pl_code += "( OPR, 0, 5 )\n"
          end
        end
        break if @token != :num && @token != :id && @token != :lpar
      end
      num_count = 0
      checktoken('mSexp', :rpar)

    else
      puts "syntax error at mSexp : expected 'NUM' or 'ID' or '(' but input is #{@lexime} (#{@token})"
      exit(1)
    end
  end

  def mPrints
    checktoken('mPrints', :print)
    mSexp
    @pl_code += "( CSP, 0, 1 )\n"
    @pl_code += "( CSP, 0, 2 )\n"
  end

  def mAssign
    offset = @checker.search(@lexime)
    checktoken('mAssign', :id)
    checktoken('mAssign', :coleq)
    mSexp
    @pl_code += "( STO, 0, #{offset + 3} )\n"
  end

  def mStmt
    case @token
    when :id
      @checker.search(@lexime)
      mAssign
    when :print
      mPrints
    when :for
      mForst
    end
  end

  def mStmts
    mStmt
    while @token == :semi
      checktoken('mStmts', :semi)
      mStmt
    end
  end

  def mIds
    @checker.add_id(@lexime, 0)
    checktoken('mIds', :id)
    while @token == :comma
      checktoken('mIds', :comma)
      @checker.add_id(@lexime, 0)
      checktoken('mIds', :id)
    end
  end

  def mDecl
    checktoken('mDecl', :var)
    mIds
    checktoken('mDecl', :semi)
  end

  def mProgram
    mDecl while @token == :var
    @pl_code += "( INT, 0, #{@checker.hash_len + 3} )\n"
    mStmts
    @pl_code += "( OPR, 0, 0 )\n"
    if @token != :eof
      puts "Error : expect :eof but #{@token}:#{@lexime}"
      exit(1)
    end
  end
end
