require_relative './DB_connection_setup.rb'

class Link

  def self.show_all
    rs = DatabaseConnection.query('SELECT * FROM links')
    rs.map { |link| link['url'] }
  end

  def self.create(url)
    return false unless is_url?(url)
    DatabaseConnection.query("INSERT INTO links (url) VALUES('#{url}')")
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
