class PagesController < ApplicationController
  def home
  end

  def dashboard
    # @user = current_user
    @user = User.find(1)
  end
  
end
