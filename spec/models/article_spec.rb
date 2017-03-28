require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) { User.create!(email: "testuser@test.com", password: "p@ssW0rd", password_confirmation: "p@ssW0rd", id: 1) }
  subject { described_class.new(id: 1, title: "Test title", body: "Test Body", user_id: user.id) }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without body' do
      subject.body = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without title' do
      subject.title = nil
      expect(subject).not_to be_valid
    end
  end

  describe 'Associations' do
    it 'has many comments' do
      assc = described_class.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end

    it 'has many tags' do
      assc = described_class.reflect_on_association(:tags)
      expect(assc.macro).to eq :has_many
    end

    it 'has many comments' do
      assc = described_class.reflect_on_association(:taggings)
      expect(assc.macro).to eq :has_many
    end

    it 'belongs to a user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end

  describe 'TagList' do
    it "Sets and returns a list of tags" do
      subject.tag_list="tag1, tag2, tag3"
      expect(subject.tag_list).to eq "tag1, tag2, tag3"
    end
  end
end
