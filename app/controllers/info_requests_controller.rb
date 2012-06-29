class InfoRequestsController < ApplicationController

  def new
  #	@info_request = InfoRequest.new
  end

  def create
  	current_user.created_info_requests.create(params[:info_request])

    #flash[:notice] = "#{@info_request.title} was successfully created."
    redirect_to user_path @current_user
  end
end
