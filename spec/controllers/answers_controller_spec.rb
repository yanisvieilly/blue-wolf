require 'rails_helper'
require 'shared_questions_index'

describe AnswersController do
  it_behaves_like 'a questions index'

  describe 'POST #create' do
    it { is_expected.to use_before_action(:check_answers) }
  end
end
