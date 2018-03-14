require 'link'

describe Link do
  describe '.show_all' do
    it 'returns all links' do
      links = Link.show_all
      expect(links).to include "http://www.makersacademy.com"
      expect(links).to include "http://www.google.com"
      expect(links).to include "http://www.facebook.com"
    end
  end

  describe '.create' do
    it 'creates a link' do
      Link.create('http://www.bbc.co.uk')
      expect(Link.show_all).to include 'http://www.bbc.co.uk'
    end
  end

end
