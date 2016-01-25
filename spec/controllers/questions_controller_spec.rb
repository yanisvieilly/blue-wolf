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

  describe 'POST #create' do
    let(:question_params) { { question: { title: 'a question title' } } }
    let(:invalid_question_params) { { question: { title: '' } } }

    it do
      is_expected
        .to permit(:title)
        .for(:create, params: question_params)
        .on(:question)
    end

    context 'when parameters are invalid' do
      before { post :create, invalid_question_params }

      it { is_expected.to respond_with :unprocessable_entity }
    end

    context 'when parameters are valid' do
      before { post :create, question_params }

      it { is_expected.to respond_with :created }
    end
  end
end
