class Question < ActiveRecord::Base
  has_many :answers, -> { order(created_at: :desc) }

  validates :title, presence: true
end
