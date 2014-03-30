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

  describe "POST#create" do
    it "is successful with a complete Sport" do
      assert_difference("Sport.count") do
        post :create, sport: { name: "Clay Shooting" }
      end
      assert_redirected_to assigns(:sport)
    end

    it "is unsuccessful with an incomplete Sport" do
      assert_no_difference("Sport.count") do
        post :create, sport: { name: "" }
      end
      assert_response :success
      assert_template :new
    end
  end

  describe "GET#show" do
    it "renders the Sport" do
      sport = Sport.make!
      get :show, id: sport.to_param

      assert_response :success
      assert_template :show
    end
  end

  describe "GET#edit" do
    it "renders the Sport for editing" do
      sport = Sport.make!
      get :edit, id: sport.to_param

      assert_response :success
      assert_template :edit
    end
  end

  describe "PUT#update" do
    it "is successful with a valid update to Sport" do
      sport = Sport.make!
      put :update, {id: sport.to_param, sport: { name: "Clay Shotting" } }

      assert_redirected_to sport
    end

    it "is unsuccessful with an invalid update to Sport" do
      sport = Sport.make!
      put :update, {id: sport.to_param, sport: { name: "" } }

      assert_response :success
      assert_template :edit
    end
  end

  describe "DELETE#destroy" do
    it "deletes the sport" do
      sport = Sport.make!
      assert_difference("Sport.count", -1) do
        delete :destroy, id: sport.to_param
      end
      assert_redirected_to sports_path
    end
  end

end
