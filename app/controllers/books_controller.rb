class BooksController < ApplicationController

  def show

  end

  def index
    end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path(current_user.id)
  end

  private

  def book_params
  params.require(:book).permit(:title, :body)
  # これが小文字の理由は？
  end

end
