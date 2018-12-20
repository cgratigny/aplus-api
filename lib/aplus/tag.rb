module AplusApi
  class Tag

    class << self

      def create(student, tag)
        AplusApi::Connection.new.post("student/" + student.id.to_s + "/addTag", tag.to_s)
      end

      def update(student, tag)
        AplusApi::Tag.create(student, tag)
      end

      def by_student(student)
        AplusApi::Connection.new.get("student/" + student.id + "/tags")
      end

      def update_all(student, tags)
        AplusApi::Connection.new.post("student/" + student.id + "/tags", tags)
      end

    end

  end
end
