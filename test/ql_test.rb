require "./test/ql_dump.rb"
require "./test/ql_dump_test.rb"

describe DashApp::QL::Visitors do
    it "Must understand Anderstand A-Z columns" do
        v = DashApp::QL::Visitors.new(DashApp::QL::VisitorsDump.new)
        assert_equal({title0: ?V, value0: 7, persent0: 4, day0: 5}, v.to_hash([3,"C"]))
    end
end
describe DashApp::QL::Product do
    it "Must understand Anderstand A-Z columns" do
        p = DashApp::QL::Product.new(DashApp::QL::ProductDump.new)
        assert_equal({title1: ?P, value1: 5, persent1: 8, day1: 5}, p.to_hash([3,"E"]))
    end
end
describe DashApp::QL::Revenue do
    it "Must understand Anderstand A-Z columns" do
        r = DashApp::QL::Revenue.new(DashApp::QL::RevenueDump.new)
        assert_equal({title2: ?R, value2: 4, persent2: 1, day2: 4}, r.to_hash([3,"G"]))
    end
end