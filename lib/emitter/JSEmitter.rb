module SR
  class JSEmitter
    attr_reader :expressions, :parent, :unique

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
      :boolean => lambda { |exp, context|
        if (exp[1] == "true")
          "SR_KERNEL.classess.Boolean.trueInstance"
        else
          "SR_KERNEL.classess.Boolean.falseInstance"
        end
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
        classContext = JSClassEmitter.new(exp, context)
        classContext.emit
      },
      :def => lambda { |exp, context|
        methodContext = JSDefEmmiter.new(exp, context)
        methodContext.emit
      },
      :return => lambda { |exp, context|
        "return " << context.transpileExpression(exp[1])
      },
      :block => lambda { |exp, context|
        blockContext = JSBlockEmmiter.new(exp, context)
        blockContext.emit
      },
    }

    def initialize(expressions, parent = nil, unique = 0)
      @expressions = expressions
      @localVars = []
      @parent = parent
      if (parent)
        unique = parent.unique
      end
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
      elsif (exp.is_a? String)
        return exp
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

    def initialize(exp, parent)
      super(exp[2], parent)
      @className = exp[1]
    end

    def emit
      result = "SR_KERNEL.defineClass(\"#{className}\");"
      result << "\n" << super
      result
    end
  end

  class JSDefEmmiter < JSEmitter
    attr_reader :methodName, :args

    def initialize(exp, parent)
      super(exp[4], parent)
      @methodName = exp[2]
      @args = exp[3]
      if (expressions.last[0] != :return)
        last = expressions.pop
        expressions.push([:return, last])
      end
    end

    def emit
      argsJS = ""
      args.each_with_index do |arg, index|
        self.setLocalVar(arg)
        argsJS << "let #{arg} = args[#{index}];\n"
      end
      result = "SR_KERNEL.classess[\"#{parent.className}\"].addMethod(
    new SRMethod(\"#{methodName}\",#{args.length},function(self,args){
      #{argsJS}
      #{super}
    }))"
      result
    end
  end

  class JSBlockEmmiter < JSEmitter
    attr_reader :args

    def initialize(exp, parent)
      super(exp[2], parent)
      @args = exp[1]
    end

    def emit
      argsJS = ""
      args.each_with_index do |arg, index|
        self.setLocalVar(arg)
        argsJS << "let #{arg} = args[#{index}];\n"
      end

      "new SRBlock(()=>{#{super}})"
    end
  end
end
