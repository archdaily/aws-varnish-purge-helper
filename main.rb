$:.unshift File.dirname(__FILE__)

require 'yaml'
require 'net/http'
require 'lib/awssite.rb'
require 'lib/http.rb'

begin
  site_name = ARGV[0]        # site's name - adcom adcl
  path      = ARGV[1] || '/' # uri to purge from cache

  begin
    site      = AWSSite.new(site_name)  
    site.instances.each_with_index do |instance, index|
      uri = URI.parse("http://" + instance[:hostname] + path)
      http = Net::HTTP.new(uri.host, uri.port)
      purge = http.purge(path)
    end
  end
rescue Exception => e
  puts e
end
