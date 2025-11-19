class Like < ApplicationRecord
  belongs_to :nominomi
  belongs_to :user

  validates_uniqueness_of :nominomi_id, scope: :user_id

end
