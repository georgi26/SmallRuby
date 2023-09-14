module SR end

require_relative "lib/Tokenizer.rb"
require_relative "lib/parser/SmallRubyParser.rb"
require_relative "lib/emitter/JSEmitter.rb"

module SR
  def self.tokens(src)
    Tokenizer.new(src).tokens()
  end

  def self.parse(src)
    tokens = self.tokens(src)
    parser = Parser.new
    parser.parse(tokens)
  end

  def self.transpileToJS(src)
    expressions = self.parse(src)
    jsEmitter = JSEmitter.new(expressions)
    jsEmitter.emit
  end
end
