class TadpolesController < ApplicationController

  before_action :set_tadpole, :only => [:show, :edit, :update, :destroy]

  def index
    @tadpoles = Tadpole.all
  end

  def create
    @frog = Frog.find(params[:tadpole][:frog_id])
    @tadpole = @frog.tadpoles.create(tadpole_params)
    redirect_to '/tadpoles'
  end

  def new
    @frog = Frog.find(params[:id])
    @tadpole = @frog.tadpoles.build
  end

  def show
  end

  def edit
  end

  def update
    @tadpole.update_attributes(tadpole_params)
    redirect_to "/tadpoles"
  end

  def destroy
    @tadpole.destroy
    redirect_to "/tadpoles"
  end

  def evolve
    @tadpole = Tadpole.find(params[:id])
    @pond = @tadpole.frog.pond
    @frog = @pond.frogs.create(name: @tadpole.name, color: @tadpole.color)
    @tadpole.destroy
    redirect_to tadpoles_path
  end

  private

    def set_tadpole
      @tadpole = Tadpole.find(params[:id])
    end

    def tadpole_params
      params.require(:tadpole).permit(:name, :color)
    end


end
