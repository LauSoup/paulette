class UsersController < ApplicationController

  def index
    users_initial = User.all
    @users = users_initial.reject { |user| user.hens.empty? }
  end

  def show
    @user = User.find(params[:id])
    # For now @user.hens but should become @user.hens.select{|hen| hen.availability == true}
    @hens = @user.hens

  end

end
