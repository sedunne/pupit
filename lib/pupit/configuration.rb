module Pupit
  ## Singleton-style configuration for the gem
  class Configuration
    attr_accessor :puppetdb_server, :ssl_certs

    def initialize
      @puppetdb_server = nil
      @ssl_certs = {}
    end
  end
end
