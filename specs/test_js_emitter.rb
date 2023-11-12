describe SR::JSEmitter do
  describe "When we sum two integers" do
    before do
      @src = "
            x = 879 + 67
        "
    end
    it "Must be translated to correct JS and get correct result" do
      result = SR.transpileToJS(@src)
      assert_equal "let x = new SRIntegerInstance(879).send(\"+\",[new SRIntegerInstance(67)],null,null);\n", result
      baseJS = SR::JSEmitter.baseJS
      baseJS << "\n" << result << "\n console.log(x.variables[\"value\"])"
      output = `echo '#{baseJS}' | node `
      assert_equal "946\n", output
    end
  end

  describe "When we Give a method that take 2 arguments " do
    before do
      @src = "
        class MyClass1
          def sum(i, ii)
            i + ii 
          end
        end;
        myClass = MyClass1.new;
        x = myClass.sum(3,6)
        "
    end
    it "Must be translated to correct JS and get correct result" do
      result = SR.transpileToJS(@src)
      baseJS = SR::JSEmitter.baseJS
      baseJS << "\n" << result << "\n console.log(x.variables[\"value\"])"
      output = `echo '#{baseJS}' | node `
      assert_equal "9\n", output
    end
  end

  describe "When we give a method with block " do
    before do
      @src = "
        class MyClass1
          def moreThan10(i)
            (i > 10).ifTrue do 
              return true
            end;
            false
          end
        end;
        myClass = MyClass1.new;
        x = myClass.moreThan10(20)
        "
    end
    it "Must be translated to correct JS and get correct result" do
      result = SR.transpileToJS(@src)
      baseJS = SR::JSEmitter.baseJS
      baseJS << "\n" << result << "\n console.log(x.variables[\"value\"])"
      output = `echo '#{baseJS}' | node `
      assert_equal "true\n", output
    end
  end

  describe "When we create class Fib with method fib that calculate 26 fibonatchi number" do
    before do
      @src = "
            class Fib
              def fib(n)
                (n <= 2).ifTrue do
                  return 1
                end;
                f1 = self.fib(n-1);
                f2 = self.fib(n-2);
                r = f1 + f2 ;
                return r
              end
            end;
            fib = Fib.new;
            result = fib.fib(20);
        "
    end
    it "Must execute as 196418" do
      result = SR.transpileToJS(@src)
      baseJS = SR::JSEmitter.baseJS
      baseJS << "\n" << result << "\n console.log(result.variables[\"value\"])"
      puts "===="
      puts baseJS
      puts "======"
      output = `echo '#{baseJS}' | node `
      assert_equal "6765\n", output
    end
  end
end
