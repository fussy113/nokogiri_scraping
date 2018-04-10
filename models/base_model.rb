require 'active_record'
class BaseModel < ActiveRecord::Base
  establish_connection(
      adapter: 'mysql2',
      host: ENV['HOST_NAME'],
      username: ENV['DATABASE_USERNAME'],
      password: ENV['DATABASE_PASSWORD'],
      database: ENV['DATABASE_NAME'],
      socket: ENV['MYSQL_SOCKET']
  )
end
