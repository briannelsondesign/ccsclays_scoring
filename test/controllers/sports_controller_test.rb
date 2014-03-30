require 'test_helper'

class SportsControllerTest < ActionController::TestCase

  describe "GET#index" do
    it "returns all Sports" do
      get :index
      assert_response :success
      assert_not_nil assigns(:sports)
    end
  end

  describe "GET#new" do
    it "renders the new Sport form" do
      get :new
      assert_response :success
      assert_not_nil assigns(:sport)
    end
  end

end
