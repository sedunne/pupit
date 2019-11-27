require_relative 'pupit/version'
require_relative 'pupit/util'
require_relative 'pupit/puppetdb'
require_relative 'pupit/reports'
require_relative 'pupit/nodes'

## main module file and configuration initialization
module Pupit
  class << self
    attr_accessor :puppetdb_url, :puppetca_host, :puppet_certs

    def configure(puppetdb_url: nil, puppetca_host: nil, puppet_certs: {})
      @puppetdb_url = puppetdb_url
      @puppetca_host = puppetca_host
      @puppet_certs = puppet_certs
    end
  end

  class Error < StandardError; end
end
