class HensController < ApplicationController

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

  private

  def hen_params
    params.require(:hen).permit(:user_id, :description, :disponibility, :price, :name, :age)
  end

end
