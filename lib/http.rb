# gist taken from https://gist.github.com/robertsosinski/1187446

require 'net/http'

module Net
  class HTTP
    class Purge < HTTPRequest
      METHOD = "PURGE"
      REQUEST_HAS_BODY  = false
      RESPONSE_HAS_BODY = true
    end
    
    class Ban < HTTPRequest
      METHOD = "BAN"
      REQUEST_HAS_BODY  = false
      RESPONSE_HAS_BODY = true
    end
    
    def ban(path, initheader = nil)
      request(Ban.new(path, initheader))
    end
    
    def purge(path, initheader = nil)
      request(Purge.new(path, initheader))
    end
  end
  
  def HTTP.purge(path, initheader = nil)
    uri = URI.parse(path)
    
    new(uri.host, uri.port).start do |http|
      http.purge(uri.path)
    end
  end
  
  def HTTP.ban(path, initheader = nil)
    uri = URI.parse(path)
    
    new(uri.host, uri.port).start do |http|
      http.ban(uri.path)
    end
  end
end