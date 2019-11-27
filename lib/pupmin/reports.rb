module Pupmin
  ## shortcuts for some useful report information
  class Reports
    def self.call_query(query, options = {}, endpoint = 'reports')
      puppetdb = Pupmin::PuppetDB.build
      puppetdb.request(endpoint, query, options)
    end

    ## Get a list of reports by their status; defaults to just latest report
    def self.by_status(status: 'changed', latest: true, options: {})
      query = [
        'AND',
        ['=', 'status', status.to_s],
        ['=', 'latest_report?', latest.to_s]
      ]

      call_query(query, options)
    end

    ## Get a list of "aged" agents, i.e servers that last submitted a
    ##  report > threshold
    def self.get_aged(threshold: 3600, options: {})
      query = [
        '<',
        'catalog_timestamp',
        Pupmin::Util.make_timestamp(threshold.to_i)
      ]

      call_query(query, options, 'nodes')
    end
  end
end
