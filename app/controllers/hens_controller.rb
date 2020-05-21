class HensController < ApplicationController

  before_action :set_hen, only: [:edit, :update]


  def new
    @hen = Hen.new
    authorize @hen
    @user = current_user
  end

  def create
    @hen = Hen.new(hen_params)
    @hen.user = current_user
    authorize @hen
    if @hen.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end 

  def edit
    authorize @hen
    @user = current_user
  end

  def update
    authorize @hen
    if @hen.update(hen_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end


  private

  def hen_params
    params.require(:hen).permit(:user_id, :description, :disponibility, :price, :name, :age,:photo)
  end

  def set_hen
    @hen = Hen.find(params[:id])
  end

end
