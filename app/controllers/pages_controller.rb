class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @user = current_user
    @requests = Request.all.select{|hen| hen.user_id == @user.id}
  end

end

