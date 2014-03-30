class LeaguesController < ApplicationController

  before_filter :find_sport

  def index
    @leagues = @sport.leagues
  end

  def new
    @league = @sport.leagues.new
  end

  def create
    @league = @sport.leagues.new(league_params)
    if @league.save
      flash[:success] = "Ok, we created the '#{@league.name}' league."
      redirect_to [@sport, @league]
    else
      render :new
    end
  end

  def show
    @league = @sport.leagues.find(params[:id])
  end

  def edit
    @league = @sport.leagues.find(params[:id])
  end

  def update
    @league = @sport.leagues.find(params[:id])
    if @league.update(league_params)
      flash[:success] = "Ok, we updated the '#{@league.name}' league."
      redirect_to [@sport, @league]
    else
      render :edit
    end
  end

  def destroy
    @league = @sport.leagues.find(params[:id])

    @league.destroy

    flash[:success] = "Ok, we deleted '#{@league.name}'."
    redirect_to sport_leagues_path(@sport)
  end

private

  def league_params
    params.require(:league).permit(:name)
  end

  def find_sport
    @sport = Sport.find(params[:sport_id])
  end
end
