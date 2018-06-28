require "./test/ql_dump.rb"

describe DashApp::QL::VisitorsDump do
    before do
        @w = DashApp::QL::VisitorsDump.new
    end
    it "instance must answer on w[3,3] == V" do
        row = 3
        column = 3
        assert ?V == @w[row,column]
    end
end
describe DashApp::QL::ProductDump do
    before do
        @w = DashApp::QL::ProductDump.new
    end
    it "instance must answer on w[3,5] == V" do
        row = 3
        column = 5
        assert ?P == @w[row,column]
    end
end
describe DashApp::QL::RevenueDump do
    before do
        @w = DashApp::QL::RevenueDump.new
    end
    it "instance must answer on w[3,7] == V" do
        row = 3
        column = 7
        assert ?R == @w[row,column]
    end
end
