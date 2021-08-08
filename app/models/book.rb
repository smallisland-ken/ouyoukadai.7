class Book < ApplicationRecord

    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :book_comments, dependent: :destroy
    

    validates :title, presence: true
    validates :body, presence: true, length: { maximum: 200 }

    def favorited_by?(user)
        # 上は自分で命名しておｋだが、わかりやすいことが前提
    favorites.where(user_id: user.id).exists?
    end
    
    
end
