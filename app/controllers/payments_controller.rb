class PaymentsController < ApplicationController
  def create    
    @book = Book.find(params[:book_id])
    #a = @book.user_books.create(user_id: current_user)  
    a = @book.users << current_user
    puts a.inspect
    
  end
end