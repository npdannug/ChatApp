class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable

  validates_presence_of :username, uniqueness: true
  validates :username, length: { minimum: 6, maximum: 15 }
end
