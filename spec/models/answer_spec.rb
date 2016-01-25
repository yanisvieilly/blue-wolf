require 'rails_helper'

describe Answer do
  it { is_expected.to belong_to(:question) }

  it do
    is_expected
      .to validate_numericality_of(:value)
      .only_integer
      .is_greater_than_or_equal_to(0)
      .is_less_than_or_equal_to(10)
  end
end
