class Book < ApplicationRecord
  has_one_attached :cover
  has_one_attached :content

  validates :title, presence: true,
                    length: { minimum: 2 }
end
