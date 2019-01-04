module AplusApi
  class Photo

    class << self

      def create(student, photo_url)
        return false unless AplusApi::Photo.working_url?(photo_url)
        encoded_photo = AplusApi::Photo.encode_photo(photo_url)
        AplusApi::Connection.new.post("student/" + student.id.to_s + "/photo", encoded_photo)
      end

      def update(student, photo_url)
        create(student, photo_url)
      end

      def encode_photo(photo_url)
        photo_string  = open(photo_url) {|f| f.read }
        Base64.strict_encode64(photo_string)
      end

      def find_by_student(student)
        AplusApi::Connection.new.get("student/" + student.id.to_s + "/photo")
      end

      def working_url?(url_str)
        url = URI.parse(url_str)
        require 'open-uri'
        result = open(url).status
        result[0] == "200"
      rescue
        false
      end

    end

    def delete
      AplusApi::Connection.new.delete("student/" + student.id.to_s + "/photo")
    end

  end
end
