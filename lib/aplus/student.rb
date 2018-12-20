module AplusApi
  class Student
    include ActiveModel::Model
    attr_accessor :id, :firstName, :lastName, :udf1, :udf2, :udf3, :udf4, :udf5, :udf6, :tags, :photoLastUpdateUtc, :photoMD5

    class << self

      def all
        AplusApi::Connection.new.get("students")
      end

      def create(data)
        AplusApi::Connection.new.post("student", data)
        AplusApi::Student.find(data[:id])
      end

      def find(id)
        AplusApi::Student.new(AplusApi::Connection.new.get("student/" + id.to_s))
      end

    end

    def save
      AplusApi::Connection.new.post("student", self)
    end

  end
end
