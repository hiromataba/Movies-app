class Like < ApplicationRecord
  belongs_to :user
  belongs_to :movie, counter_cache: :likes_counter
  # after_save :update_counter
  # validates :user_id, uniqueness: { scope: :post_id }

  def update_counter(value)
    movie.update(likes_counter: value)
  end
end
