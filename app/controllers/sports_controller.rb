class SportsController < ApplicationController

  def index
    @sports = Sport.all
  end

  def new
    @sport = Sport.new
  end

  def create
    @sport = Sport.new(sport_params)
    if @sport.save
      flash[:success] = "Ok, we created '#{@sport.name}'."
      redirect_to @sport
    else
      render :new
    end
  end

  def show
    @sport = Sport.find(params[:id])
  end

  def edit
    @sport = Sport.find(params[:id])
  end

  def update
    @sport = Sport.find(params[:id])
    if @sport.update!(sport_params)
      flash[:success] = "Ok, we updated '#{@sport.name}'."
      redirect_to @sport
    else
      render :edit
    end
  end

  def destroy
    @sport = Sport.find(params[:id])

    @sport.destroy!

    flash[:success] = "Ok, we deleted '#{@sport.name}'."
    redirect_to sports_path
  end

private

  def sport_params
    params.require(:sport).permit(:name)
  end

end
