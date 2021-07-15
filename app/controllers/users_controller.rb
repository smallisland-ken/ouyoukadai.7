class UsersController < ApplicationController

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @book = Book.new
    # 空のインスタンス変数なのでnewは可能。
    @users = User.all
    @user = User.find(current_user.id)
  end

  def edit
   @user = User.find(params[:id])
   redirect_to_book_path(current_user.id)
  end

  private
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
  def user_params

  end
end
