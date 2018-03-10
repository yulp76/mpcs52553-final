class WishesController < ApplicationController

  def create
    wish = Wish.new
    wish.user_id = params["user_id"]
    wish.attraction_id = params["attraction_id"]
    wish.save
    redirect_to "/attractions/#{params["attraction_id"]}"
  end

  def destroy
    wish = Wish.find_by(id: params["id"])
    attraction_id = wish.attraction_id
    if session[:user_id] != wish.user_id
      redirect_to "/wishes", notice: "You can only delete your own wish list items."
    end
    wish.delete
    if params["back_to_wish_list"] != nil
      redirect_to "/wishes"
    else
      redirect_to "/attractions/#{attraction_id}"
    end
  end

end
