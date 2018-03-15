require_relative './DB_connection_setup.rb'

class Link
    attr_reader  :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.show_all
    rs = DatabaseConnection.query('SELECT * FROM links')
    rs.map { |link| Link.new( link['id'], link['url'], link['title']) }
  end

  def self.create(input)
    return false unless is_url?(input[:url])
    DatabaseConnection.query("INSERT INTO links (url, title) VALUES('#{input[:url]}', '#{input[:title]}')")
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
