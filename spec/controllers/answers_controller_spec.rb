require 'rails_helper'
require 'shared_questions_index'

describe AnswersController do
  it_behaves_like 'a questions index'

  describe 'POST #create' do
    let(:questions) do
      [
        Question.create(title: 'question title'),
        Question.create(title: 'another question title')
      ]
    end

    it { is_expected.to use_before_action(:check_answers) }

    context 'when parameters are invalid' do
      let(:invalid_params) do
        {
          answers: {
            "#{questions.first.id}" => { value: 'not an integer' },
            "#{questions.last.id}" => { value: '-128' }
          }
        }
      end

      before { post :create, invalid_params }

      it { is_expected.to respond_with :unprocessable_entity }
    end

    context 'when parameters are valid' do
      let(:valid_params) do
        {
          answers: {
            "#{questions.first.id}" => { value: '4' },
            "#{questions.last.id}" => { value: '9' }
          }
        }
      end

      describe 'response' do
        before { post :create, valid_params }

        it { is_expected.to respond_with :created }
      end

      it 'creates one or more answers' do
        expect { post :create, valid_params }
          .to change { Answer.count }.by 2
      end
    end
  end

  describe '#check_answers' do
    context 'with no questions were answered' do
      before { post :create, {} }

      it { is_expected.to respond_with :unprocessable_entity }
    end
  end
end
