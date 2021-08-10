class Book < ApplicationRecord

    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :liked_users, through: :favorites, source: :user    
    has_many :book_comments, dependent: :destroy

    validates :title, presence: true
    validates :body, presence: true, length: { maximum: 200 }

    def favorited_by?(user)
        # 上は自分で命名しておｋだが、わかりやすいことが前提
    favorites.where(user_id: user.id).exists?
    end
    
    # 本の投稿数を数える機能を追加
    scope :created_today, -> { where(created_at: Time.zone.now.all_day) } # 今日
    scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) } # 前日    
    
end
