class RequestsController < ApplicationController

  def new
      @hen = Hen.find(params[:hen_id])
      @request = Request.new
    end

    def create
      @request = Request.new(requests_params)
      @request.user = current_user
      @hen = Hen.find(params[:hen_id])
      @request.hen = @hen
      @request.save
      if @request.save
        redirect_to dashboard_path
      else
        render :new
      end
    end

    private

    def requests_params
      params.require(:request).permit(:duration)
    end
end
