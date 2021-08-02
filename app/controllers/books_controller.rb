class BooksController < ApplicationController
  before_action :authenticate_user!

  def new
    @book = Book.new
  end

  def show
    @book_new = Book.new
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
    if @book.save
    flash[:notice] = "You have created book successfully."

    redirect_to book_path(@book)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def edit
   @book = Book.find(params[:id])
  @bookuser = @book.user
  if @bookuser == current_user
      render "edit"
  else
    redirect_to books_path
  end
  end

  def update
   @book = Book.find(params[:id])
   if @book.update(book_params)
   flash[:notice] = "You have updated book successfully."
   redirect_to book_path(@book.id)

   else
    render :edit
    # editのviewだけを表示しているが、コントローラーはupdateの内容が実行されている。
   end
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
