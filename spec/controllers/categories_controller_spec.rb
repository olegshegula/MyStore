require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do

  before do
    new_user = FactoryGirl.create(:user)
    sign_in(new_user)
  end

  describe  "index action" do
   it "renders index template if you are admin" do
     new_user = FactoryGirl.create(:user,admin:true)
     sign_in(new_user)
     get :index
     expect(response).to render_template("index")


    end

   it "renders 404 page if an item is not found" do
     new_user = FactoryGirl.create(:user)
     sign_in(new_user)
     get :index
      expect(response.status).to eq 403
    end
  end

  describe "create action" do
    it "renders an index page with list of categories if category created" do
      new_user = FactoryGirl.create(:user, admin: true)
      sign_in(new_user)
      # new_category = FactoryGirl.create(:category)
      post :create, { category: {category_name: 'TestCategory'} }
      expect(response).to  redirect_to(categories_path())
    end

    it "renders 403 Access denied if you are not admin and try to create item" do

      post :create, { category: {category_name: 'TestCategory'} }
      expect(response.status).to eq 403
    end
  end


end
