module ApplicationCable
  # run code before the connection btw. user and server is established
  # useful for authentication
  class Connection < ActionCable::Connection::Base
  end
end
