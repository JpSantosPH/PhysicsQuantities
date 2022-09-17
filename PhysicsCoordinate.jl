using LinearAlgebra
using Unitful
using Test
using BenchmarkTools

abstract type Coordinate <:AbstractVector{Real} end
    function Coordinate(x, y, z)
        return CartesianCoordinate(x, y, z)
    end
    function Coordinate( (x, y, z) )
        return Coordinate(x, y, z)
    end
    
    struct CartesianCoordinate <: Coordinate
        x::Float64
        y::Float64
        z::Float64
    end
        function Base.size(CC::CartesianCoordinate)
            return (3,)
        end
        function Base.getindex(CC::CartesianCoordinate, i::Int)
            if i == 1
                return CC.x
            elseif i == 2
                return CC.y
            elseif i == 3
                return CC.z
            end
        end
        function CartesianCoordinate(x::Real, y::Real, z::Real)
            x₂ = convert(Float64, x)
            y₂ = convert(Float64, y)
            z₂ = convert(Float64, z)
            return CartesianCoordinate(x₂, y₂, z₂)
        end
        function CartesianCoordinate( (x, y, z) )
            return CartesianCoordinate(x, y, z)
        end
        function Base.:+(CC₁::CartesianCoordinate, CC₂::CartesianCoordinate)
            return CartesianCoordinate([CC₁...] + [CC₂...])
        end
        function LinearAlgebra.normalize(CC::CartesianCoordinate)
            V = normalize([CC...])
            return CartesianCoordinate(V)
        end

@testset "Functionalities" begin
    @test isa(CartesianCoordinate(1.0, 2.0, 3.0), CartesianCoordinate)
    @test isa(CartesianCoordinate(1÷1, 2//1, 3/1), CartesianCoordinate)
    @test isa(CartesianCoordinate([1÷1, 2//1, 3/1]), CartesianCoordinate)
    @test isa(CartesianCoordinate( (1÷1, 2//1, 3/1) ), CartesianCoordinate)
    @test let
        a = normalize(CartesianCoordinate( (1÷1, 2//1, 3/1) ))
        norm(a) ≈ 1 && isa(a, CartesianCoordinate)
    end
    @test isa(Coordinate(1÷1, 2//1, 3/1), CartesianCoordinate)
    @test isa(Coordinate([1÷1, 2//1, 3/1]), CartesianCoordinate)
end