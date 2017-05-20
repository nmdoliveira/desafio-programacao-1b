require "rails_helper"

RSpec.describe OrdersController do
  describe "GET index" do
    it do
      get :index
      expect(response).to render_template :index
    end
  end
end
