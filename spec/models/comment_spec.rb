require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create!(email: "testuser@test.com", password: "p@ssW0rd", password_confirmation: "p@ssW0rd", id: 100) }
  let(:article) { Article.create!(title: "Test", body: "Test body", id: 100, user_id: user.id) }
  subject { described_class.new(id: 1, body: "Body of Comment", author_name: "Author", user_id: user.id, article_id: article.id) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without body' do
      subject.body = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without author name' do
      subject.author_name = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without user id' do
      subject.user_id = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without article_id' do
      subject.article_id = nil
      expect(subject).not_to be_valid
    end
  end

  describe 'Associations' do
    it 'belongs to an article' do
    assc = described_class.reflect_on_association(:article)
    expect(assc.macro).to eq :belongs_to
    end

    it 'belongs to a user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
