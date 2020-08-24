class MixtapesController < ApplicationController

  before_action :check_if_logged_in, except: [:index, :show]

  def new
    @mixtape = Mixtape.new
  end

  def create
   @mixtape = Mixtape.create mixtape_params
   @mixtape.user_id = @current_user.id
   @mixtape.save
   redirect_to mixtapes_path
  end

  def index
    @mixtapes = Mixtape.all
  end

  def show
    @mixtape = Mixtape.find params[:id]
  end

  def edit
    @mixtape = Mixtape.find params[:id]
    redirect_to mixtapes_path unless @mixtape.user == @current_user
  end

  def update
    @mixtape = Mixtape.find params[:id]
    if @mixtape.user != @current_user
      redirect_to mixtape_path
      return
    end
    @mixtape.update mixtape_params
    redirect_to mixtape_path(@mixtape)
  end

  def destroy
  end

  private
  def mixtape_params
    params.require(:mixtape).permit(:title,:image)
  end
end
