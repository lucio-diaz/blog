require 'rails_helper'

RSpec.describe Comment, type: :model do

  it "creates a new comment" do

    post = Post.create(title: "T", body: "B")
    expect {
      Comment.create(commenter: "My commenter", body: "My body", post: post)
    }.to change { Comment.count }.by(1)
    comment = Comment.last
    expect(comment.commenter).to eq("My commenter")
    expect(comment.body).to eq("My body")
    expect(comment.post_id).to eq(post.id)

  end
  
  it "does not creates the comment with empty commenter" do

    post = Post.create( title: "T", body: "B" )
    expect{
      Comment.create(commenter: "", body: "B", post: post)
    }.not_to change { Comment.count }

  end

  it "does not creates the comment with empty comment body" do

    post = Post.create( title: "T", body: "B" )
    expect{
      Comment.create(commenter: "C", body: "", post: post)
    }.not_to change { Comment.count }

  end

  it "does not creates the comment with empty comment and empty body" do

    post = Post.create( title: "T", body: "B" )
    expect{
      Comment.create(commenter: "", body: "", post: post)
    }.not_to change { Comment.count }

  end
  
end
