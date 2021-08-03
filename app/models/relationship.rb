class Relationship < ApplicationRecord
    belongs_to :follower, class_name: "User"
    belongs_to :followed, class_name: "User"
    # class_nameの記載がないと存在しないfollowerやfollowedテーブルを参照するので
    # class_nameを記載することでuserモデルのUsersテーブルを参照してくれる。
end
