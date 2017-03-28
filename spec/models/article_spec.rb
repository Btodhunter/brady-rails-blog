require 'rails_helper'

RSpec.describe Article, type: :model do
  it "is valid with valid attributes"
  it "is not valid without title"
  it "is not valid without author id"
  it "is not valid without created date"
  it "is not valid without body"
end
