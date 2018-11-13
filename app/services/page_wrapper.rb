require 'rubygems'
require 'nokogiri'
require 'open-uri'

class PageWrapper
  attr_reader :url, :h1, :h2, :h3, :links

  def initialize(url)
    @url = url
    spread_content_into_json
  end

  def to_json
    {
      h1: h1,
      h2: h2,
      h3: h3,
      links: links
    }
  end

  def spread_content_into_json
    @page = open_url
    @h1 = @page.css(:h1).text
    @h2 = @page.css(:h2).text
    @h3 = @page.css(:h3).text
    @links = extract_links
  end

  private

  def open_url
    Nokogiri::HTML(open(url))
  end

  def extract_links
    @page.css('a').select { |link| link['href'] && link['href'].match('http') }
  end
end
