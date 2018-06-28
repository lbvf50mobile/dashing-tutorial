require "./test/test_helper.rb"
require "./test/work_sheet_dump.rb"
require "pp"


describe DashApp::Quicklook do
   it "must have working dump to test how do it works" do
        DashApp::WorkSheetDump.new
   end
end