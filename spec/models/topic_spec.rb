describe Topic do
  before do
    @public_topic = Topic.create
    @private_topic = Topic.create(public: false)
  end

  describe "publicly_viewable" do
    it "returns a relation of all public topics" do
      expect(Topic.publicly_viewable).to eq([@public_topic])
    end
  end

  describe "privately_viewable" do
    it "returns a relation of all private topics" do
      expect(Topic.privately_viewable).to eq([@private_topic])
    end
  end

  describe "visible_to(user)" do
    it "returns all specs if the user is present" do
      user = true
      expect(Topic.visible_to(user)).to eq(Topic.all)
    end

    it "returns only public specs if user is nil" do
      expect(Topic.visible_to(nil)).to eq(Topic.publicly_viewable)
    end
  end
end