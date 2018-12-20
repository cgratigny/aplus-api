module AplusApi
  class Tag

    class << self

      def new
        AplusApi::Connection.new.put("students")
      end

    end

    def update
      AplusApi::Connection.new.post("students")
    end

  end
end
