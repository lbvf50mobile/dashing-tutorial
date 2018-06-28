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