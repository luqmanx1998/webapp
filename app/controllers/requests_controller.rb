class RequestsController < ApplicationController

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        flash[:user_request] = true
        format.html { redirect_to requested_path }
      else
        format.html { render :new }
      end
    end
  end

  def requested
  end

  private

    def request_params
      params.require(:request).permit(:email)
    end

end
