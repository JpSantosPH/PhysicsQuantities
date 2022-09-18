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

    function PhysicsVector( (x, y, z) ; dict::Dict=vector_dict)
        if haskey(dict, dimension(x))
            return dict[dimension(x)](x, y, z)
        else
            return (x, y, z)
        end
    end
    function Base.:*(PV₁::PhysicsVector, PV₂::PhysicsVector)
        return PhysicsVector( (PV₁[1]*PV₂[1], PV₁[2]*PV₂[2], PV₁[3]*PV₂[3]) )
    end
    function Base.:*(n::Number, PV::PhysicsVector)
        return PhysicsVector( (n*PV[1], n*PV[2], n*PV[3]) )
    end
    function Base.:*(PV::PhysicsVector, n::Number)
        return PhysicsVector( (PV[1]*n, PV[2]*n, PV[3]*n) )
    end
    
    struct Position <: PhysicsVector
        a₁::typeof(1.0u"m")
        a₂::typeof(1.0u"m")
        a₃::typeof(1.0u"m")
        Basis::BasisVectors

        function Position(a₁::Quantity=0.0u"m", a₂::Quantity=0.0u"m", a₃::Quantity=0.0u"m", Basis::BasisVectors=BasisVectors())
            return new(a₁, a₂, a₃, Basis)
        end
    end
        function Position(a₁::Number=0.0, a₂::Number=0.0, a₃::Number=0.0, Basis::BasisVectors=BasisVectors())
            return Position(a₁ * u"m", a₂  * u"m", a₃  * u"m", Basis)
        end
        function Position(args)
            return Position(args...)
        end

    struct Velocity <: PhysicsVector
        a₁::typeof(1.0u"m/s")
        a₂::typeof(1.0u"m/s")
        a₃::typeof(1.0u"m/s")
        Basis::BasisVectors

        function Velocity(a₁::Quantity=0.0u"m/s", a₂::Quantity=0.0u"m/s", a₃::Quantity=0.0u"m/s", Basis::BasisVectors=BasisVectors())
            return new(a₁, a₂, a₃, Basis)
        end
    end        
        function Velocity(a₁::Number=0.0, a₂::Number=0.0, a₃::Number=0.0, Basis::BasisVectors=BasisVectors())
            return Velocity(a₁ * u"m/s", a₂  * u"m/s", a₃  * u"m/s", Basis)
        end
        function Velocity(args)
            return Velocity(args...)
        end