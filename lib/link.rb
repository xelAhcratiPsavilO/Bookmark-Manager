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
    res = DatabaseConnection.query("INSERT INTO links (url, title) VALUES('#{input[:url]}', '#{input[:title]}')RETURNING id, url, title")
    Link.new(res[0]['id'], res[0]['url'], res[0]['title'])
  end

  def self.delete(name)
    DatabaseConnection.query("DELETE FROM links WHERE title = '#{name}'")
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
