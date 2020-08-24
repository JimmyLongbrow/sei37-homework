class DashboardController < ApplicationController
  def app
  end


  #API action
  def uptime

    @up = `uptime`

    response = {
      command: 'uptime',
      output: @up,
      numbers: [1,2,23,420]
    }

    # render json: response
    respond_to do |format|
      format.html
      format.json {render json: response}
    end

  end

  def cpu
    hog = `ps xr`.split("\n").second
    date = `date`

    render json: {
      cpuHog: hog,
      currentDate: date
    }
  end

  def dogs_index
    render json: Dog.all
  end

  def dogs_search
    # render plain: "dogSearch #{params[:query]}"
    render json: Dog.where( name: params[:query])
  end
end
