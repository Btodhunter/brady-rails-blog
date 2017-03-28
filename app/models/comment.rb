# Table name: comments
#
# id             :integer, primary key
# author_name    :string
# body           :text
# user_id        :integer, foreign key
# article_id     :integer, foreign key
# created_at     :datetime
# updated_at     :datetime

class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  validates :author_name, presence: true, length: {maximum: 140}
  validates :body, presence: true, length: {maximum: 512}
end
