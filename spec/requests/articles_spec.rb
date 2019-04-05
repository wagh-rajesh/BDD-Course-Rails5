require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  before do
    @article = Article.create(
      title: 'New article for show spec',
      body: 'New article body for show spec'
    )
  end

  describe 'GET /articles/:id' do
    context 'with existing article' do
      before { get '/articles/' + @article.id.to_s }

      it 'handles existing article' do
        expect(response.status).to eq 200
      end
    end

    context 'with not existing article' do
      before { get '/articles/xxx' }

      it 'handles not existing articles' do
        expect(response.status).to eq 302
        flash_message = 'The article you are looking for could not be found'
        expect(flash[:alert]).to eq flash_message
      end
    end
  end
end
