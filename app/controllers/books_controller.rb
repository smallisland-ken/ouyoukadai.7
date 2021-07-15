class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end

  private

  def book_params
  params.require(:book).permit(:title, :body)
  # これが小文字の理由は？
  end

end
