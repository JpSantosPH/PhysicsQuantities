using LinearAlgebra
using Unitful

abstract type Coordinate <:AbstractVector{Number} end
    function Coordinate(x, y, z)
        return CartesianCoordinate(x, y, z)
    end
    function Coordinate(args)
        return Coordinate(args...)
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
        function CartesianCoordinate(x::Number=0.0, y::Number=0.0, z::Number=0.0)
            x₂ = convert(Float64, x)
            y₂ = convert(Float64, y)
            z₂ = convert(Float64, z)
            return CartesianCoordinate(x₂, y₂, z₂)
        end
        function CartesianCoordinate(args)
            return CartesianCoordinate(args...)
        end
        function Base.:+(CC₁::CartesianCoordinate, CC₂::CartesianCoordinate)
            return CartesianCoordinate(CC₁.x + CC₂.x, CC₁.y + CC₂.y, CC₁.z + CC₂.z)
        end
        function LinearAlgebra.normalize(CC::CartesianCoordinate)
            V = normalize([CC...])
            return CartesianCoordinate(V)
        end
        function Base.:*(n::Number, CC::CartesianCoordinate)
            return (n*CC.x, n*CC.y, n*CC.z)
        end