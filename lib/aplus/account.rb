module AplusApi
  class Account
    include ActiveModel::Model
    attr_accessor :name, :timeZone, :udf1, :udf2, :udf3, :udf4, :udf5, :udf6

    class << self

      def all
        [ AplusApi::Account.new(AplusApi::Connection.new.get("account")) ]
      end

    end

  end
end
