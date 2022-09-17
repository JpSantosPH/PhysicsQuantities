using LinearAlgebra
using Unitful

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