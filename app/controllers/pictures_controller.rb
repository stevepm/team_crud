class PicturesController < ApplicationController
  def index
  end

  def new
    @picture = Picture.new
  end

  def create
    picture = Picture.new(allowed_parameters)
    if picture.save
      redirect_to "/pictures/#{picture.id}", notice: "Picture successfully created"
    else
      render :new
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  private

  def allowed_parameters
    params.require(:picture).permit(:url, :description, :rating)
  end
end