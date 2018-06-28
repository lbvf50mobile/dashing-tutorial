require "./test/ql_dump.rb"
require "./test/ql_dump_test.rb"

describe DashApp::QL::Visitors do
    it "Must understand Anderstand A-Z columns" do
        quicklook = DashApp::QL::Visitors.new(DashApp::QL::VisitorsDump.new)
        assert_equal({title0: ?V, value0: 7, persent0: 4, day0: 5}, quicklook.to_hash([3,"C"]))
    end
end