require 'DB_connection'

describe DatabaseConnection do

  describe '.setup' do
    it 'should set up a connection to a given database' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
      DatabaseConnection.setup('bookmark_manager_test')
    end
  end

  describe '.query' do
    it 'should execute a SQL query string' do
      con = DatabaseConnection.setup('bookmark_manager_test')
      expect(con).to receive(:exec).with('SELECT * FROM links')
      DatabaseConnection.query('SELECT * FROM links')
    end
  end

end
