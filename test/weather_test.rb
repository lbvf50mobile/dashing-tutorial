require "./test/test_helper.rb"
require "pp"
p ENV['WEATHER_TOKEN']
p ENV['SOMETHING_THAT_DOSE_NOT_EXSITS_HERE_2388_YES']
describe DashApp::Weather do
    before do
        location = "Berlin"
        @w = DashApp::Weather.new(location)
    end
    it "must return digit" do
        assert @w.temperature.is_a?(Numeric)
    end
    it "WEAHTER_TOKEN must be in env" do
        assert ENV['WEATHER_TOKEN']
        assert_nil ENV['SOMETHING_THAT_DOSE_NOT_EXSITS_HERE_2388_YES']
    end
    it "Should have a responce and it must be 200" do
        # https://ruby-doc.org/stdlib-2.1.1/libdoc/net/http/rdoc/Net/HTTP.html
        assert @w.response
        assert_equal "200", @w.response.code
    end
    it "shold have a body represented as hash and code a as a digit" do
        pp @w.body
        assert_equal 200, @w.code
        assert  @w.body.is_a?(Hash)
    end 
    it "Should use Novosibirst and Salt Lake city" do
        @n = DashApp::Weather.new("Novosibirsk")
        @s = DashApp::Weather.new("Salt Lake City")
        assert_equal "200", @n.response.code
        assert_equal "200", @s.response.code
    end
    
end