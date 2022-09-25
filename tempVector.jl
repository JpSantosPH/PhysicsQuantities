elseif d == dimension(u"kg * m/s")
    return Momentum(x, y, z)

dimension(u"kg * m/s") => Momentum,

@testset "Momentum Functionalities" begin
    @test Momentum(1, 2//1000) == Momentum(1 * u"kg * m/s", 2//1 * u"kg * m/s", 0.0u"kg * m/s")
    @test Momentum() == Momentum(0, 0, 0)
end
Momentum(1, 2//1000)
struct Momentum <: PhysicsVector
    x::typeof(1.0u"kg * m/s")
    y::typeof(1.0u"kg * m/s")
    z::typeof(1.0u"kg * m/s")

    function Momentum(x::Number=0.0u"kg * m/s", y::Number=0.0u"kg * m/s", z::Number=0.0u"kg * m/s")
        if !isa(x, Quantity)
            x = x * u"kg * m/s"
        end
        if !isa(y, Quantity)
            y = y * u"kg * m/s"
        end
        if !isa(z, Quantity)
            z = z * u"kg * m/s"
        end
        return new(x, y, z)
    end
end
    Momentum(args) = Momentum(args...)