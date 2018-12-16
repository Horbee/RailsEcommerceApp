module ApplicationCable
  # run code before the connection btw. user and server is established
  # useful for authentication
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    def disconnect
    end

    protected
      def find_verified_user
        if verified_user = request.env['warden'].user # an environment variable containing information about the current user
          return verified_user
        else
          reject_unauthorized_connection
        end
      end

  end
end
