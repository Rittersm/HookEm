require "refile"
Refile.configure do |config|
  connection = lambda { |&blk| ActiveRecord::Base.connection_pool.with_connection { |con| blk.call(con.raw_connection) } }
  config.store = Refile::Postgres::Backend.new(connection)
end

if Rails.env.production?
  Refile.cdn_host = 'https://aqueous-meadow-81376.herokuapp.com'
else
  Refile.cdn_host = 'https://21c95b4f.ngrok.io'
end
