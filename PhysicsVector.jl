using LinearAlgebra
using Test

struct BasisVectors <: AbstractVector{Vector}
    e₁::CartesianCoordinate
    e₂::CartesianCoordinate
    e₃::CartesianCoordinate
end
    function Base.size(BV::BasisVectors)
        if length(BV.e₁) == length(BV.e₂) == length(BV.e₃)
            return size(BV.e₁)
        end
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

@testset "PhysicsVector Functionalities" begin
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