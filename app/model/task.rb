require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'development.db'
)

class Task < ActiveRecord::Base
end
