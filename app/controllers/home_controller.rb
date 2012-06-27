class HomeController < ApplicationController
  
  def index

  	if current_user.nil?
  	else
  		if current_user.has_role? :admin
  			@info_requests = InfoRequest.select("info_requests.*, users.name").
   	     		joins('LEFT OUTER JOIN users ON users.id = info_requests.creator_id')
   	     	
  		else
  			@info_requests = InfoRequest.select("info_requests.*, users.name").
   	     		joins('LEFT OUTER JOIN users ON users.id = info_requests.creator_id').where("creator_id = #{current_user.id}")
  		end

      redirect_to :controller => 'users', :action => 'show', :id => current_user.id
      
  	end

    # if !current_user.nil? && !current_user.has_role? :admin
   	#    @info_requests = InfoRequest.select("info_requests.*, users.*").
   	#      joins('LEFT OUTER JOIN users ON users.id = info_requests.creator_id').where("creator_id = #{current_user.id}")
   	# elsif ((!current_user.nil?) && (current_user.has_role? :admin))
   	# 	@info_requests = InfoRequest.all   		
   	# end

  end

end
