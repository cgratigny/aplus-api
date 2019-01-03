module AplusApi
  class Scan
    include ActiveModel::Model
    attr_accessor :tag, :whenUtc, :location, :entry, :type

    class << self
      def all(starting_at = 1.week.ago)
        AplusApi::Connection.new.get("scans", { "fromDateUtc" => starting_at.to_date.to_s })
      end

      def create(data)
        AplusApi::Connection.new.post("scan", data)
      end


    end
  end
end
