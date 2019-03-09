require_relative 'pupit/version'
require_relative 'pupit/configuration'
require_relative 'pupit/util'
require_relative 'pupit/puppetdb'
require_relative 'pupit/reports'
require_relative 'pupit/nodes'

## main module file and configuration initialization
module Pupit
  class << self
    attr_accessor :configuration
    def configure
      self.configuration ||= Configuration.new
      yield(configuration) if block_given?
    end

    def reset
      self.configuration = Configuration.new
    end
  end

  class Error < StandardError; end
end
