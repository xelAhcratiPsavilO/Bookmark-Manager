require 'pg'

class Link

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    rs =  con.exec "SELECT * FROM links"
    rs.map { |link| link['url'] }
  end
end
