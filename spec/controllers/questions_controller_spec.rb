require 'rails_helper'
require 'shared_questions_index'

describe QuestionsController do
  it_behaves_like 'a questions index'

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
      describe 'response' do
        before { post :create, question_params }

        it { is_expected.to respond_with :created }
      end

      it 'creates a new question' do
        expect { post :create, question_params }
          .to change { Question.count }.by 1
      end
    end
  end
end
