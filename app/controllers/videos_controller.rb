class VideosController < ApplicationController
  def index
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new
    @video.url = params[:video][:url]
    @video.description = params[:video][:description]
    @video.rating = params[:video][:rating]
    @video.save
    redirect_to "/videos/#{@video.id}"
  end

  def show
    @video = Video.find(params[:id])
  end
end