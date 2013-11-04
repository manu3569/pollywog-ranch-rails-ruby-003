class FrogsController < ApplicationController

  before_action :set_frog, :only => [:show, :edit, :update, :destroy]
  before_action :set_ponds, :only => [:new, :edit]
  def index
    @frogs = Frog.all
  end

  def create
    @frog = Frog.create(frog_params)
    redirect_to frogs_path
  end

  def new
    @frog = Frog.new
  end

  def show
  end

  def edit
  end

  def update
    @frog.update_attributes(frog_params)
    redirect_to frogs_path
  end

  def destroy
    @frog.destroy
    redirect_to frogs_path
  end

  private

    def set_frog
      @frog = Frog.find(params[:id])
    end

    def set_ponds
      @ponds = Pond.all
    end

    def frog_params
      params.require(:frog).permit(:name, :color, :pond_id)
    end

end
