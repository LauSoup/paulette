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
    # @hen = Hen.find(params[:hen_id])
    # @request = @hen.request
  end

  def update
    # @hen = Hen.find(params[:hen_id])
    # @request = @hen.request
    @request = Request.find(params[:id])
    @hen = @request.hen
    if @request.save
      redirect_to dashboard_path
    else
      render 'edit'
    end
  end

  # def destroy
  #   @request = Request.find(params[:id])
  #   @request.destroy
  #   redirect_to dashboard_path
  # end

    private

    def requests_params
      params.require(:request).permit(:duration)
    end
end
