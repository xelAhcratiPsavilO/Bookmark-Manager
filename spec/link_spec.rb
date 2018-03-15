require 'link'

describe Link do
  describe '.show_all' do
    it 'returns all links' do
      links = Link.show_all
      title = links.map(&:title)
      expect(title).to include 'Makers Academy'
      expect(title).to include 'Google'
      expect(title).to include 'Facebook'
    end
  end

  describe '.create' do
    it 'creates a link' do
      Link.create(url: 'http://www.bbc.co.uk')
      links = Link.show_all
      urls = links.map(&:url)
      expect(urls).to include 'http://www.bbc.co.uk'
    end
    it 'does not create a new link if the URL is not valid' do
      Link.create(url: 'not a real link')
      links = Link.show_all
      urls = links.map(&:url)
      expect(urls).not_to include 'not a real link'
    end
  end

end
