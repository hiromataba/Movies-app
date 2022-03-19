class AddRatingCountToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :rating_count, :integer
  end
end
