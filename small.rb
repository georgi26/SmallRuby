module SR end

require_relative "lib/Tokenizer.rb"
require_relative "lib/parser/SmallRubyParser.rb"

module SR
  def self.tokens(src)
    Tokenizer.new(src).tokens()
  end

  def self.parse(src)
    tokens = self.tokens(src)
    parser = Parser.new
    parser.parse(tokens)
  end
end
