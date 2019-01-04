module AplusApi
  class Scan
    include ActiveModel::Model
    attr_accessor :tag, :whenUtc, :location, :entry, :type, :studentID, :whenCreatedUtc

    class << self
      def all(starting_at = 1.week.ago)
        scans = []
        AplusApi::Connection.new.get("scans", { "fromDateUtc" => starting_at.to_date.to_s }).each do |record|
          scans << AplusApi::Scan.new(record)
        end
        scans
      end

      def create(data)
        AplusApi::Connection.new.post("scan", data)
      end

    end
  end
end
