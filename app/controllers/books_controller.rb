class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @bookdetail = @book.user
  end

  def index
    @user = current_user
    @book = Book.new
    # 空のモデルを持ってくる
    @books = Book.all
    # bookモデルからすべての情報をもってくる
    # @bookfind = Book.find(params[:id])
    # @bookfind.user_id = current_user.id
    end

  def create
    @book = Book.new(book_params)
    # この時点でidが自動で付与される。
    @book.user_id = current_user.id
    # 上部コードがないとbookモデルにuser_idが付与されないので、エラーとなってしまう。
    @book.save
    redirect_to book_path(@book)
  end

  def edit
   @editbook = Book.find(params[:id])
  end

  def update
   book = Book.find(params[:id])
   book.update(book_params)
   redirect_to book_path(book.id)

  end

  def destroy
   book = Book.find(params[:id])
   book.destroy
   redirect_to books_path
  end


  private

  def book_params
  params.require(:book).permit(:title, :body)
  # これが小文字の理由は？
  end
end
