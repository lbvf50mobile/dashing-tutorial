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
                
            ]
        end
        def [](row,column)
            char = ?A.ord-1+column
            char = char.chr
            raise "[#{row},#{column}]([#{row},#{char}]) Ceil is out of range." unless @allowed_ceils.include?([row,column])
            @values[[row,column]]
        end
    end
end