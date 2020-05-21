class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    # users_initial = User.all
    # @users = users_initial.reject { |user| user.hens.empty? }
    @users = policy_scope(User)
  end

  def show
    @user = User.find(params[:id])
    # For now @user.hens but should become @user.hens.select{|hen| hen.availability == true}
    @hens = @user.hens
    authorize @user
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    authorize @user
    if @user.update(user_params)
        redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :description, :address)
  end
  

end
