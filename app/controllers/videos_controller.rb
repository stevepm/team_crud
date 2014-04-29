class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new
    @video.url = params[:video][:url]
    @video.description = params[:video][:description]
    @video.rating = params[:video][:rating]
    if @video.save
      redirect_to "/videos/#{@video.id}", notice: "Video successfully created"
    else
      render :new
    end
  end

  def show
    @video = Video.find(params[:id])
    @youtube_id = @video.url.split(%r{(https?:\/\/youtu.be\/)|(https?:\/\/www.youtube.com\/watch\?v=)}).last
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    @video.url = params[:video][:url]
    @video.description = params[:video][:description]
    @video.rating = params[:video][:rating]
    if @video.save
      redirect_to "/videos/#{@video.id}"
    else
      render :new
    end
  end
end