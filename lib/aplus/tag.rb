module AplusApi
  class Tag

    class << self

      def create(student, tag)
        AplusApi::Connection.new.post("student/" + student.id + "/addTag", tag)
      end

    end

    def update
      AplusApi::Connection.new.post("students")
    end

  end
end
