require 'rails_helper'

RSpec.describe Link, :type => :model do
  let(:link) { FactoryGirl.build(:link) }

  it 'has an empty short_code' do
    expect(link.short_code).to be_nil
  end

  it 'has a populated url field' do
    expect(link.url).to eq 'http://twitter.com/cdspeis'
  end

  it 'populates the short_code field before saving' do 
    link.save
    expect(link.short_code).not_to be_nil
  end

end
