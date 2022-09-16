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

abstract type PhysicsVector end
    function Base.:*(m::PhysicsScalar, V::PhysicsVector)
        m         
    end
        abstract type BasisVector <: PhysicsVector
            e₁::PhysicsVector
            e₂
            e₃     
        end
            struct î <: BasisVector end
                
2 * zz
zz = [1, 2, 3]
typeof(zz)
zz = CartesianCoordinate(1, 2, 3)
abstract type PhysicsScalar end