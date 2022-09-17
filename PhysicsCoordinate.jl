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
        function CartesianCoordinate(x::Real=0.0, y::Real=0.0, z::Real=0.0)
            x₂ = convert(Float64, x)
            y₂ = convert(Float64, y)
            z₂ = convert(Float64, z)
            return CartesianCoordinate(x₂, y₂, z₂)
        end
        function CartesianCoordinate(V)
            return CartesianCoordinate(V...)
        end
        function Base.:+(CC₁::CartesianCoordinate, CC₂::CartesianCoordinate)
            return CartesianCoordinate([CC₁...] + [CC₂...])
        end
        function LinearAlgebra.normalize(CC::CartesianCoordinate)
            V = normalize([CC...])
            return CartesianCoordinate(V)
        end

@testset "Coordinate Functionalities" begin
    @test isa(Coordinate(1÷1, 2//1, 3/1), CartesianCoordinate)
    @test isa(Coordinate([1÷1, 2//1, 3/1]), CartesianCoordinate)
end

@testset "CartesianCoordinate Functionalities" begin
    @test isa(CartesianCoordinate(1.0, 2.0, 3.0), CartesianCoordinate)
    @test isa(CartesianCoordinate(1÷1, 2//1, 3/1), CartesianCoordinate)
    @test isa(CartesianCoordinate([1÷1, 2//1, 3/1]), CartesianCoordinate)
    @test isa(CartesianCoordinate( (1÷1, 2//1, 3/1) ), CartesianCoordinate)
    @test let
        a = CartesianCoordinate( (1÷1, 2//1, 3/1) )
        b = CartesianCoordinate( [4÷1, 4//1, 4/1] )
        c = a + b
        d = CartesianCoordinate( (5÷1, 6//1, 7/1) )
        c == d
    end
    @test let
        a = normalize(CartesianCoordinate( (1÷1, 2//1, 3/1) ))
        norm(a) ≈ 1 && isa(a, CartesianCoordinate)
    end
    @test CartesianCoordinate() == CartesianCoordinate(0.0, 0.0, 0.0)
    @test CartesianCoordinate(1) == CartesianCoordinate(1.0, 0.0, 0.0)
    @test CartesianCoordinate(1, 2) == CartesianCoordinate(1.0, 2.0, 0.0)
end