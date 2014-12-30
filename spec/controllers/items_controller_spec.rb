
require 'rails_helper'


RSpec.describe ItemsController, :type => :controller do
before do
  new_user = FactoryGirl.create(:user)
  sign_in(new_user)
end
  describe  "show action" do
    it "renders show template if an item is found" do
      item = FactoryGirl.create(:item)
      get :show, { id: item.id}
      expect(response).to  render_template('show')
    end

    it "renders 404 page if an item is not found" do
      get :show, { id: 0 }
      puts response.status
      expect(response.status).to eq 404

    end
  end

  describe "create action" do
    it "redirects to item page if validations pass" do
      new_user = FactoryGirl.create(:user,admin:true)
      sign_in(new_user)
      post :create, { item: { price: 35, descriptions: 'some test', name: 'Test', category_id: 2, weight: 100 } }
      puts response.status
      expect(response).to  redirect_to(item_path(assigns(:item)))
    end

    it "renders new page again if validations fail" do
      new_user = FactoryGirl.create(:user,admin:true)
      sign_in(new_user)
      post :create, {item: { price: 0, descriptions: 'some test', name: 'Test', category_id: 2, weight: 100 }}
      puts response.status
      expect(response).to  render_template 'new'
    end

    it "renders 403 Access denied page if you are not admin!" do
      post :create, {item: { price: 700, descriptions: 'test', name: 'Test1', category_id: 2, weight: 100 }}
      expect(response.status).to eq 403
    end
  end

  describe "edit action" do


    it "renders 403 Access denied if you are not admin and try to edit item" do
      new_user = FactoryGirl.create(:user,admin:false)
      sign_in(new_user)
      item = FactoryGirl.create(:item)
      get :edit, {id:item.id, price: 30, descriptions: 'some test', name: 'Test', category_id: 2, weight: 100 }
      puts response.status
      expect(response.status).to eq 403
    end

    it "renders items/edit page if you made mistakes in your form" do
      new_user = FactoryGirl.create(:user,admin:true)
      sign_in(new_user)
      item = FactoryGirl.create(:item)
      get :edit, {id:item.id, price: 30, descriptions: 'some test' }
      puts response.status
      expect(response).to render_template('edit')
    end


  end

  describe "update action" do
   it "reditects to item show page if item updated" do
    new_user = FactoryGirl.create(:user,admin:true)
    sign_in(new_user)
    item = FactoryGirl.create(:item)
    put :update, { id: item.id, item:{ price: 30, descriptions: 'some test', name: 'Test', category_id: 2, weight: 100 } }
    puts item.reload.price
    expect(response).to  redirect_to item_path(item)
    end
  end

  describe "delete action" do
    it "redirects to index page if an item destroyed" do
       new_user = FactoryGirl.create(:user,admin:true)
       sign_in(new_user)
       item = FactoryGirl.create(:item)
       delete :destroy, {id: item.id, item:{}}
       expect(response.status).to eq 302
       # expect(response).to  redirect_to(items_path())

    end
    it "redirects to 404 doesn't exist page if an item is not exist" do
      new_user = FactoryGirl.create(:user,admin:true)
      sign_in(new_user)
      item = FactoryGirl.create(:item)
      delete :destroy, {id: 0, item:{}}
      expect(response.status).to  eq 404

    end

    it "renders 403 Access denied if you are not admin and try to delete item" do
      new_user = FactoryGirl.create(:user,admin:false)
      sign_in(new_user)
      item = FactoryGirl.create(:item)
      delete :destroy, {id: item.id, item:{}}
      expect(response.status).to eq 403

    end


  end

end
