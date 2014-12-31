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

    it "renders categories/new page if validation is failed" do
      new_user = FactoryGirl.create(:user, admin: true)
      sign_in(new_user)
      post :create, { category: {category_name: nil} }
      expect(response).to render_template("new")
    end
  end

  describe "edit action" do
    it "renders 403 Access denied if you are not admin and try to edit category" do
      new_user = FactoryGirl.create(:user,admin:false)
      sign_in(new_user)
      new_category = FactoryGirl.create(:category)
      get :edit, {id:new_category.id, category_name: 'someName' }
      puts response.status
      expect(response.status).to eq 403
    end

    it "renders category/edit page if you made mistakes in your form and you are admin" do
      new_user = FactoryGirl.create(:user,admin:true)
      sign_in(new_user)
      new_category = FactoryGirl.create(:category)
      get :edit, {id:new_category.id, category_name: 'someName'}
      puts response.status
      expect(response).to render_template('edit')
    end
  end

  describe "update action" do
    it "reditects to category show page if item updated" do
      new_user = FactoryGirl.create(:user,admin:true)
      sign_in(new_user)
      new_category = FactoryGirl.create(:category)
      put :update, { id: new_category.id, category:{ category_name: 'someName' } }
      puts new_category.reload.category_name
      expect(response).to  redirect_to(categories_path())
    end
  end

  describe "delete action" do
    it "redirects to index page if category destroyed" do
      new_user = FactoryGirl.create(:user,admin:true)
      sign_in(new_user)
      new_category = FactoryGirl.create(:category)
      delete :destroy, {id: new_category.id, category:{}}
      expect(response.status).to eq 302
      # expect(response).to  redirect_to(items_path())

    end
    xit "redirects to 404 doesn't exist page if category is not exist" do
      new_user = FactoryGirl.create(:user,admin:true)
      sign_in(new_user)
      delete :destroy, {id: nil, category:{}}
      expect(response.status).to  eq 404

    end

    it "renders 403 Access denied if you are not admin and try to delete category" do
      new_user = FactoryGirl.create(:user,admin:false)
      sign_in(new_user)
      new_category = FactoryGirl.create(:category)
      delete :destroy, {id: new_category.id, category:{}}
      expect(response.status).to eq 403

    end


  end


end
