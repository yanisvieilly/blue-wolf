require 'rails_helper'

describe QuestionsController do
  describe 'GET #index' do
    before { get :index }

    it { is_expected.to render_template 'index' }

    describe '@questions' do
      let(:questions) { [Question.create(title: 'question title')] }

      it 'matches the questions from the database' do
        expect(assigns(:questions)).to match_array questions
      end
    end
  end
end
