require 'rails_helper'

describe Question do
  it do
    is_expected
      .to have_many(:answers)
      .order(created_at: :desc)
      .dependent(:destroy)
  end

  it { is_expected.to validate_presence_of(:title) }
end
