using LinearAlgebra
using Unitful
using Test
using BenchmarkTools

struct BasisVectors <: AbstractVector{Vector}
    e₁::CartesianCoordinate
    e₂::CartesianCoordinate
    e₃::CartesianCoordinate
end
    function Base.size(BV::BasisVectors)
        return (3,)
    end
    function Base.getindex(BV::BasisVectors, i::Int)
        if i == 1
            return BV.e₁
        elseif i == 2
            return BV.e₂
        elseif i == 3
            return BV.e₃
        end
    end
    function BasisVectors()
        î = CartesianCoordinate(1, 0, 0)
        ĵ = CartesianCoordinate(0, 1, 0)
        k̂ = CartesianCoordinate(0, 0, 1)
        return BasisVectors(î, ĵ, k̂)
    end

abstract type PhysicsVector <: AbstractVector{Real} end

    struct Velocity <: PhysicsVector
        a₁::typeof(1.0u"m/s")
        a₂::typeof(1.0u"m/s")
        a₃::typeof(1.0u"m/s")
        BV::BasisVectors
    end
        function Base.size(Velo::Velocity)
            return (3,)
        end
        function Base.getindex(Velo::Velocity, i::Int)
            V = Velo.a₁*Velo.BV.e₁ + Velo.a₂*Velo.BV.e₂ + Velo.a₃*Velo.BV.e₃
            return V[i]
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

@testset "Velocity Functionalities" begin
    @test isa(Velocity(1÷1 * u"m/s", 2//1 * u"m/s", 3/1 * u"m/s", BasisVectors()), Velocity)
end