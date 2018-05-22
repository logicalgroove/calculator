class CalculatorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @calculations = current_user.calculations.order(created_at: :desc)
  end

  def show
    @calculator = current_user.calculations.find(params[:id])
  end

  def new
    @calculator = Calculator.new
  end

  def create
    @calculator = current_user.calculations.create(calculator_params)
    respond_to do |format|
      if @calculator.save
        format.json { render json: @calculator, status: :created, location: @calculator }
      else
        format.json { render json: @calculator.errors, status: :unprocessable_entity  }
      end
    end
  end

  private

  def calculator_params
    params.require(:calculator).permit(:a, :b, :operation)
  end
end
