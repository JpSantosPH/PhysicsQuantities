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
        if dimension(Q) == dimension(u"m/s")
            return Speed(Q)
        end
    end

    struct Time <: PhysicsScalar
        magnitude::typeof(1.0u"s")

        Time(Q::Quantity) = new(Q)
        Time(m::Real) = new(m * u"s")
    end

    struct Mass <: PhysicsScalar
        magnitude::typeof(1.0u"kg")

        Mass(Q::Quantity) = new(Q)
        Mass(m::Real) = new(m * u"kg")
    end

    struct Speed <: PhysicsScalar
        magnitude::typeof(1.0u"m/s")

        Speed(Q::Quantity) = new(Q)
        Speed(m::Real) = new(m * u"m/s")
    end

    struct Frequency <:PhysicsScalar
        magnitude::typeof(1.0u"s^-1")

        Frequency(Q::Quantity) = new(Q)
        Frequency(m::Real) = new(m * u"s^-1")
    end

    
@testset "Frequency Functionalities" begin
    @test isa(Frequency(3u"s^-1"), Frequency)
    @test Frequency(12.0u"s^-1") == Frequency(1.2e-8u"ns^-1")
    @test Frequency(12.3) == Frequency(12.3u"s^-1")
end

@testset "Unitful added Functionalities" begin
    @test 12.3u"m/s" == u"m/s"(12.3)
    @test dimension(Speed(12)) == dimension(12u"m/s")
end

@testset "PhysicsScalar Functionalities" begin
    @test Speed(12.3) + Speed(44.4) == Speed(56.7)
    @test isa(PhysicsScalar(12u"m/s"), Speed)
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

@testset "Mass Functionalities" begin
    @test isa(Mass(12u"kg"), Mass)
    @test  Mass(12000u"g") == Mass(12.0u"kg")
    @test Mass(12) == Mass(12u"kg")
end

@testset "Time Functionalities" begin
    @test isa(Time(12u"s"), Time)
    @test Time(12u"ms") == Time(0.012u"s")
    @test Time(12) == Time(12.0u"s")
end