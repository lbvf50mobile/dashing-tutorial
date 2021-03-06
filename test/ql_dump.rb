module DashApp
    module QL
        class VisitorsDump < WorkSheetDump
        end
        class ProductDump < WorkSheetDump
            def allowed_ceils
                [
                    {row_col: [3,5], value: ?P},
                    {row_col: [4,5], value: 5},
                    {row_col: [5,5], value: 8},
                    {row_col: [6,5], value: 5},
                    
                ]
            end
        end
        class RevenueDump < WorkSheetDump
            def allowed_ceils
                [
                    {row_col: [3,7], value: ?R},
                    {row_col: [4,7], value: 4},
                    {row_col: [5,7], value: 1},
                    {row_col: [6,7], value: 4},
                    
                ]
            end
        end
    end
end