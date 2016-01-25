class Question < ActiveRecord::Base
  has_many :answers, -> { order(created_at: :desc) }, dependent: :destroy

  validates :title, presence: true
end
