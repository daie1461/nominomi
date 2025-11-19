class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :nominomis, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_nominomis, through: :likes, source: :nominomi

  has_many :comments, dependent: :destroy

  validates :name, presence: true 
  validates :profile, length: { maximum: 200 } 

  validates :name, presence: true, length: { in: 2..50 }
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}


  def already_liked?(nominomi)
    self.likes.exists?(nominomi_id: nominomi.id)
  end
  
         
end
