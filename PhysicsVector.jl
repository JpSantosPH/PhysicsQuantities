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

@testset "PhysicsVector Functionalities" begin
    @test let
        a = CartesianCoordinate(1, 2, 3)
        b = CartesianCoordinate(4, 5, 6)
        c = CartesianCoordinate(7, 8, 9)
        d = BasisVectors(a, b, c)
        isa(d, BasisVectors)
    end
end