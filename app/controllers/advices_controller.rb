class AdvicesController < ApplicationController
  def index
    @advices = Advice.all
  end

  def show
    @advice = Advice.find(params[:id])
  end

  def new
    @advice = Advice.new
  end

  def create
    @advice = Advice.new(advice_params)
    if @advice.save
      redirect_to advice_path(@advice)
    else
      render :new
    end
  end

  def edit
    @advice = Advice.find(params[:id])
  end

  def update
    @advice = Advice.find(params[:id])
    if @advice.update
      redirect_to advice_path(@advice)
    else
      render :edit
    end
  end

  private

  def advice_params
    params.require(:advice).permit(:content, :user_id)
  end

end