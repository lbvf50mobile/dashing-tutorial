require "./test/test_helper.rb"
require "./test/work_sheet_dump.rb"
require "pp"


describe DashApp::WorkSheetDump do
    it "Must have a working constructor" do
        DashApp::WorkSheetDump.new
   end
    it "instance must answer on w[3,3] == V" do
        w = DashApp::WorkSheetDump.new
        assert ?V == w[3,3]
    end
end

describe DashApp::Quicklook do

end