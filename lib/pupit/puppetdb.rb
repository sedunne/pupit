require 'puppetdb'

module Pupit
  ## wrapper for the VoxPupuli PuppetDB gem.
  class PuppetDB < PuppetDB::Client
    def self.build
      ::PuppetDB::Client.new(server: Pupit.puppetdb_url, pem: Pupit.puppet_certs)
    end
  end
end
