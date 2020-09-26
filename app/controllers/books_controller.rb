class BooksController < ApplicationController
  
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end


  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book
    else
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])
  
    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
  
    redirect_to books_path
  end

  private
  def book_params
    if params.dig(:book, :cover)
      image = MiniMagick::Image.new(params[:book][:cover].tempfile.path)
      image.resize "50x50"
    end

    params.require(:book).permit(:title, :author, :cover, :content)
  end
end
