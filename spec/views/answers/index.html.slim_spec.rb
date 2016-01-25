require 'rails_helper'

describe 'answers/index' do
  fixtures :all

  before do
    assign :questions, Question.includes(:answers)
    render
  end

  it 'displays as many tables as there are questions' do
    expect(rendered).to have_selector('table', count: Question.count)
  end

  describe 'listing order' do
    let(:tested_answers) { questions(:one).answers.order(created_at: :desc) }
    let(:first_answer_created_at) { tested_answers.first.created_at }
    let(:second_answer_created_at) { tested_answers.second.created_at }

    it 'displays the answers in the descending order of creation' do
      expect(rendered)
        .to have_selector('tbody tr:nth-child(1)',
                          text: first_answer_created_at)
      expect(rendered)
        .to have_selector('tbody tr:nth-child(2)',
                          text: second_answer_created_at)
    end
  end
end
