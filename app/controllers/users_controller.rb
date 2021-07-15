class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user.params)
    @user = user.save
    redirect_to_book_path(current_user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @book = Book.new
    @users = User.all
    @user = User.find(current_user.id)
  end

  def edit
   end

  private
  def list_params
    params.require(:list).permit(:title, :body, :image)  end


end
