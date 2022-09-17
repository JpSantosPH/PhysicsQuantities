using Unitful
using Test

abstract type PhysicsScalar <: Real end
    function Base.:+(a::T, b::T) where {T<:PhysicsScalar}
        c = a.magnitude + b.magnitude
        return T(c)
    end
    function (A::Unitful.FreeUnits)(m::Real)
        return m * A
    end
    function Unitful.dimension(PS::PhysicsScalar)
        return dimension(PS.magnitude)
    end

    function PhysicsScalar(Q::Quantity)
        d = dimension(Q)
        if d == dimension(u"kg")
            return Mass(Q)
        elseif d == dimension(u"m/s")
            return Speed(Q)
        end
    end

    struct Speed <: PhysicsScalar
        magnitude::typeof(1.0u"m/s")

        function Speed(m::Real)
            return new(m * u"m/s")
        end
    end

    struct Mass <: PhysicsScalar
        magnitude::typeof(1.0u"kg")

        function Mass(m::Real)
            return new(m * u"kg")
        end
    end

    struct Frequency <:PhysicsScalar
        magnitude::typeof(1.0u"s^-1")

        function Frequency(m::Real)
            return new(m * u"s^-1")
        end
    end

@testset "PhysicsScalar Functionalities" begin
    @test Speed(12.3) + Speed(44.4) == Speed(56.7)
    @test isa(PhysicsScalar(12u"m/s"), Speed)
    @test isa(PhysicsScalar(12u"kg"), Mass)
end

@testset "Unitful added Functionalities" begin
    @test 12.3u"m/s" == u"m/s"(12.3)
    @test dimension(Speed(12)) == dimension(12u"m/s")
end

@testset "Speed Functionalities" begin
    @test isa(Speed(12.0u"m/s"), Speed)
    @test Speed(12u"mm/s") == Speed(12.0u"m/ks")
    @test Speed(12.3) == Speed(12.3u"m/s")
end

@testset "Mass Functionalities" begin
    @test isa(Mass(12u"kg"), Mass)
    @test  Mass(12000u"g") == Mass(12.0u"kg")
    @test Mass(12) == Mass(12u"kg")
end

@testset "Frequency Functionalities" begin
    @test isa(Frequency(3u"s^-1"), Frequency)
    @test Frequency(12.0u"s^-1") == Frequency(1.2e-8u"ns^-1")
    @test Frequency(12.3) == Frequency(12.3u"s^-1")
end