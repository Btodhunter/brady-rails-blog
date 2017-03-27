class Comment < ApplicationRecord
  belongs_to :article
  validates :author_name, presence: true, length: {maximum: 140}
  validates :body, presence: true, length: {maximum: 512}
end
