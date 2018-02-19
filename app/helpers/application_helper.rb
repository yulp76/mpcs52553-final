module ApplicationHelper
  require 'open-uri'
  require 'json'
  require 'cgi'

  def geo_code(address)
  	a = CGI::escape(address.chomp)
  	json =open("https://maps.googleapis.com/maps/api/geocode/json?address="+a+"&key=AIzaSyBv57_jxriPpggunxBJq8OcDXjVWO-MwEc").read()
  	return coord = JSON.parse(json)["results"][0]["geometry"]["location"]
  end

end
