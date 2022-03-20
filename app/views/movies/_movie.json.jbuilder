json.extract! movie, :id, :title, :description, :movie_length, :rating, :category, :created_at, :updated_at
json.url movie_url(movie, format: :json)
