class PathologiesController < ApplicationController

  def index
    @pathologies = Pathologie.all
  end

  def show
    @pathologie = Pathologie.find(params[:id])
  end

  def new
    @pathologie = Pathologie.new
  end

  def create
    @pathologie = Pathologie.new(pathologie_params)
    @pathologie.user = current_user
    if @pathologie.save!
      redirect_to pathology_path(@pathologie)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pathologie = Pathologie.find(params[:id])
  end

  def update
    @pathologie = Pathologie.find(params[:id])
    @pathologie.update(pathologie_params)
    redirect_to pathologie_path(@pathologie)
  end

  private

  def pathologie_params
    params.require(:pathologie).permit(:name, :description)
  end
end
