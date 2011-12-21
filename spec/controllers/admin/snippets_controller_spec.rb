require 'spec_helper'

describe Admin::SnippetsController do
  def valid_attributes
    Factory.attributes_for(:snippet) #{}
  end

  describe "GET index" do
    it "assigns all snippets as @snippets" do
      snippet = Snippet.create! valid_attributes
      get :index
      assigns(:snippets).should eq([snippet])
    end
  end

  describe "GET show" do
    it "assigns the requested snippet as @snippet" do
      snippet = Snippet.create! valid_attributes
      get :show, :id => snippet.id.to_s
      assigns(:snippet).should eq(snippet)
    end
  end

  describe "GET new" do
    it "assigns a new snippet as @snippet" do
      get :new
      assigns(:snippet).should be_a_new(Snippet)
    end
  end

  describe "GET edit" do
    it "assigns the requested snippet as @snippet" do
      snippet = Snippet.create! valid_attributes
      get :edit, :id => snippet.id.to_s
      assigns(:snippet).should eq(snippet)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Snippet" do
        expect {
          post :create, :snippet => valid_attributes
        }.to change(Snippet, :count).by(1)
      end

      it "assigns a newly created snippet as @snippet" do
        post :create, :snippet => valid_attributes
        assigns(:snippet).should be_a(Snippet)
        assigns(:snippet).should be_persisted
      end

      it "redirects to the created snippet" do
        post :create, :snippet => valid_attributes
        response.should redirect_to(admin_snippet_path(Snippet.last))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved snippet as @snippet" do
        # Trigger the behavior that occurs when invalid params are submitted
        Snippet.any_instance.stub(:save).and_return(false)
        post :create, :snippet => {}
        assigns(:snippet).should be_a_new(Snippet)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Snippet.any_instance.stub(:save).and_return(false)
        post :create, :snippet => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested snippet" do
        snippet = Snippet.create! valid_attributes
        # Assuming there are no other snippets in the database, this
        # specifies that the Snippet created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Snippet.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => snippet.id, :snippet => {'these' => 'params'}
      end

      it "assigns the requested snippet as @snippet" do
        snippet = Snippet.create! valid_attributes
        put :update, :id => snippet.id, :snippet => valid_attributes
        assigns(:snippet).should eq(snippet)
      end

      it "redirects to the snippet" do
        snippet = Snippet.create! valid_attributes
        put :update, :id => snippet.id, :snippet => valid_attributes
        response.should redirect_to(admin_snippet_path(snippet))
      end
    end

    describe "with invalid params" do
      it "assigns the snippet as @snippet" do
        snippet = Snippet.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Snippet.any_instance.stub(:save).and_return(false)
        put :update, :id => snippet.id.to_s, :snippet => {}
        assigns(:snippet).should eq(snippet)
      end

      it "re-renders the 'edit' template" do
        snippet = Snippet.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Snippet.any_instance.stub(:save).and_return(false)
        put :update, :id => snippet.id.to_s, :snippet => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested snippet" do
      snippet = Snippet.create! valid_attributes
      expect {
        delete :destroy, :id => snippet.id.to_s
      }.to change(Snippet, :count).by(-1)
    end

    it "redirects to the snippets list" do
      snippet = Snippet.create! valid_attributes
      delete :destroy, :id => snippet.id.to_s
      response.should redirect_to(admin_snippets_url)
    end
  end
end
