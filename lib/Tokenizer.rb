module SR
  class Tokenizer
    KEYWORDS = ["module", "class", "def", "end", "do", "while", "break", "return"]
    OPERATORS = ["=", ",", "(", ")", ".", ";"]
    SEND_OPERATORS = ["==", ">=", "<=", ">", "<", "+", "-", "*", "/"]
    CONST = :CONST
    NUMBER = :NUMBER
    STRING = :STRING
    NUMBER_REGEX = /^[0-9]+$/
    FLOAT_REGEX = /^[0-9]+\.[0-9]+$/

    def initialize(src)
      @src = src
    end

    def tokens()
      @result = []
      rawTokens = splitByOperators(@src)
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
      elsif (parseTokenWithOperators(token))
        return
      elsif (token.size == 0)
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

    def splitByOperators(token)
      result = []
      chars = token.chars
      index = 0
      size = token.size
      current = ""
      sendOperator = false
      while (index < size)
        char = chars[index]
        if (char == " " || char == "\n" || char == "\t")
          if (current.size > 0)
            result.push(current)
            current = ""
          end
          index = index + 1
          next
        end
        op = matchOperator(SEND_OPERATORS, char, index, chars)
        if (op)
          sendOperator = true
        else
          sendOperator = false
        end
        unless op
          op = matchOperator(OPERATORS, char, index, chars)
          if (op == "." && current.match(NUMBER_REGEX))
            current.concat(op)
            index = index + 1
            next
          end
        end
        if (op)
          if (current.size > 0)
            result.push(current)
            current = ""
          end
          if (sendOperator && result.last != ".")
            result.push(".")
          end
          result.push(op)
          index = index + op.size
        else
          current.concat(char)
          index = index + 1
        end
      end
      if (current.size > 0)
        result.push(current)
      end
      result
    end

    def matchOperator(ops, char, index, chars)
      ops.each do |op|
        if (op == char)
          return op
        elsif (op.size > 1 && op[0] == char)
          opChars = concatCharsToOperator(op.size, index, chars)
          if (op == opChars)
            return op
          end
        end
      end
      nil
    end

    def concatCharsToOperator(size, index, chars)
      result = ""
      limit = index + size
      sizeLimit = chars.size
      while (index < limit && index < sizeLimit)
        result.concat(chars[index])
        index = index + 1
      end
      result
    end

    def parseTokenWithOperators(token)
      if (OPERATORS.index(token))
        @result.push([token, token])
        return true
      end
      if (SEND_OPERATORS.index(token))
        @result.push([CONST, token])
        return true
      end
      tokens = splitByOperators(token)
      if (tokens.size > 1)
        tokens.each do |t|
          parseToken(t)
        end
        return true
      end
      return false
    end
  end
end
