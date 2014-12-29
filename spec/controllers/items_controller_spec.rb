
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
      post :create, { item: { price: 35, descriptions: 'some test', name: 'Test', category_id: 2, weight: 100 },admin: true }
      puts response.status
      expect(response).to  redirect_to(item_path(assigns(:item)))
    end

    it "renders new page again if validations fail" do
      post :create, {item: { price: 0, descriptions: 'some test', name: 'Test', category_id: 2, weight: 100 },admin: true}
      expect(response).to  render_template 'new'
    end

    it "renders 403 Access denied page if you are not admin!" do
      post :create, {item: { price: 700, descriptions: 'test', name: 'Test1', category_id: 2, weight: 100 }}
      expect(response.status).to eq 403
    end
  end

end
