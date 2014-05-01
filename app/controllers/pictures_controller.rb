require "instagram"

class PicturesController < ApplicationController
  Instagram.configure do |config|
    config.client_id = ENV["INSTAGRAM_CLIENT_ID"]
    config.client_secret = ENV["INSTAGRAM_CLIENT_SECRET"]
  end

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    picture = Picture.new(allowed_parameters)
    if picture.save
      redirect_to "/pictures/#{picture.id}", notice: "Picture successfully created"
    else
      @picture = picture
      render :new
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @picture = Picture.find(params[:id])
    render :edit
  end

  def update
    picture = Picture.find(params[:id])
    picture.update_attributes(allowed_parameters)
    if picture.save
      redirect_to "/pictures/#{picture.id}", notice: "Picture successfully edited"
    else
      @picture = picture
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_path
  end

  def instagram
    client = Instagram.client
    @media_items = client.media_search("40.0176335", "-105.2819911")
  end

  private

  def allowed_parameters
    params.require(:picture).permit(:url, :description, :rating)
  end
end