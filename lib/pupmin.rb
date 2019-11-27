require_relative 'pupmin/version'
require_relative 'pupmin/util'
require_relative 'pupmin/puppetdb'
require_relative 'pupmin/reports'
require_relative 'pupmin/nodes'

## main module file and configuration initialization
module Pupmin
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
