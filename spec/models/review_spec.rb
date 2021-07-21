require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:book) { Book.new }
  subject(:review) do
    described_class.new(
      description: 'this is a great book',
      rating: 3,
      book: book
    )
  end

  it 'is valid with valid attributes' do
    expect(review).to be_valid
  end

  describe 'Database tables' do
    it { expect(review).to have_db_column(:description).of_type(:text) }
    it { expect(review).to have_db_column(:rating).of_type(:integer) }
    it { expect(review).to have_db_column(:book_id).of_type(:integer) }
  end

  describe 'validations' do
    it { expect(review).to validate_length_of(:description) }
    it { expect(review).to validate_numericality_of(:rating) }
  end

  describe 'associations' do
    it { should belong_to(:book) }
  end
end
