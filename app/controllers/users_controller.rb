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
  end

  def create
    @book = @user.books
    @book.save
    redirect_to user_path(current_user.id)
  end

  def update
  @user = User.find(params[:id])
  @user.update(list_params)
  redirect_to user_path(current_user.id)
  end

  private
  def list_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  def user_params

  end
end
