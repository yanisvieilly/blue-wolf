class Answer < ActiveRecord::Base
  belongs_to :question

  validates :value, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10
  }
end
