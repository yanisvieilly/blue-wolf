require 'rails_helper'

describe QuestionsController do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template 'index'
    end

    describe '@questions' do
      let(:questions) { [Question.create(title: 'question title')] }

      it 'matches the questions from the database' do
        get :index
        expect(assigns(:questions)).to match_array questions
      end
    end
  end
end
