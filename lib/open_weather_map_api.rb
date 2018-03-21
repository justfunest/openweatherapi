require 'net/http'

class OpenWeatherMapApi
  attr_accessor :appid

  def initialize(appid)
    @appid = appid
    @app_url = 'http://api.openweathermap.org/'
  end

  def forecast(city, country_code_iso_alpha_2 = nil)

    url = @app_url + 'data/2.5/forecast?'

    if city.present?
      url += 'q=' + city.to_s.capitalize
      if country_code_iso_alpha_2.present?
        unless country_code_iso_alpha_2.to_s.length == 2
          raise "Country code must be 2 letters long"
        end
        url += ',' + country_code_iso_alpha_2.to_s.upcase
      end
    end

    url += "&appid=#{@appid}"
    puts url
    uri = URI(url)
    response = JSON.parse Net::HTTP.get(uri)

    unless response['cod'] = 200
      raise response['message']
    end

    response
  end
end
