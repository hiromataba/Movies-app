require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(email: 'test@gmail.com', password: 'password' ) }
  let(:movie) do
    described_class.create(user: user, title: 'Life in a year', description: 'great movie', rating: 'pg 13', movie_length: '1h 30m', category: 'romantic')
  end

  describe "a specification" do
    it "should be valid" do
      expect(User.new).to be_an_instance_of(User)
    end

    it "should have a email" do
      expect(user.email).to eq('test@gmail.com')
    end

    it "should have a password" do
      expect(user.password).to eq('password')
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
