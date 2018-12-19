Module AplusApi
  class Connection
    include HTTParty
    base_uri 'attendcoreapi.aplusattendance.com'

    class << self

      def authenticate

      end

      def get(path)
        response = get(path)
        puts response.body, response.code, response.message, response.headers.inspect
      end

    end

  end
end
