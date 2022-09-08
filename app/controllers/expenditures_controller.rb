class ExpendituresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_expenditure, only: %i[show edit update destroy]

  # GET /expenditures or /expenditures.json
  def index
    @header = 'Expenditures'
    @category_id = Category.find(params[:category_id])
    @expenditures = Expenditure.where(category_id: @category_id)
  end

  # GET /expenditures/new
  def new
    @category_id = Category.find(params[:category_id]).id
    @expenditure = Expenditure.new
  end

  # POST /expenditures or /expenditures.json
  def create
    @expenditure = Expenditure.new(expenditure_params)
    @expenditure.user_id = current_user.id
    @category = Category.find(params[:category_id])

    @expenditure.category_id = @category.id

    if @expenditure.save
      redirect_to user_category_expenditures_url(user_id: current_user.id, category_id: @category.id)
    else
      render :new
    end
  end

  def set_expenditure
    @expenditure = Expenditure.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expenditure_params
    params.require(:expenditure).permit(:name, :amount)
  end
end
