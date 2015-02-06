FactoryGirl.define do
  factory :comment do
    body "THis is a new comment"
    user
    post

    after(:build) do |comment|
      comment.class.skip_callback(:create, :after, :send_favorite_emails)
    end
  end
end