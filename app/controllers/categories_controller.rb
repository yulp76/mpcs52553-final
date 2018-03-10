class CategoriesController < ApplicationController

  def index
    unless session[:admin]
      redirect_to "/", notice: "Administrator Only."
    end
  end

  def new
    unless session[:admin]
      redirect_to "/", notice: "Administrator Only."
    end
  end

  def create
    unless session[:admin]
      redirect_to "/", notice: "Administrator Only."
    end
    category = Category.new
    category.name = params["name"]
    category.save
    redirect_to "/categories"
  end

end
