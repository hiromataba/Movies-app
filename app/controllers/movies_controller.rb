# rubocop:disable all
class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @movies = Movie.all.order("created_at DESC").paginate(page: params[:page], per_page: 4)
  end

  def show
    @reviews = Review.where(movie_id: @movie.id).order("created_at DESC")
    @avg_review = if @reviews.blank?
        0
      else
        @reviews.average(:rating).round(2)
      end
  end

  def new
    @movie = current_user.movies.build
  end

  def edit; end

  def search
    if params[:search].blank?
      redirect_to movies_path and return
    else
      @parameter = params[:search].downcase
      @movies = Movie.all.where("lower(category) LIKE ?", "%#{@parameter}%")
    end
  end

  def create
    @movie = current_user.movies.build(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def rate
    @movie = Movie.find(params[:movie_id])
    @rating = Rating.new(user_id: current_user.id, movie_id: @movie.id)
    @rating.save
    redirect_to movies_path
  end

  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :movie_length, :rating, :category, :image)
  end
end
