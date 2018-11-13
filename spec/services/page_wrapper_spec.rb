require 'rails_helper'

RSpec.describe PageWrapper do
  URL = 'http://en.wikipedia.org/'

  it 'has url' do
    page_wrapper = PageWrapper.new(URL)
    expect(page_wrapper.url).to eq URL
  end

  it 'return h1 content' do
    page_wrapper = PageWrapper.new(URL)
    expect(page_wrapper.h1).to eq 'Main Page'
  end

  it 'match h2 content' do
    page_wrapper = PageWrapper.new(URL)
    expect(page_wrapper.h2).to match /From today's featured articleDid you know/
  end

  it 'match h3 content' do
    page_wrapper = PageWrapper.new(URL)
    expect(page_wrapper.h3).to match /Personal toolsNamespaces/
  end

  describe 'links' do
    it 'has the exacly size' do
      page_wrapper = PageWrapper.new(URL)
      expect(page_wrapper.links.size).to eq 125
    end
  end
end
