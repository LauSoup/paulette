class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    users_initial = User.all
    @users = users_initial.reject { |user| user.hens.empty? }
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

end
