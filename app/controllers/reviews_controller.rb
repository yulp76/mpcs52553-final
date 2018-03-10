class ReviewsController < ApplicationController

  def create
    review = Review.new
    review.user_id = params["user_id"]
    review.attraction_id = params["attraction_id"]
    review.rating = params["rating"]
    review.comment = params["comment"]
    if review.save
      redirect_to "/attractions/#{review.attraction_id}", notice: "Thanks for leaving a review."
    else
      redirect_to "/attractions/#{review.attraction_id}", notice: "Not a valid review."
    end
  end

  def edit
    review_id = params["id"]
    review = Review.find_by(id: review_id)
    if session[:user_id] != review.user_id
      redirect_to "/reviews", notice: "You can only edit your own review."
    end
  end

  def update
    review = Review.find_by(id: params["id"])
    review.rating = params["rating"]
    review.comment = params["comment"]
    if review.save
      redirect_to "/reviews", notice: "Update successful."
    else
      redirect_to "/reviews/#{params["id"]}/edit", notice: "Not a valid edit."
    end
  end

  def destroy
    review_id = params["id"]
    review = Review.find_by(id: review_id)
    if session[:user_id] != review.user_id
      redirect_to "/reviews", notice: "You can only delete your own review."
    else
      review.delete
      redirect_to "/reviews"
    end
  end

end
