require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(email: "testuser@test.com", password: "p@ssW0rd", first_name: "test", last_name: "user") }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it 'has many articles' do
      assc = described_class.reflect_on_association(:articles)
      expect(assc.macro).to eq :has_many
    end

    it 'has many comments' do
      assc = described_class.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end
  end
end

