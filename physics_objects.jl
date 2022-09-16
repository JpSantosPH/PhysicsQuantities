using LinearAlgebra
using Unitful

abstract type Coordinate end

    function Coordinate(x, y, z)
        return CartesianCoordinate(x, y, z)
    end

    function Coordinate( (x, y, z) )
        return Coordinate(x, y, z)
    end


    struct CartesianCoordinate{T<:Float64} <: Coordinate
        x::T
        y::T
        z::T
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

        function LinearAlgebra.normalize(CC::CartesianCoordinate)
            V = normalize([CC.x, CC.y, CC.z])
            return CartesianCoordinate(V)
        end

        function is_normalized(CC::CartesianCoordinate)
            sqrt(CC.x^2 + CC.y^2 +CC.z^2) ≈ 1.0
        end

CartesianCoordinate([1, 1//1 , 1.0])
struct Direction
    C::Coordinate

    function Direction(C::Coordinate)
        N = normalize(C)
        return new(N)
    end
end

    function Direction(x::Real, y::Real, z::Real)
        return Direction(Coordinate(x, y, z))
    end

    function Direction( (x, y, z) )
        return Direction(x, y, z)
    end

Direction(1, 2, 3)

abstract type PhysicsVector end
    struct PhysicsUnitVector <: PhysicsVector end
    struct PhysicsPosition end

abstract type PhysicsScalar end
    struct Mass{T<:Real} <: PhysicsScalar
        magnitude::T

        Mass(magnitude::Real)
    end


    struct Force <: PhysicsVector
        magnitude::Real
        direction::Direction

        
    end