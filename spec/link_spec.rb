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
    it 'does not create a new link if the URL is not valid' do
      Link.create('not a real link')
      expect(Link.show_all).not_to include 'not a real link'
    end
  end

end
