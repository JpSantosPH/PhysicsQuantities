using Unitful
using Test

function (A::Unitful.FreeUnits)(m::Real)
    return m * A
end
function Unitful.dimension(PS::PhysicsScalar)
    return dimension(PS.magnitude)
end

abstract type PhysicsScalar <: Real end
    function Base.:+(a::T, b::T) where {T<:PhysicsScalar}
        c = a.magnitude + b.magnitude
        return T(c)
    end

    function PhysicsScalar(Q::Quantity)
        if dimension(Q) == dimension(u"m/s")
            return Speed(Q)
        end
    end

    struct Speed <: PhysicsScalar
        magnitude::typeof(1.0u"m/s")

        function Speed(Q::Quantity)
            if sign(ustrip(Q)) == -1
                error("must be positive")
            else
                return new(Q)
            end
        end
        function Speed(m::Real)
            return new(m * u"m/s")
        end
    end

    struct Mass <: PhysicsScalar
        magnitude::typeof(1.0u"kg")

        function Mass(Q::Quantity)
            if sign(ustrip(Q)) == -1
                error("must be positive")
            else
                return new(Q)
            end
        end
        function Mass(m::Real)
            return new(m * u"kg")
        end
    end

@testset "Unitful added Functionalities" begin
    @test 12.3u"m/s" == u"m/s"(12.3)
    @test dimension(Speed(12)) == dimension(12u"m/s")
end

@testset "PhysicsScalar Functionalities" begin

    @test Speed(12.3) + Speed(44.4) == Speed(56.7)
    @test PhysicsScalar(12u"m/s") == Speed(12.0)
end

@testset "Speed Functionalities" begin
    @test dimension(12u"kg") == dimension(u"kg")
    @test Speed(12u"m/s") == Speed(12.0u"m/s")
    @test Speed(12u"mm/s") == Speed(12u"m/ks")
    @test Speed(12.3) == Speed(12.3u"m/s")
end

@testset "Mass Functionalities" begin
    @test dimension(Mass(12u"kg")) == dimension(u"kg")
    @test Mass(12u"kg") == Mass(12.0u"kg")
    @test Mass(12u"g") == Mass(0.012u"kg")
    @test Mass(12) == Mass(12u"kg")
end