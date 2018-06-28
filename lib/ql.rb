module DashApp
    module QL
        class Visitors < QuickLook
            def map
                [
                    {name: :title0, offset: [0,0]},
                    {name: :value0, offset: [1,0]},
                    {name: :persent0, offset: [2,0]},
                    {name: :day0, offset: [3,0]}
                ]
            end
        end
    end
end