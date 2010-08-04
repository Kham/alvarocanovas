class CategoriesController < ApplicationController

  def show
    @category = Category.includes(:pictures).find(params[:id])
  end
  
end
