class Book < ApplicationRecord
  
  has_one_attached :cover
  has_one_attached :content

  has_many :user_books
  has_many :users, through: :user_books

  validates :title, presence: true,
                    length: { minimum: 2 }


end