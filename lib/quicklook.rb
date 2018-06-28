module DashApp
    class QuickLook
        def initialize(worksheet)
            @worksheet = worksheet
        end
        def to_hash(top_left_ceil)
            Hash.new
        end
    end
end