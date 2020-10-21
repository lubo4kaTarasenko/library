class PaymentsController < ApplicationController
  def create    
    @book = Book.find(params[:book_id])
    #a = @book.user_books.create(user_id: current_user)  
    @book.users << current_user   
  end

  def promocode
    @book = Book.find(params[:book_id])
  end

  def enter_promo
    @book = Book.find(params[:book_id]) 
    current_user.phone = params[:phone]
    current_user.save

    @promo = Promocode.new(code: create_promocode)
    @promo.save
    puts @promo.code

    render :promocode
  end

  def confirm
    @book = Book.find(params[:book_id])  
    entered_promocode = params[:promocode]
    @promo = Promocode.where(code: entered_promocode).first
    if(@promo)
      @book = Book.find(params[:book_id])
      @book.users << current_user
      current_user.update(free_promo_used: true)
      render "books/show"
    else
      render :false_promo
    end
    #render :promocode
  end

  private
  def create_promocode
    rand(10**5..10**6-1)
  end
end