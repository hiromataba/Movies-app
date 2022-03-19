class AddLikesCounterToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :likes_counter, :integer
  end
end
