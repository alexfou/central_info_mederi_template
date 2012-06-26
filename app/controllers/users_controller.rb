class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'NO TIENE PERMISO PARA VER ESTA PAGINA.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
