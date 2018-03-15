require 'pg'

task :test_database_setup do
  p 'Setting up test database with links'

  con = PG.connect :dbname => 'bookmark_manager_test'
  con.exec('TRUNCATE TABLE "links";')
  con.exec("INSERT INTO links VALUES('http://www.makersacademy.com', 'Makers Academy');")
  con.exec("INSERT INTO links VALUES('http://www.google.com', 'Google');")
  con.exec("INSERT INTO links VALUES('http://www.facebook.com', 'Facebook');")
end

task :setup do
  p "Creating databases..."

  ['bookmark_manager', 'bookmark_manager_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE links(url VARCHAR(60), title VARCHAR(60));")
  end
end

task :empty do
  p "Removing database data..."

  ['bookmark_manager', 'bookmark_manager_test'].each do |database|
  con = PG.connect
  con.exec("DROP DATABASE #{database}")
  end
end
