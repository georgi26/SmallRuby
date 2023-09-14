module SR
  class JSEmitter
    attr_reader :expressions

    EXP_HANDLERS = {
      :assign => lambda { |exp, context|
        trans = context.transpileExpression(exp[2])
        "let #{exp[1]} = #{trans}"
      },
      :number => lambda { |exp, context|
        "new SRIntegerInstance(#{exp[1]})"
      },
      :send => lambda { |exp, context|
        exp1 = context.transpileExpression(exp[1])
        messageName = exp[2]
        args = exp[3].map do |e|
          context.transpileExpression(e)
        end.join(",")
        "#{exp1}.send(\"#{messageName}\",[#{args}])"
      },
    }

    def initialize(expressions)
      @expressions = expressions
    end

    def self.baseJS
      File.read("#{__dir__}/smallruby.js")
    end

    def emit()
      buffer = ""
      expressions.each do |exp|
        buffer << transpileExpression(exp)
      end
      buffer
    end

    def transpileExpression(exp)
      handler = EXP_HANDLERS[exp[0]]
      unless handler
        raise "Expression #{exp[0]} is not supported"
      end
      handler.call(exp, self)
    end
  end
end
