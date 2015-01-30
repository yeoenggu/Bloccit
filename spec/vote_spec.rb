describe Vote do 
  describe "validations" do
    describe "value validation" do
      it "only allow -1 or 1 as value" do
        # expectations
        expect(Vote.new(value: 1).valid?).to eq(true)
        expect(Vote.new(value: -1).valid?).to eq(true)
        expect(Vote.new(value: 2).valid?).to eq(false)
      end
    end
  end

end