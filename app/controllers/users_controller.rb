class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    users_initial = User.all
    @users = users_initial.reject { |user| user.hens.empty? }
  end

  def show
    @user = User.find(params[:id])
<<<<<<< HEAD
    authorize @user
=======
    # For now @user.hens but should become @user.hens.select{|hen| hen.availability == true}
    @hens = @user.hens

>>>>>>> ac1baf847e4f9d7d653d534fa3cb27a001aa5ced
  end

end
