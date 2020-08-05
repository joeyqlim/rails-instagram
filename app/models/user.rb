class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :followships
  has_many :followings, :through => :followships
  has_many :inverse_followships, :class_name => "Followship", :foreign_key => "following_id"
  has_many :inverse_followings, :through => :inverse_followships, :source => :user
end
