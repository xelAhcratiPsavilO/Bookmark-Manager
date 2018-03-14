require 'pg'

task :test_database_setup do
  p 'Setting up test database with links'

  con = PG.connect :dbname => 'bookmark_manager_test'
  con.exec('TRUNCATE TABLE "links";')
  con.exec("INSERT INTO links(url) VALUES('http://www.makersacademy.com')")
  con.exec("INSERT INTO links(url) VALUES('http://www.google.com')")
  con.exec("INSERT INTO links(url) VALUES('http://www.facebook.com')")
end

task :setup do
  p "Creating databases..."

  ['bookmark_manager', 'bookmark_manager_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60));")
  end
end

task :empty do
  con = PG.connect :dbname => 'bookmark_manager_test'
  con.exec('TRUNCATE TABLE "links";')
end
