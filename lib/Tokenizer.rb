module SR
  class Tokenizer
    KEYWORDS = ["module", "class", "def", "end"]
    OPERATORS = [",", ".", "(", ")", "+", "-", "*", "/"]
    CONST = :CONST

    def initialize(src)
      @src = src
    end

    def tokens()
      rawTokens = @src.split
      @result = []
      rawTokens.each do |token|
        parseToken(token)
      end
      @result
    end

    def parseToken(token)
      if (KEYWORDS.index(token))
        @result.push([token, token])
      elsif (OPERATORS.index(token))
        @result.push([token, token])
      elsif (parseTokenWithOperators(token))
      else
        @result.push([CONST, token])
      end
    end

    def parseTokenWithOperators(token)
      OPERATORS.each do |op|
        if (token.index(op))
          tokens = token.split(op)
          if (token.start_with?(op))
            @result.push([op, op])
          end
          tokens.each_with_index do |t, i|
            if (i > 0)
              @result.push([op, op])
            end
            parseToken(t)
          end
          if (token.end_with?(op))
            @result.push([op, op])
          end
          return true
        end
      end
      return false
    end
  end
end
