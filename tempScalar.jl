elseif d == dimension(u"kg/m")
    return LinearDensity(m)

dimension(u"kg/m") => LinearDensity,

@testset "LinearDensity Functionalities" begin
    @test LinearDensity(12//1000) == LinearDensity(12.0u"g/m")
    @test LinearDensity() == LinearDensity(0)
end

struct LinearDensity <: PhysicsScalar
    m::typeof(1.0u"kg/m")

    function LinearDensity(m::Number=0.0u"kg/m")
        if !(m isa Quantity)
            m = m * u"kg/m"
        end
        new(m)
    end
end
