require 'pg'

class Link

  def self.all
    con = PG.connect :dbname => 'bookmark_manager'
    rs =  con.exec "SELECT * FROM links"
    rs.map { |link| link['url'] }
  end
end
