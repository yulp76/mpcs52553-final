class AttractionsController < ApplicationController

  def update
    attraction = Attraction.find_by(id: params["id"])
    attraction.name = params["name"]
    attraction.destination_id = params["destination"]
    attraction.type_id = params["type"]
    attraction.website = params["website"]
    attraction.image_url = params["image_url"]
    attraction.address = params["address"]
    attraction.save
    redirect_to "/attractions/#{params["id"]}"
  end

  def destroy
    attraction = Attraction.find_by(id: params["id"])
    attraction.delete
    redirect_to "/attractions"
  end

  def create
    Attraction.create :name => params["name"],
                      :destination_id => params["destination"],
                      :type_id => params["type"],
                      :website => params["website"],
                      :image_url => params["image_url"],
                      :address => params["address"]
    redirect_to "/attractions"
  end

end
