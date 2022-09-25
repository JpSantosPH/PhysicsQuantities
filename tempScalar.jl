elseif d == dimension(u"_")
    return -(m)

dimension(u"_") => -,

struct - <: PhysicsScalar
    m::typeof(1.0u"_")

    function -(m::Number=0.0u"_")
        if !(m isa Quantity)
            m = m * u"_"
        end
        new(m)
    end
end

@testset "- Functionalities" begin
    @test -(12//1000) == -(12.0u"m_")
    @test -() == -(0)
end