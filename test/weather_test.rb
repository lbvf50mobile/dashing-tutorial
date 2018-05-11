require "./test/test_helper.rb"

describe DashApp::Weather do
    before do
        location = "location"
        @w = DashApp::Weather.new(location)
    end
    it "must return digit" do
        @w.update
        assert @w.temperature.is_a?(Numeric)
    end
end