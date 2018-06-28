module DashApp
    class WorkSheetDump
        def initialize
        end
        def [](row,column)
            if 3 == row && 3 == column
                ?V
            end
        end
    end
end