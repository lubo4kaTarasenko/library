class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable


  has_many :user_books
  has_many :books, through: :user_books

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :send_greating

  def send_greating
    UserMailer.with(user: self).welcome_email.deliver_now
  end
end
