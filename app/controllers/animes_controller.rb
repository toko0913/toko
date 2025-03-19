class AnimesController < ApplicationController
  def index
    @animes = Anime.all
  end

  def new
    @anime = Anime.new
  end
    
  def create
    anime = Anime.new(anime_params)
    if anime.save!
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end

  def show
    @anime = Anime.find(params[:id])
    @comments = @anime.comments
    @comment = Comment.new
  end

  def edit
    @anime = Anime.find(params[:id])
  end

  def destroy
    anime = Anime.find(params[:id])
    anime.destroy
    redirect_to action: :index
  end

  def create
    anime = Anime.new(anime_params)
    if anime.save
      redirect_to :action => "index"
    else
      redirect_to :action => "show"
    end
  end

  private
  def anime_params
    params.require(:anime).permit(:name, :about, :image)
  end
end
