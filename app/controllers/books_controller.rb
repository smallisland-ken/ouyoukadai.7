class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @book = Book.new
    # 空のモデルを持ってくる
    @books = Book.all
    # bookモデルからすべての情報をもってくる


  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to 
  end

  private

  def book_params
  params.require(:book).permit(:title, :body)
  # これが小文字の理由は？
  end

end
