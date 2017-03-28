require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is valid with valid attributes"
  it "is not valid without body" do
    article = Article.new(body: nil)
    expect(article).to be_valid
  end
  it "is not valid without author name"
  it "is not valid without user id"
end
