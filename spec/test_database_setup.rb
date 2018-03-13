require 'pg'
p 'Setting up test database with links'

con = PG.connect :dbname => 'bookmark_manager_test'
con.exec('TRUNCATE TABLE "links";')
con.exec("INSERT INTO links(url) VALUES('http://www.makersacademy.com')")
con.exec("INSERT INTO links(url) VALUES('http://www.google.com')")
con.exec("INSERT INTO links(url) VALUES('http://www.facebook.com')")
