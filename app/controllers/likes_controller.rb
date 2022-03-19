class LikesController < ApplicationController
  def create 
    movie = Movie.find params[:movie_id]
    liked = Like.where(movie_id: movie.id, user_id: current_user.id).first
    like = movie.likes.new user: current_user
      if liked 
         liked.destroy
      else
        like.save
      end
    redirect_to movies_path
  end

  def destroy
      movie = Movie.find params[:id] 
      flash[:alert] = 'Failed to unlike post!' unless movie.users.delete current_user
      redirect_to user_movie_path(movie.user.id, movie.id)
  end
end 