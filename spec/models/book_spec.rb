require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:user) { User.new }
  subject(:book) do
    described_class.new(
      author: 'J.K. Rowling',
      title: 'Harry Potter and the Chamber of Secrets',
      year: 1998,
      genre: 'Fantasy',
      status: 'read',
      user: user
    )
  end

  it 'is valid with valid attributes' do
    expect(book).to be_valid
  end

  describe 'Database tables' do
    it { expect(book).to have_db_column(:author).of_type(:string) }
    it { expect(book).to have_db_column(:title).of_type(:string) }
    it { expect(book).to have_db_column(:year).of_type(:integer) }
    it { expect(book).to have_db_column(:genre).of_type(:string) }
    it { expect(book).to have_db_column(:status).of_type(:string) }
    it { expect(book).to have_db_column(:user_id).of_type(:integer) }
  end

  describe 'validations' do
    it 'should be invalid without an author' do
      book.author = nil
      expect(book).to_not be_valid
    end

    it 'should be invalid without an title' do
      book.title = nil
      expect(book).to_not be_valid
    end

    it 'should be invalid without an year' do
      book.year = nil
      expect(book).to_not be_valid
    end

    it 'should be invalid without an genre' do
      book.genre = nil
      expect(book).to_not be_valid
    end
    it 'should be invalid without an status' do
      book.status = nil
      expect(book).to_not be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end

describe 'Books', type: :request do
  describe 'GET /index' do
    before(:each) do
      get books_path
    end

    it 'should respond with 200 ok' do
      expect(response).to have_http_status(:ok)
    end

    it 'should respond with json' do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'GET /books/:id' do
    before(:all) do
      create(:user)
      create(:book)
    end

    context 'when going to a valid id' do
      before(:each) do
        build(:book)
        get '/books/1'
      end

      it 'should respond with 200 ok' do
        expect(response).to have_http_status(:ok)
      end

      it 'should respond with json' do
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end
    end
  end
end
