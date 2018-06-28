
module DashApp
    module QL
        class Visitors < ::DashApp::QuickLook
            def map
                [
                    {name: :title0, offset: [0,0]},
                    {name: :value0, offset: [1,0]},
                    {name: :persent0, offset: [2,0]},
                    {name: :day0, offset: [3,0]}
                ]
            end
        end
        class Product < ::DashApp::QuickLook
            def map
                [
                    {name: :title1, offset: [0,0]},
                    {name: :value1, offset: [1,0]},
                    {name: :persent1, offset: [2,0]},
                    {name: :day1, offset: [3,0]}
                ]
            end
        end
        class Revenue < ::DashApp::QuickLook
            def map
                [
                    {name: :title2, offset: [0,0]},
                    {name: :value2, offset: [1,0]},
                    {name: :persent2, offset: [2,0]},
                    {name: :day2, offset: [3,0]}
                ]
            end
        end
    end
end