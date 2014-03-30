require 'test_helper'

class LeaguesControllerTest < ActionController::TestCase
  let(:sport) { Sport.make! }

  describe "GET#index" do
    it "returns all Leagues" do
      get :index, sport_id: sport.to_param
      assert_response :success
      assert_not_nil assigns(:leagues)
    end
  end

  describe "GET#new" do
    it "renders the new League form" do
      get :new, sport_id: sport.to_param
      assert_response :success
      assert_not_nil assigns(:league)
    end
  end

  describe "POST#create" do
    it "is successful with a complete League" do
      assert_difference("League.count") do
        post :create, { sport_id: sport.to_param, league: { name: "Arrogant Bastards" } }
      end
      assert_redirected_to [sport, assigns(:league)]
    end

    it "is unsuccessful with an incomplete League" do
      assert_no_difference("League.count") do
        post :create, { sport_id: sport.to_param, league: { name: "" } }
      end
      assert_response :success
      assert_template :new
    end
  end

  describe "GET#show" do
    it "renders the League" do
      league = League.make!(sport: sport)
      get :show, sport_id: sport.to_param, id: league.to_param

      assert_response :success
      assert_template :show
    end
  end

  describe "GET#edit" do
    it "renders the League for editing" do
      league = League.make!(sport: sport)
      get :edit, sport_id: sport.to_param, id: league.to_param

      assert_response :success
      assert_template :edit
    end
  end

  describe "PUT#update" do
    it "is successful with a valid update to League" do
      league = League.make!(sport: sport)
      put :update, {sport_id: sport.to_param, id: league.to_param, league: { name: "Clay Shotting" } }

      assert_redirected_to [sport, league]
    end

    it "is unsuccessful with an invalid update to Sport" do
      league = League.make!(sport: sport)
      put :update, {sport_id: sport.to_param, id: league.to_param, league: { name: "" } }

      assert_response :success
      assert_template :edit
    end
  end

  describe "DELETE#destroy" do
    it "deletes the sport" do
      league = League.make!(sport: sport)
      assert_difference("League.count", -1) do
        delete :destroy, sport_id: sport.to_param, id: league.to_param
      end
      assert_redirected_to sport_leagues_path(sport)
    end
  end

end
