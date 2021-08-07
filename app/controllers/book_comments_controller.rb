class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(post_comment_params)
    # (post_comment_params)はストロングパラメータ
    # アソシエーションを使った場合にbook_commentsで記載ができる。
    # comment = BookComment.new(post_comment_params)
    comment.book_id = @book.id
    # comment.user_id = current_user.id
    comment.save
  end

  def destroy
    @book = Book.find(params[:book_id])
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    # user_id: params[:id],これは必要ない。なぜかとbook_idを取得した時点でアソシエーションにより、bookモデル内にあるuser_idがあるため、今回の場合はbook_idを取得することで自動的にuserのidも取得できる。
  end
  
  private

  def post_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
