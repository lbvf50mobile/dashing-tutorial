require "./test/test_helper.rb"
require "./test/work_sheet_dump.rb"
require "pp"


describe DashApp::WorkSheetDump do
    before do
        @w = DashApp::WorkSheetDump.new
    end
    it "Must have a working constructor" do
        DashApp::WorkSheetDump.new
   end
    it "instance must answer on w[3,3] == V" do
        row = 3
        column = 3
        assert ?V == @w[row,column]
    end
    it "shold throw exception when point to incorrect ceils" do
        # https://stackoverflow.com/a/14428915/8574922
         assert_raises RuntimeError do
            row = 1500
            column = 1500
            @w[row,column]
         end
    end
end

describe DashApp::QuickLook do
    it "should have a constructor than going to asseps worksheet" do
        quicklook = DashApp::QuickLook.new(DashApp::WorkSheetDump.new)
    end
    it "should return hash on #to_hash with top_left_ceil argument" do
        quicklook = DashApp::QuickLook.new(DashApp::WorkSheetDump.new)
        assert_kind_of Hash, quicklook.to_hash([3,3])
    end
    it "should calculta hash correctly" do
        quicklook = DashApp::QuickLook.new(DashApp::WorkSheetDump.new)
        assert_equal({title: ?V, value: 7, persent: 4, day: 5}, quicklook.to_hash([3,3]))
    end
    it "Must understand Anderstand A-Z columns" do
        quicklook = DashApp::QuickLook.new(DashApp::WorkSheetDump.new)
        assert_equal({title: ?V, value: 7, persent: 4, day: 5}, quicklook.to_hash([3,"C"]))
    end

end