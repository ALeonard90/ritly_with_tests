require 'rails_helper'

feature "Links", :type => :feature do
  before(:each) do
    visit(root_path)
  end

  scenario 'User visits the site' do
    expect(page).to have_text("Welcome to Ritly")  
  end

  scenario 'a page with no urls should say no urls' do
    page.has_content?('No urls')
  end

  scenario 'filing in form saves link instance' do
    fill_in 'link[url]', with: 'http://twitter.com'
    click_on 'Submit'

    @link = Link.last
    expect(@link.url).to eq 'http://twitter.com'
    expect(@link.short_code).not_to be nil
  end

  scenario 'home page has multiple links' do
    Link.create(url: 'http://google.com')
    Link.create(url: 'http://twitter.com')
    visit(root_path)

    expect(page).to have_content('http://google.com')
    expect(page).to have_content('http://twitter.com')
  end
end
