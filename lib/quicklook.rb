module DashApp
    class QuickLook
        def initialize(worksheet)
            @worksheet = worksheet
        end
        def to_hash(top_left_ceil)
            {title: ?V, value: 7, persent: 4}
        end
    end
end