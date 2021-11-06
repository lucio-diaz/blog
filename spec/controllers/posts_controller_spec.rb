require 'rails_helper'

describe PostsController do

  describe "GET index" do

    it "shows the index view" do

      post1 = Post.create(title: "T1", body:"B1")
      post2 = Post.create(title: "T2", body:"B2")
      post3 = Post.create(title: "T3", body:"B3")
      get :index
      expect(assigns[:posts]).to include(post1)
      expect(assigns[:posts]).to include(post2)
      expect(assigns[:posts]).to include(post3)
      expect(response).to render_template(:index)
    end

  end
  
  describe "GET show" do

    it "shows the show view" do
      post = Post.create(title: "T", body:"B")
      get :show, params: { id: post.id }
      expect(assigns[:post]).to eq(post)
      expect(response).to render_template(:show)
    end

  end

  describe "GET edit" do

    it "shows the edit view" do
      post = Post.create(title: "T", body:"B")
      get :edit, params: { id: post.id }
      expect(response).to render_template(:edit)
    end
    
  end

  describe "POST create" do
    context "Sucessfully post created" do

      it "creates a new post and redirects to show view" do
        expect{
          post :create, params: {post: { :title => "P1", :body => "B1"}}
        }.to change{ Post.count}.by(1)
        expect(response).to redirect_to(post_url(assigns[:post]))
      end
      
    end
  end

  describe "PATCH update post" do
    context "Succesfully update post" do

      it "updates a post" do
        p = Post.create(title: "T", body:"B")
        expect{
          patch :update, params: {post: {:title => "T1U", :body => "B1U"}, id: p.id}
        }.not_to change{Post.count}
        last = Post.last
        expect(last.title).to eq("T1U")
        expect(last.body).to eq("B1U")
        expect(last.id).to eq(p.id)
      end
      
    end
  end

  describe "DESTROY delete post" do

    context "Succesfully destroy post" do

      it "destroys a post" do

        post = Post.create(title: "T", body: "B")
        expect{
          delete :destroy, params: {:id => post.id}
        }.to change{Post.count}.by(-1)
        expect{
          Post.find(post.id)
        }.to raise_exception(ActiveRecord::RecordNotFound)
        
      end

    end

  end
end
