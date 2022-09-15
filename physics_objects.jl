using LinearAlgebra

abstract type Coordinate end
    Coordinate( (x, y, z) ) = Coordinate(x, y, z)

    struct CartesianCoordinate{T<:Float64} <: Coordinate
        x::T
        y::T
        z::T
    end
        function CartesianCoordinate(x::Real, y::Real, z::Real)
            CartesianCoordinate(convert(Float64, x), convert(Float64, y), convert(Float64, z))
        end # asserts that CartesianCoordinate must be Float64

        Coordinate(x, y, z) = CartesianCoordinate(x, y, z)

        CartesianCoordinate( (x, y, z) ) = CartesianCoordinate(x, y, z)
 
        function LinearAlgebra.normalize(CC::CartesianCoordinate)
            V = normalize([CC.x, CC.y, CC.z])
            return CartesianCoordinate(V)
        end

        function is_normalized(CC::CartesianCoordinate)
            sqrt(CC.x^2 + CC.y^2 +CC.z^2) ≈ 1.0
        end

struct Direction
    C::Coordinate

    Direction(C::Coordinate) = begin
        N = normalize(C)
        new(N)
    end
end
    Direction(x::Real, y::Real, z::Real) = Direction(Coordinate(x, y, z))
    Direction( (x, y, z) ) = Direction(x, y, z)

struct PhysicsVector
    magnitude::Real
    direction::Direction
end