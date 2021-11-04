require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "creates a new comment" do
    post = Post.create
    expect {
      Comment.create(commenter: "My commenter", body: "My body", post: post)
    }.to change { Comment.count }.by(1)
    comment = Comment.last
    expect(comment.commenter).to eq("My commenter")
    expect(comment.body).to eq("My body")
    expect(comment.post_id).to eq(post.id)
  end
end
