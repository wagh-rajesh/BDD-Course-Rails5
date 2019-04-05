require 'rails_helper'

RSpec.feature 'Show Article' do
  before do
    @article1 = Article.create(
      title: 'New article for show spec',
      body: 'New article body for show spec'
    )
  end

  scenario 'A user goes to a specific article' do
    visit '/'
    expect(page).to have_link(@article1.title)
    click_link(@article1.title)

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(current_path).to eq(article_path(@article1))
  end
end
