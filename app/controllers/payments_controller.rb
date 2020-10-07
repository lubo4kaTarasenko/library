class PaymentsController < ApplicationController
  def create    
    @book = Book.find(params[:book_id])
    #a = @book.user_books.create(user_id: current_user)  
    @book.users << current_user   
  end

  def promocode
  end

  def confirm
    current_user.phone = params[:phone]
    current_user.save
    promo = create_promocode
    puts promo

    render :promocode
  end

  private
  def create_promocode
    promo =  rand(10**5..10**6-1)
  end
end