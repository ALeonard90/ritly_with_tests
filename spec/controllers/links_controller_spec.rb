require 'rails_helper'

RSpec.describe LinksController, :type => :controller do
  context 'when a user goes to a shortcode link' do
    it 'redirects to the link url' do
      @link = Link.create(url: 'http://twitter.com')

      get :redirect, {short_code: @link.short_code}
      expect(response).to redirect_to(@link.url)
    end
  end
end
