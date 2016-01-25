require 'rails_helper'

describe QuestionsController do
  describe 'GET #index' do
    before { get :index }

    it { is_expected.to respond_with :success }
    it { is_expected.to render_template 'index' }

    describe '@questions' do
      let(:questions) { [Question.create(title: 'question title')] }

      it 'matches the questions from the database' do
        expect(assigns(:questions)).to match_array questions
      end
    end
  end

  describe 'GET #new' do
    before { get :new }

    it { is_expected.to respond_with :success }
    it { is_expected.to render_template 'new' }

    describe '@question' do
      it 'sets up a new question' do
        expect(assigns(:question)).to be_a_new Question
      end
    end
  end
end
