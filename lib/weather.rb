module DashApp
    class Weather
        def initialize location
            @location = location
        end
        def update
        end
        def response
            true
        end
        def temperature
            rand(35)
        end
    end
end