describe "SmallParser" do
  describe "We need simple parser that can parse module" do
    before do
      @src = "module MyTestModule  
   end"
    end

    it "Has to parse correct s-expression for module with name MyTestModule" do
      result = SR.parse(@src)
      assert_equal [:module, "MyTestModule", []], result
    end
  end

  describe "We need parser that can parse module with class inside" do
    before do
      @src = "module MyTestModule  
        class MyTestClass end
      end"
    end
    it "Has to parse module with class inside " do
      result = SR.parse(@src)
      assert_equal [:module, "MyTestModule", [:class, "MyTestClass", []]], result
    end
  end
  describe "Wen need parser for method definition" do
    before do
      @src = "module TestModule class TestClass def testMethod(x,y)  
      end end end"
    end
    it "must parse module with class with method inside " do
      result = SR.parse(@src)
      assert_equal [:module, "TestModule", [:class, "TestClass", [:def, "testMethod", ["x", "y"], []]]], result
    end
  end
  describe "Wen need to parse send expression" do
    before do
      @src = "module TestModule class TestClass def testMethod(x,y)
        x.hi
      end end end"
    end
    it "must parse module with class with method inside and send hi on x " do
      result = SR.parse(@src)
      assert_equal [:module, "TestModule", [:class, "TestClass", [:def, "testMethod", ["x", "y"], [:send, "x", "hi"]]]], result
    end
  end

  describe "Wen need to parse send expression with parameters" do
    before do
      @src = " module Test
        x.hi(y,\"Gosh\",67)
    end
    "
    end
    it "must parse send hi on x " do
      result = SR.parse(@src)
      assert_equal [:module, "Test", [:send, "x", "hi", ["y", [:string, "Gosh"], [:number, 67]]]], result
    end
  end
end
