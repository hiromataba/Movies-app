class AddImageToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :image, :string
  end
end
