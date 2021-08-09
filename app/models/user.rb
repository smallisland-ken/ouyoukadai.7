class User < ApplicationRecord
  attachment :profile_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :name, length: { minimum: 2 }
         validates :name, length: { maximum: 20 }
         validates :introduction, length: { maximum: 50 }
         validates :name, uniqueness: true

         has_many :books, dependent: :destroy
         has_many :favorites, dependent: :destroy

        #フォロー系のアソシエーション  
         has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
         has_many :followers, through: :reverse_of_relationships, source: :follower
         # 被フォロー関係を通じて参照→followed_idをフォローしている人
         has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
         # 【class_name: "Relationship"】は省略可能
         has_many :followings, through: :relationships, source: :followed
        # 与フォロー関係を通じて参照→follower_idをフォローしている人
         has_many :book_comments, dependent: :destroy
        
        # フォロー判定するためのメソッド
        def follow(user_id)
            relationships.create(followed_id: user_id)
        end
        def unfollow(user_id)
            relationships.find_by(followed_id: user_id).destroy
        end
        def following?(user)
            followings.include?(user)
        end

end
