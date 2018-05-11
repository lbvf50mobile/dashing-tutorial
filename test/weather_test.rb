require "./test/test_helper.rb"
p ENV['WEATHER_TOKEN']
p ENV['SOMETHING_THAT_DOSE_NOT_EXSITS_HERE_2388_YES']
describe DashApp::Weather do
    before do
        location = "Berlin"
        @w = DashApp::Weather.new(location)
    end
    it "must return digit" do
        @w.update
        assert @w.temperature.is_a?(Numeric)
    end
    it "WEAHTER_TOKEN must be in env" do
        assert ENV['WEATHER_TOKEN']
        assert_nil ENV['SOMETHING_THAT_DOSE_NOT_EXSITS_HERE_2388_YES']
    end
    it "Should have a responce and it must be 200" do
        @w.update
        # https://ruby-doc.org/stdlib-2.1.1/libdoc/net/http/rdoc/Net/HTTP.html
        assert @w.response
        assert_equal "200", @w.response.code
    end
    
end