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
    it "Should have a responce" do
        assert @w.response
    end
end