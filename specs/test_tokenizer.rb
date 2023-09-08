describe SR::Tokenizer do
  describe "When source code is given to tokenizer" do
    before do
      @src = "module TestModule 
        class TestClass 
            def testMethod
            end
        end
    end"
    end
    it "Must be split into tokens" do
      tokens = SR.tokens(@src)
      assert_equal [["module", "module"],
                    [:CONST, "TestModule"], ["class", "class"],
                    [:CONST, "TestClass"], ["def", "def"],
                    [:CONST, "testMethod"], ["end", "end"],
                    ["end", "end"], ["end", "end"]], tokens
    end
  end
  describe "When code with operators is given" do
    before do
      @src = "def testArgs(x,y)"
    end
    it "must split operators in different tokens" do
      result = SR.tokens(@src)
      assert_equal [["def", "def"], [:CONST, "testArgs"],
                    ["(", "("], [:CONST, "x"], [",", ","], [:CONST, "y"], [")", ")"]], result
    end
  end

  describe "When code with Strings and Numbers are given" do
    before do
      @src = " testStringVar=\"MyString\" testIntVariable=9989 testFloatVariable= 3.14"
    end
    it "must crete String and 2 Number tokens" do
      result = SR.tokens(@src)
      assert_equal [[:CONST, "testStringVar"], ["=", "="],
                    [:STRING, "MyString"],
                    [:CONST, "testIntVariable"],
                    ["=", "="], [:NUMBER, 9989],
                    [:CONST, "testFloatVariable"], ["=", "="],
                    [:NUMBER, 3.14]], result
    end
  end

  describe "We need to split raw tokens on all operqators " do
    it "Must split it as separate raw tokens " do
      result = SR::Tokenizer.new(@src).splitByOperators("(T.>=(0)).while()")
      assert_equal ["(", "T", ".", ">=", "(", "0", ")", ")", ".", "while", "(", ")"], result
    end
  end

  describe "We need to do while loop" do
    before do
      @src = "
        module Test
          ( T.>(0)).while()
        end
        "
    end
    it "Must tokenize while loop as send operations  " do
      result = SR.tokens(@src)
      assert_equal [["module", "module"],
                    [:CONST, "Test"], ["(", "("], [:CONST, "T"],
                    [".", "."], [:CONST, ">"], ["(", "("], [:NUMBER, 0],
                    [")", ")"], [")", ")"], [".", "."], [:CONST, "while"],
                    ["(", "("], [")", ")"], ["end", "end"]], result
    end
  end
end
