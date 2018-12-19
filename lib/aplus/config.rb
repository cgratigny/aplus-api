Module AplusApi
  class Config

    CONFIG_KEYS = [:api_key]

    class << self
      attr_accessor *CONFIG_KEYS
    end

  end
end
