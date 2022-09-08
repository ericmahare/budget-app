class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @header = 'Transactions'
    @categories = Category.where(users_id: current_user.id)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.users_id = current_user.id
    if @category.save
      flash[:success] = 'category created succesfully'
      redirect_to user_categories_path(current_user)
    else
      render 'new'
    end
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
