require_relative './DB_connection_setup.rb'

class Link

  def self.show_all
    rs = DatabaseConnection.query('SELECT * FROM links')
    rs.map { |link| link['url'] }
  end
  def self.create(url)
    DatabaseConnection.query("INSERT INTO links (url) VALUES ('#{url}')")
  end
end
