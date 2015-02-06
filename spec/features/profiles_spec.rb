require "rails_helper"

describe "Visiting profiles" do
  include TestFactories
  include Warden::Test::Helpers
  Warden.test_mode!

  before do
    @user = authenticated_user
    @topic = Topic.create(description: "A topic ......")
    @post = associated_post(user: @user, topic: @topic)
    @comment = comment_without_email(post: @post, user: @user)
  end

  describe "not signed in " do
    it "shows profile" do
      p user_path(@user)
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))
      print page.html
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@post.title)
      expect(page).to have_content(@comment.body)
    end
  end

  describe "signed in as admin" do
    before do 
      @user = authenticated_user(role: 'admin')
      login_as @user, scope: :user 
      @post = associated_post(user: @user, topic: @topic)
      @comment = comment_without_email(post: @post, user: @user)
    end

    it "show profile" do
      p "@user: " + @user.inspect
      p "post title: " + @post.title
      visit user_path(@user)
      expect(current_path).to eq(user_path(@user))

      print page.html
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@post.title)
      expect(page).to have_content(@comment.body)
      
    end
  end
end