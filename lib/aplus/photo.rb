module AplusApi
  class Photo

    class << self

      def new
        AplusApi::Connection.new.put("students")
      end

      def find(id)
        OpenStruct.new(AplusApi::Connection.new.get("student/" + id.to_s))
      end

    end

    def delete
      AplusApi::Connection.new.delete("students")
    end

  end
end
