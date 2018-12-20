module AplusApi
  class Scan
    class << self
      def all
        AplusApi::Connection.new.get("scans")
      end

      def new
        AplusApi::Connection.new.put("students")
      end


    end
  end
end
