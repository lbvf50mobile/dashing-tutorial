module DashApp
    class WorkSheetDump
        def initialize
            @allowed_ceils = allowed_ceils.reduce([]){|s,i| s << i[:row_col]}
            @values = allowed_ceils.reduce({}){|s,i| s[i[:row_col]] = i[:value]; s}
        end
        def allowed_ceils
            [
                {row_col: [3,3], value: ?V},
                {row_col: [4,3], value: 7},
                {row_col: [5,3], value: 4},
                {row_col: [6,3], value: 5},
                
            ]
        end
        def [](row,column)
            raise "[#{row},#{column}] Ceil is out of range." unless @allowed_ceils.include?([row,column])
            @values[[row,column]]
        end
    end
end