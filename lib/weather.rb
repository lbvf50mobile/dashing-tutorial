module DashApp
    require "net/http"
    require "uri"
    require "json"
    class Weather
        def initialize location
            @location = location
            @appid = ENV['WEATHER_TOKEN']
            @uri = URI.parse("http://api.openweathermap.org/data/2.5/weather?q=#{@location}&APPID=#{@appid}")
            @http = Net::HTTP.new(@uri.host, @uri.port)
            update
        end
        def update
            @response = @http.request(Net::HTTP::Get.new(@uri.request_uri))
        end
        def response
            @response
        end
        def body
            JSON.parse(@response.body)
        end
        def code
            @response.code.to_i
        end
        def temperature
            body['main']['temp']
        end
    end
end