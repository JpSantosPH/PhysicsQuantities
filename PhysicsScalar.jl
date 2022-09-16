using Unitful
using Test

function (A::Unitful.FreeUnits)(m::Real)
    return m * A
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

        function Speed(m::Quantity)
            if sign(ustrip(m)) == -1
                error("must be positive")
            else
                return new(m)
            end
        end
        function Speed(m::Real)
            return new(m * u"m/s")
        end
    end

@testset "PhysicsScalar Functionalities" begin
    @test 12.3u"m/s" == u"m/s"(12.3)
    @test Speed(12.3) + Speed(44.4) == Speed(56.7)
    @test PhysicsScalar(12u"m/s") == Speed(12.0)
end

@testset "Speed Functionalities" begin
    @test Speed(12u"m/s") == Speed(12.0u"m/s")
    @test Speed(12u"mm/s") == Speed(12u"m/ks")
    @test Speed(12.3) == Speed(12.3u"m/s")
end