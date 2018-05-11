require "./test/test_helper.rb"

describe DashApp::Weather do
    before do
        @w = DashApp::Weather.new
    end
    it "must return digit" do
        @w.update
        assert @w.temperature.is_a?(Numeric)
    end
end