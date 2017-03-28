require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'Associations' do
    it 'belongs to an article' do
      assc = described_class.reflect_on_association(:articles)
      expect(assc.macro).to eq :has_many
    end

    it 'belongs to a user' do
      assc = described_class.reflect_on_association(:taggings)
      expect(assc.macro).to eq :has_many
    end
  end
end
