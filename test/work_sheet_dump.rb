module DashApp
    class WorkSheetDump
        def initialize
            @allowed_ceils = allowed_ceils.reduce([]){|s,i| s << i[:row_col]}
        end
        def allowed_ceils
            [
                {row_col: [3,3], valule: "Visitors"},
                {row_col: [4,3], valule: 7},
                {row_col: [5,3], valule: "4%"},
                
            ]
        end
        def [](row,column)
            raise "[#{row},#{column}] Ceil is out of range." unless @allowed_ceils.include?([row,column])
            if 3 == row && 3 == column
                ?V
            end
        end
    end
end