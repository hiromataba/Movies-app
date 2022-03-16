require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:user) { User.create(email: 'test@gmail.com') }
  let(:movie) do
    described_class.create(user: user, title: 'Life in a year', description: 'great movie', rating: 'pg 13', movie_length: '1h 30m', category: 'romantic')
  end

  describe 'create movie' do
    it 'should be valid' do
      expect(Movie.new).to be_an_instance_of(Movie)
    end

    it 'should have a title' do
      movie.title = 'Life in a year'
      expect(movie).to be_valid
    end

    it 'should have a description' do
      movie.description = 'great movie'
      expect(movie).to be_valid
    end

    it 'should have a rating' do
      movie.rating = 'pg 13'
      expect(movie).to be_valid
    end

    it 'should have a movie_length' do
      movie.movie_length = '1h 30m'
      expect(movie).to be_valid
    end

    it 'should have a category' do
      movie.category = 'romantic'
      expect(movie).to be_valid
    end

    it 'should have a user' do
      movie.user = user
      expect(movie).to be_valid
    end
  end

  describe 'associations' do
    it 'should belong to a user' do
      review = Movie.reflect_on_association(:user)
      expect(review.macro).to eq(:belongs_to)
    end

    it 'should belong to a movie' do
      review = Movie.reflect_on_association(:reviews)
      expect(review.macro).to eq(:has_many)
    end
  end

end
