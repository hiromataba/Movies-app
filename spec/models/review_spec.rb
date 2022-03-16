require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:user) { User.create(email: 'test@gmail.com') }
  let(:movie) do
    described_class.create(user: user, title: 'Life in a year', description: 'great movie', rating: 'pg 13', movie_length: '1h 30m', category: 'romantic')
  end

  describe 'create review' do
    it 'should be valid' do
      expect(Review.new).to be_an_instance_of(Review)
    end
  end

  describe 'associations' do
    it 'should belong to a user' do
      review = Review.reflect_on_association(:movie)
      expect(review.macro).to eq(:belongs_to)
    end

    it 'should belong to a movie' do
      review = Review.reflect_on_association(:user)
      expect(review.macro).to eq(:belongs_to)
    end
  end

end
