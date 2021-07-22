require "rails_helper"

RSpec.describe Review, type: :model do
  let(:book) { Book.new }
  subject(:review) do
    described_class.new(
      description: "this is a great book",
      rating: 3,
      book: book,
    )
  end

  it "is valid with valid attributes" do
    expect(review).to be_valid
  end

  describe "Database tables" do
    it { expect(review).to have_db_column(:description).of_type(:text) }
    it { expect(review).to have_db_column(:rating).of_type(:integer) }
    it { expect(review).to have_db_column(:book_id).of_type(:integer) }
  end

  describe "validations" do
    it { expect(review).to validate_length_of(:description) }
    it { expect(review).to validate_numericality_of(:rating) }
  end

  describe "associations" do
    it { should belong_to(:book) }
  end
end

#
#
#
#
describe "Reviews", type: :request do
  describe "GET /index" do
    before(:each) do
      get reviews_path
    end

    it "should respond with 200 ok" do
      expect(response).to have_http_status(:ok)
    end

    it "should respond with json" do
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    describe "GET /review/:id" do
      before(:all) do
        create(:user)
        create(:book)
        create(:review)
      end

      context "when going to a valid id" do
        before(:each) do
          build(:review)
          get "/reviews/1"
        end

        it "should respond with 200 ok" do
          expect(response).to have_http_status(:ok)
        end

        it "should respond with json" do
          expect(response.content_type).to eq("application/json; charset=utf-8")
        end
      end

      # context "when going to an invalid review" do
      #   before(:each) do
      #     build(:user)
      #     build(:book)
      #     @invaild_review = FactoryBot.build(:review, :invalidreview)
      #     post reviews_path
      #   end

      #   it "should be invalid with the wrong rating " do
      #     expect(@invaild_review).to be_invalid
      #   end
    end
  end
end
