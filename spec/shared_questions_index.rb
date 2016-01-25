require 'rails_helper'

shared_examples_for 'a questions index' do
  fixtures :all

  describe 'GET #index' do
    before { get :index }

    it { is_expected.to respond_with :success }
    it { is_expected.to render_template 'index' }

    describe '@questions' do
      it 'matches the questions from the database' do
        expect(assigns(:questions)).to match_array Question.all
      end
    end
  end
end
