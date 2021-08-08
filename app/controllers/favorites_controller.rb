class FavoritesController < ApplicationController
    def create
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id:@book.id)
    # book_id: book.idのままだと、どの本のidか不明なので、一つ前の行に記述してある@bookを使用すればそのまま本のidを引き渡せる。
    favorite.save
    end

    def destroy
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: @book.id)
    favorite.destroy
    end
    
end
