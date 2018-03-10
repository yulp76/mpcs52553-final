class AttractionsController < ApplicationController

  def search
    render 'search'
  end

  def index
    unless session[:admin]
      redirect_to "/", notice: "Administrator Only."
    end
  end

  def new
    @attraction = Attraction.new
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
    attraction = Attraction.find_by(id: params["id"])
    attraction.name = params["name"]
    attraction.destination_id = params["destination"]
    attraction.category_id = params["category"]
    attraction.website = params["website"]
    attraction.image_url = params["image_url"]
    attraction.address = params["address"]
    if attraction.save
      redirect_to "/attractions/#{params["id"]}"
    else
       redirect_to "/attractions/#{params["id"]}/edit", notice: "Invalid edits."
    end
  end

  def destroy
    unless session[:admin]
      redirect_to "/", notice: "Administrator Only."
    end
    attraction = Attraction.find_by(id: params["id"])
    attraction.delete
    redirect_to "/attractions"
  end

  def create
    unless session[:admin]
      redirect_to "/", notice: "Administrator Only."
    end
    @attraction = Attraction.new
    @attraction.name = params["name"]
    @attraction.destination_id = params["destination"]
    @attraction.category_id = params["category"]
    @attraction.website = params["website"]
    @attraction.image_url = params["image_url"]
    @attraction.address = params["address"]
    if @attraction.save
      redirect_to "/attractions"
    else
      render 'new'
    end
  end

end
