# frozen_string_literal: true

require './parser'
require './lexer'
require './checker'

lexer = Lexer.new($stdin)
checker = Checker.new
parser = Parser.new(lexer, checker)
parser.parse
parser.code
