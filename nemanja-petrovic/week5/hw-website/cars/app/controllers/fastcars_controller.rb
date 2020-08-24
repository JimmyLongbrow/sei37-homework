class FastcarsController < ApplicationController

  def new
  end

  def create
    Fastcar.create(
      make: params[:make],
      model: params[:model],
      image: params[:image],
      quatermile: params[:quatermile],
      topspeed: params[:topspeed],
      kilowatts: params[:kilowatts]
    )
    redirect_to(fastcar_path)
  end

  def index
    @fastcars = Fastcar.all
  end

  def show
    @fastcars = Fastcar.find params[:id]
  end

  def edit
    @fastcar = Fastcar.find params[:id]
  end

  def update
    fastcar = Fastcar.find params[:id]
    fastcar.update(
      quatermile: params[:quatermile],
      topspeed: params[:topspeed],
      kilowatts: params[:kilowatts],
      image: params[:image],
    )
    redirect_to(fastcar_path(params[:id]))
  end

  def destroy
    Fastcar.destroy params[:id]
    redirect_to(fastcars_path)
  end
end
