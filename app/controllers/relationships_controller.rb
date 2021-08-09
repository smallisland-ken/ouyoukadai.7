class RelationshipsController < ApplicationController
  
  def create
    current_user.follow(params[:user_id])
      redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer  
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end



    # @relationship= Relationship.new
    # @relationship.follower_id = current_user.id
    # @relationship.followed_id = User.find(params[:user_id]).id
    # @relationship.save
    # @book = Book.new
    # # 空のインスタンス変数なのでnewは可能。
    # @users = User.all
    # @user = User.find(current_user.id)
  # render template: "users/index"