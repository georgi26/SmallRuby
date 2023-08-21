module SR
  class Tokenizer
    KEYWORDS = ["module", "class", "def", "end"]
    OPERATORS = ["==", "=", ",", "(", ")", "+", "-", "*", "/", "."]
    CONST = :CONST
    NUMBER = :NUMBER
    STRING = :STRING
    NUMBER_REGEX = /^[0-9]+$/
    FLOAT_REGEX = /^[0-9]+\.[0-9]+$/

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
      elsif (parseString(token))
        return
      elsif parseNumber(token)
        return
      elsif (OPERATORS.index(token))
        @result.push([token, token])
      elsif (parseTokenWithOperators(token))
        return
      else
        @result.push([CONST, token])
      end
    end

    def parseString(token)
      if (token.start_with?("\"") && token.end_with?("\""))
        ready = token[1..token.size - 2]
        @result.push([STRING, ready])
        return true
      else
        return false
      end
    end

    def parseNumber(token)
      if (token.match NUMBER_REGEX)
        @result.push([NUMBER, token.to_i])
        return true
      elsif (token.match FLOAT_REGEX)
        @result.push([NUMBER, token.to_f])
        return true
      else
        return false
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
