class UsersController < ApplicationController

  before_action :logged_in?, only: [:show]

  #
  # GET /users
  #
  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  #
  # GET /users/:id
  #
  def show
    @user = User.find(params[:id])
    render :show
  end

  #
  # GET /users/:id/edit
  #
  def edit
    @user = User.find(params[:id])
    render :edit
  end

  #
  # POST /users
  #
  # No instance variables necessary since not passing along to a view
  #
  def create
    user = User.create(user_params)
    login(user)
    redirect_to user_path(user)
  end

  #
  # PUT /users/:id
  #
  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
