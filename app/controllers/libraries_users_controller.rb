class LibrariesUsersController < ApplicationController

  before_action :logged_in?

  #
  # GET /users/:user_id/libraries
  #
  def index
    @user = User.find(params[:user_id])
    @libraries = @user.libraries
    render :index
  end

  #
  # POST /libraries/:library_id/users
  #
  # We don't need instance variables here because
  # we're not passing anything to a view
  #
  def create
    user = current_user
    library = Library.find(params[:library_id])
    user.libraries.push(library)
    redirect_to user_libraries_path(user)
  end

  def destroy
    user = current_user
    library = Library.find(params[:library_id])
    user.libraries.delete(library)
    redirect_to user_libraries_path(user)
  end

end
