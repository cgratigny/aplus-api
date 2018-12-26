module AplusApi
  class Student
    include ActiveModel::Model
    attr_accessor :id, :firstName, :lastName, :udf1, :udf2, :udf3, :udf4, :udf5, :udf6, :tags, :photoLastUpdateUtc, :photoMD5

    class << self

      def all
        students = []
        AplusApi::Connection.new.get("students").each do |record|
          students << AplusApi::Student.new(record)
        end
        students
      end

      def create(data)
        AplusApi::Connection.new.post("student", data)
        AplusApi::Student.find(data[:id])
      end

      def update(data)
        AplusApi::Student.create(data)
      end

      def find(id)
        AplusApi::Student.new(AplusApi::Connection.new.get("student/" + id.to_s))
      end

    end

    def add_photo(photo_url)
      AplusApi::Photo.create(self, photo_url)
    end

    def add_tag(tag)
      AplusApi::Tag.create(self, tag)
    end

    def tags
      AplusApi::Tag.by_student(self)
    end

    def photo
      AplusApi::Photo.find_by_student(self)
    end

    def save
      AplusApi::Connection.new.post("student", self)
    end

  end
end
