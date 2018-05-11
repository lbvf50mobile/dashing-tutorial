# 1 Create variable
WEATHER_TOKEN=$(cat 'WEATHER_TOKEN')
export WEATHER_TOKEN
echo "The weather token is: $WEATHER_TOKEN"
ruby -e 'p "Ruby Reads WEATHER_TOKEN too: %s" % ENV["WEATHER_TOKEN"]'
