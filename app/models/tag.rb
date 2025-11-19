class Tag < ApplicationRecord
   validates :name, presence: true
  #Tagsテーブルから中間テーブルに対する関連付け
  has_many :nominomi_tag_relations, dependent: :destroy
  #Tagsテーブルから中間テーブルを介してArticleテーブルへの関連付け
  has_many :nominomis, through: :nominomi_tag_relations, dependent: :destroy 
end
