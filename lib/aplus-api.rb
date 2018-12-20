require 'active_support'
require 'active_support/core_ext'
require 'httparty'
require 'aplus/config'
require 'aplus/connection'
require 'aplus/account'
require 'aplus/photo'
require 'aplus/scan'
require 'aplus/student'
require 'aplus/tag'

module AplusApi
  def self.configure(config={})
   AplusApi::Config.configure(config)
 end
end

# also make this available all lowercase
Aplusapi = AplusApi
