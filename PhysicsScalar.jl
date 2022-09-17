using Unitful
using Test

abstract type PhysicsScalar <: Real end
    function Base.:+(a::T, b::T) where {T<:PhysicsScalar}
        c = a.magnitude + b.magnitude
        return T(c)
    end
    function Base.:*(PS::PhysicsScalar, m::Real)
        a = PS.magnitude * m
        return PhysicsScalar(a)
    end
    function Base.:*(m::Real, PS::PhysicsScalar)
        a = PS.magnitude * m
        return PhysicsScalar(a)
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
    end
        Time(m::Real) = Time(m*u"s")

    struct Length <: PhysicsScalar
        magnitude::typeof(1.0u"m")
    end
        Length(m::Real) = Length(m * u"m")

    struct Mass <: PhysicsScalar
        magnitude::typeof(1.0u"kg")
    end
        Mass(m::Real) = Mass(m * u"kg")

    struct Speed <: PhysicsScalar
        magnitude::typeof(1.0u"m/s")
    end
        Speed(m::Real) = Speed(m * u"m/s")

    struct Frequency <:PhysicsScalar
        magnitude::typeof(1.0u"s^-1")
    end
        Frequency(m::Real) = Frequency(m * u"s^-1")


@testset "PhysicsScalar Functionalities" begin
    @test Speed(12.3) + Speed(44.4) == Speed(56.7)
    @test isa(PhysicsScalar(12u"m/s"), Speed)
    @test isa(Speed(1) * 23, Speed)
    @test isa(12 * Speed(3), Speed)
    @test isa(Speed(12) * [3, 4, 5], Vector{Speed})
    @test isa([1, 2, 3] * Speed(4.5), Vector{Speed})
end

@testset "Unitful added Functionalities" begin
    @test 12.3u"m/s" == u"m/s"(12.3)
    @test dimension(Speed(12)) == dimension(12u"m/s")
end

@testset "Time Functionalities" begin
    @test isa(Time(12u"s"), Time)
    @test Time(12u"ms") == Time(0.012u"s")
    @test Time(12) == Time(12.0u"s")
end

@testset "Length Functionalities" begin
    @test isa(Length(12u"m"), Length)
    @test Length(12u"mm") == Length(0.012u"m")
    @test Length(12) == Length(12.0u"m")
end

@testset "Mass Functionalities" begin
    @test isa(Mass(12u"kg"), Mass)
    @test  Mass(12000u"g") == Mass(12.0u"kg")
    @test Mass(12) == Mass(12u"kg")
end

@testset "Speed Functionalities" begin
    @test isa(Speed(12.0u"m/s"), Speed)
    @test Speed(12u"mm/s") == Speed(12.0u"m/ks")
    @test Speed(12.3) == Speed(12.3u"m/s")
end

@testset "Frequency Functionalities" begin
    @test isa(Frequency(3u"s^-1"), Frequency)
    @test Frequency(12.0u"s^-1") == Frequency(1.2e-8u"ns^-1")
    @test Frequency(12.3) == Frequency(12.3u"s^-1")
end