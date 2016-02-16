class FilmsController < ApplicationController
  def index
    @films = Film.all
  end

  def show
  end

  def new
    @film = Film.new
  end

  def create
    Film.create film_params
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def film_params
    params[:film].permit(Film.presentative_attributes)
  end
end
