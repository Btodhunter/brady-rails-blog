# Table name: users
#
# id         :integer, primary key
# email      :string
# created_at :datetime
# updated_at :datetime
# first_name :string
# last_name  :string
# about_me   :text

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles
  has_many :comments

end
