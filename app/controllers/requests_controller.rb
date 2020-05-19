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

  def edit
    @request = Request.find(params[:id])
    @hen = @request.hen
  end

  def update
    @request = Request.find(params[:id])
    @hen = @request.hen
    if @request.update(requests_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @hen = @request.hen
    @request.destroy
    redirect_to dashboard_path
  end

    private

    def requests_params
      params.require(:request).permit(:duration, :user_id, :hen_id)
    end
end
