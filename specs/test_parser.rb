describe "SmallParser" do
  describe "We need simple parser that can parse module" do
    before do
      @src = "
      module MyTestModule  
      end"
    end

    it "Has to parse correct s-expression for module with name MyTestModule" do
      result = SR.parse(@src)
      assert_equal [[:module, "MyTestModule", []]], result
    end
  end

  describe "We need parser that can parse module with class inside" do
    before do
      @src = "
      module MyTestModule  
        class MyTestClass 
        end
      end"
    end
    it "Has to parse module with class inside " do
      result = SR.parse(@src)
      assert_equal [[:module, "MyTestModule", [:class, "MyTestClass", [[]]]]], result
    end
  end
  describe "Wen need parser for method definition" do
    before do
      @src = "module TestModule class TestClass def testMethod(x,y)  
      end end end"
    end
    it "must parse module with class with method inside " do
      result = SR.parse(@src)
      assert_equal [[:module, "TestModule", [:class, "TestClass", [[:def, [], "testMethod", ["x", "y"], [[]]]]]]], result
    end
  end
  describe "Wen need to parse send expression" do
    before do
      @src = "
      module TestModule 
        class TestClass 
          def testMethod(x,y)
            x.hi
          end 
        end 
      end"
    end
    it "must parse module with class with method inside and send hi on x " do
      result = SR.parse(@src)
      assert_equal [[:module, "TestModule", [:class, "TestClass", [[:def, [], "testMethod", ["x", "y"], [[:send, "x", "hi", []]]]]]]], result
    end
  end

  describe "Wen need to parse send expression with 1 parameter" do
    before do
      @src = " 
      module Test
        x.hi(67)
      end
      "
    end
    it "must parse send hi on x " do
      result = SR.parse(@src)
      assert_equal [[:module, "Test", [:send, "x", "hi", [[:number, 67]]]]], result
    end
  end

  describe "Wen need to parse send expression with parameters" do
    before do
      @src = " 
      module Test
        x.hi(y,\"Gosh\",67)
      end
      "
    end
    it "must parse send hi on x " do
      result = SR.parse(@src)
      assert_equal [[:module, "Test", [:send, "x", "hi", ["y", [:string, "Gosh"], [:number, 67]]]]], result
    end
  end
  describe "We need to do if condition" do
    before do
      @src = "
      module Test
         (T >(0)).if() do 
            T = T - (1) 
         end
      end
      "
    end
    it "Must parse if loop as send operations  " do
      result = SR.parse(@src)
      assert_equal [[:module, "Test",
                     [:send, [:send, "T", ">", [[:number, 0]]], "if", [],
                      [:block, [], [[:assign, "T", [:send, "T", "-", [[:number, 1]]]]]]]]], result
    end
  end

  describe "We need to do if  without brackets on condition and with brackets call" do
    before do
      @src = "
      module Test
         ( T > (0) ).if() do 
            T = T-(1) 
         end
      end
      "
    end
    it "Must parse if as send operations  " do
      result = SR.parse(@src)
      assert_equal [[:module, "Test",
                     [:send, [:send, "T", ">", [[:number, 0]]], "if", [],
                      [:block, [], [[:assign, "T", [:send, "T", "-", [[:number, 1]]]]]]]]], result
    end
  end

  describe "We need to increment X 10 times with while loop" do
    before do
      @src = "
        def incrementX10Times(x)
          index = 0 ;
          while(index < (10))
            x = x +(1)
          end;
         return x
        end
      "
    end
    it "Must parse while " do
      result = SR.parse(@src)
      assert_equal [
                     [:def, [], "incrementX10Times", ["x"],
                      [
                       [:assign, "index", [:number, 0]],
                       [:while, [:send, "index", "<", [[:number, 10]]],
                        [[:assign, "x", [:send, "x", "+", [[:number, 1]]]]]],
                       [:return, "x"],
                     ]],
                   ],
                   result
    end
  end

  describe "We need a way to define class methods" do
    before do
      @src = "
        class ClassWithClassMethods
          def self.createSubclass(name)
            res=\"subclass\"
          end
        end
      "
    end
    it "Must parse as definition of class method" do
      result = SR.parse(@src)
      assert_equal [[:class, "ClassWithClassMethods",
                     [[:def, "self", "createSubclass", ["name"],
                       [[:assign, "res", [:string, "subclass"]]]]]]], result
    end
  end

  describe "When we have chained methods" do
    before do
      @src = "self.fib(n.-(1)).+(self.fib(n.-(2)))"
    end
    it "Must parse correctly " do
      result = SR.parse(@src)
      assert_equal [[:send,
                     [:send, "self", "fib",
                      [[:send, "n", "-", [[:number, 1]]]]], "+", [
                     [:send, "self", "fib",
                      [[:send, "n", "-", [[:number, 2]]]]],
                   ]]], result
    end
  end

  describe "When we create class Fib with method fib that calculate 26 fibonatchi number" do
    before do
      @src = "
      class Fib
        def fib(n)
          n.<(2).ifTrue() do
            return 1
          end
          ;
          return self.fib(n.-(1)).+(self.fib(n.-(2)))
        end
      end;
      fib = Fib.new;
      result = fib.fib(26)
      "
    end
    it "Must parse as definition of class method" do
      result = SR.parse(@src)
      assert_equal [[:class, "Fib", [[:def, [], "fib", ["n"], [[:send, [:send, "n", "<", [[:number, 2]]], "ifTrue", [], [:block, [], [[:return, [:number, 1]]]]], [:return, [:send, [:send, "self", "fib", [[:send, "n", "-", [[:number, 1]]]]], "+", [[:send, "self", "fib", [[:send, "n", "-", [[:number, 2]]]]]]]]]]]], [:assign, "fib", [:send, "Fib", "new", []]], [:assign, "result", [:send, "fib", "fib", [[:number, 26]]]]],
                   result
    end
  end
end
