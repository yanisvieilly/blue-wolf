require 'rails_helper'

describe Question do
  it { is_expected.to have_many(:answers).order(created_at: :desc) }
end
