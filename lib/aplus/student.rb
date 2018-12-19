Module AplusApi
  class Student

    class << self

      def all
        AplusApi::Connection.execute("v1/students")
      end

    end

  end
end
