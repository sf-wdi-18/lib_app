class LibrariesController < ApplicationController

  before_action :logged_in?, only: [:new, :create]

  #
  # GET /libraries
  #
  def index
    @libraries = Library.all
    # set the current_user so that a "join" button will be
    #included in the view (unless current_user = nil)
    current_user
    render :index
  end

  #
  # GET /libraries/new
  #
  def new
    @library = Library.new
    render :new
  end

  #
  # GET /libraries/:id
  #
  def show
    @library = Library.find(params[:id])
  end

  #
  # GET /libraries/:id/edit
  #
  def edit
    @library = Library.find(params[:id])
  end

  #
  # POST /libraries
  #
  def create
    library = Library.create(library_params)
    redirect_to library_path(library)
  end

  #
  # PUT /libraries/:id
  #
  def update
    library = Library.find(params[:id])
    library.update(library_params)
    redirect_to library_path(params[:id])
  end

  private

  def library_params
    params.require(:library).permit(:name, :floor_count, :floor_area)
  end

end
