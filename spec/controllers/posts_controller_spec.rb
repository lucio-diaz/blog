require 'rails_helper'

describe PostsController do
  describe "GET show" do
    it "shows the show view" do
      post = Post.create
      get :show, params: { id: post.id }
      expect(assigns[:post]).to eq(post)
      expect(response).to render_template(:show)
    end
  end
end
