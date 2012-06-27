class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'NO TIENE PERMISO PARA VER ESTA PAGINA.'
    @users = User.all
  end

  def show
  @user = User.find(params[:id])

   	if !params[:info_request].nil?
     #@specific_request = InfoRequest.find(params[:info_request])
     @specific_request = InfoRequest.select("info_requests.*, users.name").
   	     		joins('LEFT OUTER JOIN users ON users.id = info_requests.creator_id').where("info_requests.id = #{params[:info_request]}").last
    # @specific_request = InfoRequest.select("info_requests.*, users.name").
   	 #    		joins('LEFT OUTER JOIN users ON users.id = info_requests.creator_id').where("id = 1")
   	 # @specific_request = InfoRequest.find(:all, :joins => "INNER JOIN users ON users.id = info_requests.creator_id",
   	 # 	:select => "info_requests.title, users.name")
   	 # @specific_request = @specific_request.where(:id => "1")
   	     		

    else
    end
   
    if current_user.nil?
  	else
  		if current_user.has_role? :admin
  			@info_requests = InfoRequest.select("info_requests.*, users.name").
   	     		joins('LEFT OUTER JOIN users ON users.id = info_requests.creator_id')
   	     	
  		else
  			@info_requests = InfoRequest.select("info_requests.*, users.name").
   	     		joins('LEFT OUTER JOIN users ON users.id = info_requests.creator_id').where("creator_id = #{current_user.id}")
  		end
  	end
  end

  respond_to do |format|
    format.html { render 'show' }
    format.js
  end

end
