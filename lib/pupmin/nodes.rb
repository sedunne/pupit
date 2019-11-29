module Pupmin
  ## Node/Agent grouping and other informational helpers
  class Nodes
    ## Simple list all nodes by fqdn values
    def self.all
      puppetdb = Pupmin::PuppetDB.build
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

    def self.deactivate(certname)
      pdb = Pupmin::PuppetDB.build
      rsp = pdb.command('deactivate node', {'certname' => certname, 'producer_timestamp' => Pupmin::Util.make_timestamp}, 3)
      rsp.data
    end
  end
end
