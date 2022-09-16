using LinearAlgebra
using Test
abstract type Coordinate <:AbstractVector{Real} end

    struct CartesianCoordinate{T<:Float64} <: Coordinate
        x::T
        y::T
        z::T
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

@testset "Functionality" begin
    @test isa(CartesianCoordinate(1.0, 2.0, 3.0), CartesianCoordinate)
end