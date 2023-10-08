module SR
  class JSEmitter
    attr_reader :expressions

    EXP_HANDLERS = {
      :assign => lambda { |exp, context|
        trans = context.transpileExpression(exp[2])
        localVar = exp[1]
        context.setLocalVar(localVar)
        "let #{localVar} = #{trans}"
      },
      :number => lambda { |exp, context|
        "new SRIntegerInstance(#{exp[1]})"
      },
      :send => lambda { |exp, context|
        exp1 = exp[1]
        if (exp1.is_a? Array)
          exp1 = context.transpileExpression(exp1)
        elsif exp1 == "self" || context.isALocalVar(exp1)
          exp1 = exp1
        else
          exp1 = "SR_KERNEL.classess.#{exp1}"
        end
        messageName = exp[2]
        args = exp[3].map do |e|
          context.transpileExpression(e)
        end.join(",")
        block = "null"
        if (exp[4] && exp[4].length > 0)
          block = context.transpileExpression(exp[4])
        end
        "#{exp1}.send(\"#{messageName}\",[#{args}],#{block})"
      },
      :class => lambda { |exp, context|
        result = "SR_KERNEL.defineClass(\"#{exp[1]}\");"
        classContext = JSClassEmitter.new(exp[1], exp[2], context)
        result << "\n" << classContext.emit
      },
      :def => lambda { |exp, context|
        methodContext = JSDefEmmiter.new(exp[2], exp[4], context)
        argsJS = ""
        exp[3].each_with_index do |arg, index|
          methodContext.setLocalVar(arg)
          argsJS << "let #{arg} = args[#{index}];\n"
        end
        result = "SR_KERNEL.classess[\"#{context.className}\"].addMethod(
			new SRMethod(\"#{methodContext.methodName}\",#{exp[3].length},function(self,args){
				#{argsJS}
				#{methodContext.emit}
			}))"
        result
      },
      :return => lambda { |exp, context|
        "return " << context.transpileExpression(exp[1])
      },
    }

    def initialize(expressions, parent = nil)
      @expressions = expressions
      @localVars = []
      @parent = parent
    end

    def isALocalVar(varName)
      found = @localVars.index(varName)
      if (!found && @parent)
        found = @parent.isALocalVar(varName)
      end
      found
    end

    def setLocalVar(name)
      if (!isALocalVar(name))
        @localVars.push(name)
      end
    end

    def self.baseJS
      File.read("#{__dir__}/smallruby.js")
    end

    def emit()
      buffer = ""
      expressions.each do |exp|
        buffer << transpileExpression(exp) << ";\n"
      end
      buffer
    end

    def transpileExpression(exp)
      if (exp.length == 0)
        return ""
      end
      handler = EXP_HANDLERS[exp[0]]
      unless handler
        raise "Expression #{exp[0]} is not supported(#{exp})"
      end
      handler.call(exp, self)
    end
  end

  class JSClassEmitter < JSEmitter
    attr_reader :className

    def initialize(className, expressions, parent)
      super(expressions, parent)
      @className = className
    end
  end

  class JSDefEmmiter < JSEmitter
    attr_reader :methodName

    def initialize(methodName, expressions, parent)
      super(expressions, parent)
      @methodName = methodName
    end
  end

  class JSBlockEmmiter < JSEmitter
    attr_reader :methodName
  end
end
