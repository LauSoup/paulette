class RequestsController < ApplicationController

  def new
      @hen = Hen.find(params[:hen_id])
      # @user = User.find(params[:user_id])
      @request = Request.new
    end

    def create
      @request = Request.new(requests_params)
      @hen = Hen.find(params[:hen_id])
      @request.hen = @hen
      @request.save
      if @request.save
        redirect_to hens_path(@hen)
      else
        render :new
      end
    end

    private

    def requests_params
      params.require(:request).permit(:duration, :hen_id, :user_id)
    end
end
