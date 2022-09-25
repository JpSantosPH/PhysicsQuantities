elseif d == dimension(u"_")
    return -(x, y, z)

dimension(u"_") => -,

@testset "- Functionalities" begin
    @test -(1, 2//1000) == -(1 * u"_", 2//1 * u"m_", 0.0u"_")
    @test -() == -(0, 0, 0)
end

struct - <: PhysicsVector
    x::typeof(1.0u"_")
    y::typeof(1.0u"_")
    z::typeof(1.0u"_")

    function -(x::Number=0.0u"_", y::Number=0.0u"_", z::Number=0.0u"_")
        if !isa(x, Quantity)
            x = x * u"_"
        end
        if !isa(y, Quantity)
            y = y * u"_"
        end
        if !isa(z, Quantity)
            z = z * u"_"
        end
        return new(x, y, z)
    end
end
    -(args) = -(args...)