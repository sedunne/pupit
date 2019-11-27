require 'puppetdb'

module Pupmin
  ## wrapper for the VoxPupuli PuppetDB gem.
  class PuppetDB < PuppetDB::Client
    def self.build
      ::PuppetDB::Client.new(server: Pupmin.puppetdb_url, pem: Pupmin.puppet_certs)
    end
  end
end
