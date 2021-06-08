class Combo < ApplicationRecord

  with_options presence: true do
    validates :start_percent
    validates :combo_route
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :fighter_id
  end

  belongs_to :user
  has_many :comments
  has_many :favorites, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :fighter
end
