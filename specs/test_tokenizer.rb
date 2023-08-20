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
end
