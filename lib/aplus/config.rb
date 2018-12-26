module AplusApi
  class Config

    CONFIG_KEYS = [:api_key]

    class << self
      attr_accessor *CONFIG_KEYS

      def configure(config)
        @aplus_api_key = config[:api_key]
      end

      def enabled?
        false unless @aplus_api_key
      end

      def api_key
        @aplus_api_key
      end
    end

  end
end
