class ArtistsController < ApplicationController



  # READ #############################
  def new
    @artist = Artist.new
  end

  def create
    # Artist.create name: params[:artist][:name], nationality: params[:artist][:nationality]
    Artist.create artist_params
    redirect_to artists_path
  end

  # 1. Index of artists
  def index
    @artists = Artist.all
  end

  # 2. Show page for an artist, by ID

  def show
    @artist = Artist.find params[:id]
  end

  def edit
    @artist = Artist.find params[:id]
  end

  def update
    artist = Artist.find params[:id]
    artist.update artist_params
    redirect_to(artist_path(params[:id]))
  end
  
  def destroy
    Artist.destroy params[:id]
    redirect_to artists_path
  end

  private

  def artist_params
    params.require(:artist).permit( :name, :nationality, :dob, :period, :roundness, :bio, :image)
  end

end  # ArtistsController
