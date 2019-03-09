module Pupit
  ## Node/Agent grouping and other informational helpers
  class Nodes
    ## Simple list all nodes by fqdn values
    def self.all
      puppetdb = Pupit::PuppetDB.build
      nodes = []
      puppetdb.request('facts', ['=', 'name', 'fqdn']).data.each do |x|
          nodes.push(x['value'])
      end
      nodes
    end

    ## Display a random number of hosts
    def self.random(num = 5)
      rand_hosts = []
      all_hosts = all().shuffle!
      # hosts.shuffle!
      num.to_i.times do
        rand_hosts.push(all_hosts.shift)
      end
      rand_hosts
    end
  end
end
