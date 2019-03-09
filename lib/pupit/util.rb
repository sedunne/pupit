module Pupit
  ## Utilities/helpers for various things
  class Util
    ## PuppetDB seems to use a timestamp that isn't quite standard, so this
    ##  takes an offset, and creates the time used in reports
    def self.make_timestamp(offset = 0)
      current_time = Time.new.utc
      adjusted_time = current_time - offset
      adjusted_time.strftime('%FT%TZ')
    end
  end
end
