require 'rails_helper'

RSpec.describe Post, type: :model do

  it "creates a new post" do

    expect{
      Post.create(title: "T", body: "B")
    }.to change{Post.count}.by(1)
    post = Post.last
    expect(post.title).to eq("T")
    expect(post.body).to eq("B")

  end

  it "does not creates a new post with empty title" do

    expect{
      Post.create(title: "", body: "B")
    }.not_to change{Post.count}

  end

  it "does not creates a new post with empty body" do

    expect{
      Post.create(title: "T", body: "")
    }.not_to change{Post.count}

  end

  it "does not creates a new post with empty title and empty body" do

    expect{
      Post.create(title: "", body: "B")
    }.not_to change{Post.count}

  end
  
end
