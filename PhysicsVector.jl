using LinearAlgebra
using Unitful

struct BasisVectors <: AbstractVector{Vector}
    e₁::CartesianCoordinate
    e₂::CartesianCoordinate
    e₃::CartesianCoordinate
end
    Base.size(Basis::BasisVectors) = (3,)
    function Base.getindex(Basis::BasisVectors, i::Int)
        if i == 1
            return Basis.e₁
        elseif i == 2
            return Basis.e₂
        elseif i == 3
            return Basis.e₃
        end
    end

    function BasisVectors()
        î = CartesianCoordinate(1, 0, 0)
        ĵ = CartesianCoordinate(0, 1, 0)
        k̂ = CartesianCoordinate(0, 0, 1)
        return BasisVectors(î, ĵ, k̂)
    end

abstract type PhysicsVector <: AbstractVector{Number} end
    Base.size(PV::PhysicsVector) = (3,)
    function Base.getindex(PV::PhysicsVector, i::Int)
        x₁, y₁, z₁ = PV.a₁ * PV.Basis.e₁
        x₂, y₂, z₂ = PV.a₂ * PV.Basis.e₂
        x₃, y₃, z₃ = PV.a₃ * PV.Basis.e₃

        x₄ = x₁ + x₂ + x₃
        y₄ = y₁ + y₂ + y₃
        z₄ = z₁ + z₂ + z₃

        if i == 1
            return x₄
        elseif i == 2
            return y₄
        elseif i == 3
            return z₄
        end
    end

    function PhysicsVector(x::T, y::T, z::T) where {T<:Quantity}
        return dimension(x)(x, y, z)
    end
    function PhysicsVector( (x, y, z) )
        return PhysicsVector(x, y, z)
    end
    
    struct Position <: PhysicsVector
        a₁::typeof(1.0u"m")
        a₂::typeof(1.0u"m")
        a₃::typeof(1.0u"m")
        Basis::BasisVectors

        function Position(a₁::Number=0.0, a₂::Number=0.0, a₃::Number=0.0; Basis::BasisVectors=BasisVectors())
            if !(a₁ isa Quantity)
                a₁ = a₁ * u"m"
            end
            if !(a₂ isa Quantity)
                a₂ = a₂ * u"m"
            end
            if !(a₃ isa Quantity)
                a₃ = a₃ * u"m"
            end
            return new(a₁, a₂, a₃, Basis)
        end
    end
        function Position(args)
            return Position(args...)
        end

    struct Velocity <: PhysicsVector
        a₁::typeof(1.0u"m/s")
        a₂::typeof(1.0u"m/s")
        a₃::typeof(1.0u"m/s")
        Basis::BasisVectors

        function Velocity(a₁::Number=0.0, a₂::Number=0.0, a₃::Number=0.0; Basis::BasisVectors=BasisVectors())
            if !isa(a₁, Quantity)
                a₁ = a₁ * u"m/s"
            end
            if !isa(a₂, Quantity)
                a₂ = a₂ * u"m/s"
            end
            if !isa(a₃, Quantity)
                a₃ = a₃ * u"m/s"
            end
            return new(a₁, a₂, a₃, Basis)
        end
    end
        function Velocity(args)
            return Velocity(args...)
        end

    struct Acceleration <: PhysicsVector
        a₁::typeof(1.0u"m/s^2")
        a₂::typeof(1.0u"m/s^2")
        a₃::typeof(1.0u"m/s^2")
        Basis::BasisVectors

        function Acceleration(a₁::Number=0.0, a₂::Number=0.0, a₃::Number=0.0; Basis::BasisVectors=BasisVectors())
            if !isa(a₁, Quantity)
                a₁ = a₁ * u"m/s^2"
            end
            if !isa(a₂, Quantity)
                a₂ = a₂ * u"m/s^2"
            end
            if !isa(a₃, Quantity)
                a₃ = a₃ * u"m/s^2"
            end
            return new(a₁, a₂, a₃, Basis)
        end
    end
        function Acceleration(args)
            return Acceleration(args...)
        end