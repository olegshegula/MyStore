require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do

  before do
    new_user = FactoryGirl.create(:user)
    sign_in(new_user)
  end

  describe  "update action" do
    xit "renders render_successful_order if you ordered item" do


    end
    end

end