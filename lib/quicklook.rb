module DashApp
    class QuickLook
        def initialize(worksheet)
            @worksheet = worksheet
        end
        # offset from top left value
        def map
            [
                {name: :title, offset: [0,0]},
                {name: :value, offset: [1,0]},
                {name: :persent, offset: [2,0]}
            ]
        end
        def to_hash(top_left_ceil)
            map.reduce({}) do |s,i|
                row =  i[:offset][0]+top_left_ceil[0]
                column = i[:offset][1]+top_left_ceil[1]
                s[i[:name]] = @worksheet[row,column]
                s
            end
        end
    end
end