class UsersController < ApplicationController

  def index
    # @users = User.all
    users_initial = User.all
    @users = users_initial.reject do |user|
      user.hens.empty?
    end
  @users
  end

  def show
    @user = User.find(params[:id])
  end

end
