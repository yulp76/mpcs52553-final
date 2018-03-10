class DestinationsController < ApplicationController

  def new
    @destination = Destination.new
    unless session[:admin]
      redirect_to "/", notice: "Administrator Only."
    end
  end

  def manage
    unless session[:admin]
      redirect_to "/", notice: "Administrator Only."
    end
  end

  def edit
    unless session[:admin]
      redirect_to "/", notice: "Administrator Only."
    end
  end

  def update
    unless session[:admin]
      redirect_to "/", notice: "Administrator Only."
    end
    destination = Destination.find_by(id: params["id"])
    destination.introduction = params["introduction"]
    destination.cover_url = params["cover_url"]
    if destination.save
      redirect_to "/destinations/#{params["id"]}"
    else
      redirect_to "/destinations/#{params["id"]}/edit", notice: "Invalid edits."
    end
  end

  def create
    unless session[:admin]
      redirect_to "/", notice: "Administrator Only."
    end
    @destination = Destination.new
    @destination.name = params["name"]
    @destination.introduction = params["introduction"]
    @destination.cover_url = params["cover_url"]
    if @destination.save
      redirect_to "/manage_destinations"
    else
      render 'new', notice: "Invalid inputs."
    end
  end

end
