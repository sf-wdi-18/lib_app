class SessionsController < ApplicationController

  #
  # GET /login
  #
  def new
    render :new
  end

  #
  # POST /sessions
  #
  def create
    @user = User.confirm(user_params)
    if @user
      login(@user)
      redirect_to "/users/#{@user.id}"
    else
      redirect_to "/sign_in"
    end
  end

  def destroy
    logout
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
