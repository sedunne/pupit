require 'puppetdb'

module Pupit
  ## Essentially a wrapper for the VoxPupuli PuppetDB gem.
  class PuppetDB < PuppetDB::Client
    def self.build
      @server = Pupit.configuration.puppetdb_server
      @pem = Pupit.configuration.ssl_certs

      ::PuppetDB::Client.new(server: @server, pem: @pem)
    end
  end
end
