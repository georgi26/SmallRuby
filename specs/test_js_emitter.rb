describe SR::JSEmitter do
  describe "When we give SR class with method" do
    before do
      @src = "
            x = 879 + 67
        "
    end
    it "Must be translated to correct JS" do
      result = SR.transpileToJS(@src)
      assert_equal "let x = new SRIntegerInstance(879).send(\"+\",[new SRIntegerInstance(67)])", result
      baseJS = SR::JSEmitter.baseJS
      baseJS << "\n" << result << "\n console.log(x.variables[\"value\"])"
      output = `echo '#{baseJS}' | node `
      assert_equal "946\n", output
    end
  end
end
