describe SR::JSEmitter do
  describe "When we give SR class with method" do
    before do
      @src = "
            x = 879 + 67
        "
    end
    it "Must be translated to correct JS" do
      result = SR.transpileToJS(@src)
      assert_equal "let x = new SRIntegerInstance(879).send(\"+\",[new SRIntegerInstance(67)]);", result
      baseJS = SR::JSEmitter.baseJS
      baseJS << "\n" << result << "\n console.log(x.variables[\"value\"])"
      output = `echo '#{baseJS}' | node `
      assert_equal "946\n", output
    end
  end

  describe "When we create class Fib with method fib that calculate 26 fibonatchi number" do
    before do
      @src = "
            class Fib
              def fib(n)
                (n < 2).ifTrue do
                  return 1
                end;
                return (self.fib(n-1)+self.fib(n-2))
              end
            end;
            fib = Fib.new;
            result = fib.fib(26);
        "
    end
    it "Must execute as 196418" do
      puts SR.parse(@src).map { |t| "[#{t}]" }
      result = SR.transpileToJS(@src)
      puts result
      baseJS = SR::JSEmitter.baseJS
      baseJS << "\n" << result << "\n console.log(result.variables[\"value\"])"
      output = `echo '#{baseJS}' | node `
      assert_equal "196418\n", output
    end
  end
end
