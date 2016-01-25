require 'rails_helper'

describe Question do
  it { is_expected.to have_many(:answers).order(created_at: :desc) }

  it { is_expected.to validate_presence_of(:title) }
end
