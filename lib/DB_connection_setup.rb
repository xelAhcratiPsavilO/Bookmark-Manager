require_relative './DB_connection.rb'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('bookmark_manager_test')
else
  DatabaseConnection.setup('bookmark_manager')
end
