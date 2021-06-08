class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :combo

  validates_uniqueness_of :combo_id, scope: :user_id
end
