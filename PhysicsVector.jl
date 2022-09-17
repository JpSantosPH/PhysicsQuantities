using LinearAlgebra
using Unitful
using Test
using BenchmarkTools

struct BasisVectors <: AbstractVector{Vector}
    e₁::CartesianCoordinate
    e₂::CartesianCoordinate
    e₃::CartesianCoordinate
end
    Base.size(Basis::BasisVectors) = (3,)
    function Base.getindex(Basis::BasisVectors, i::Int)
        if i == 1
            return Basis.e₁
        elseif i == 2
            return Basis.e₂
        elseif i == 3
            return Basis.e₃
        end
    end

    function BasisVectors()
        î = CartesianCoordinate(1, 0, 0)
        ĵ = CartesianCoordinate(0, 1, 0)
        k̂ = CartesianCoordinate(0, 0, 1)
        return BasisVectors(î, ĵ, k̂)
    end

abstract type PhysicsVector <: AbstractVector{Real} end
    Base.size(PV::PhysicsVector) = (3,)
    function Base.getindex(PV::PhysicsVector, i::Int)
        V = PV.a₁*PV.Basis.e₁ + PV.a₂*PV.Basis.e₂ + PV.a₃*PV.Basis.e₃
        return V[i]
    end

    struct Position <: PhysicsVector
        a₁::typeof(1.0u"m")
        a₂::typeof(1.0u"m")
        a₃::typeof(1.0u"m")
        Basis::BasisVectors

        function Position(a₁::Quantity=0.0u"m", a₂::Quantity=0.0u"m", a₃::Quantity=0.0u"m", Basis::BasisVectors=BasisVectors())
            return new(a₁, a₂, a₃, Basis)
        end
    end
        function Position(a₁::Real=0.0, a₂::Real=0.0, a₃::Real=0.0, Basis::BasisVectors=BasisVectors())
            return Position(a₁ * u"m", a₂  * u"m", a₃  * u"m", Basis)
        end
        function Position( (a₁, a₂, a₃) )
            return Position(a₁, a₂, a₃, Basis)
        end
        function Position( V)
            return Position( V...)
        end

    struct Velocity <: PhysicsVector
        a₁::typeof(1.0u"m/s")
        a₂::typeof(1.0u"m/s")
        a₃::typeof(1.0u"m/s")
        Basis::BasisVectors

        function Velocity(a₁::Quantity, a₂::Quantity, a₃::Quantity, Basis::BasisVectors=BasisVectors())
            return new(a₁, a₂, a₃, Basis)
        end
    end        
        function Velocity(a₁::Real, a₂::Real, a₃::Real, Basis::BasisVectors=BasisVectors())
            return Velocity(a₁ * u"m/s", a₂  * u"m/s", a₃  * u"m/s", Basis)
        end
        function Velocity( (a₁, a₂, a₃) , Basis::BasisVectors=BasisVectors())
            return Velocity(a₁, a₂, a₃, Basis)
        end


@testset "BasisVectors Functionalities" begin
    @test let
        a = CartesianCoordinate(1, 2, 3)
        b = CartesianCoordinate(4, 5, 6)
        c = CartesianCoordinate(7, 8, 9)
        d = BasisVectors(a, b, c)
        isa(d, BasisVectors)
    end
    @test let
        BV = BasisVectors()
        a = CartesianCoordinate(1, 0, 0)
        b = CartesianCoordinate(0, 1, 0)
        c = CartesianCoordinate(0, 0, 1)
        BV.e₁ == a && BV.e₂ == b && BV.e₃ == c
    end
end

@testset "Position Functionalities" begin
    @test isa(Position(1÷1 * u"mm", 2//1 * u"m", 3/1 * u"km", BasisVectors()), Position)
    @test isa(Position(1÷1 * u"m", 2//1 * u"m", 3/1 * u"m"), Position)
    @test Position(1÷1, 2//1, 3/1) == Position(1÷1 * u"m", 2//1 * u"m", 3/1 * u"m")
    @test Position([1, 2, 3]) == Position( (1, 2, 3) )
    @test let
        a = CartesianCoordinate(1, 2, 3)
        b = CartesianCoordinate(4, 5, 6)
        c = CartesianCoordinate(7, 8, 9)
        d = BasisVectors(a, b, c)
        Position(1÷1, 2//1, 3/1, d) == Position(30, 36, 42)
    end
    @test Position() == Position(0, 0, 0)
    @test Position(1u"m", 2u"m") == Position(1, 2)
    @test Position([1u"m"]) == Position( (1, 0) )
end

@testset "Velocity Functionalities" begin
    @test isa(Velocity(1÷1 * u"mm/s", 2//1 * u"m/ms", 3/1 * u"m/s", BasisVectors()), Velocity)
    @test isa(Velocity(1÷1 * u"m/s", 2//1 * u"m/s", 3/1 * u"m/s"), Velocity)
    @test Velocity(1÷1, 2//1, 3/1) == Velocity(1÷1 * u"m/s", 2//1 * u"m/s", 3/1 * u"m/s")
    @test Velocity([1, 2, 3]) == Velocity( (1, 2, 3) )
    @test let
        a = CartesianCoordinate(1, 2, 3)
        b = CartesianCoordinate(4, 5, 6)
        c = CartesianCoordinate(7, 8, 9)
        d = BasisVectors(a, b, c)
        Velocity(1÷1, 2//1, 3/1, d) == Velocity(30, 36, 42)
    end
end