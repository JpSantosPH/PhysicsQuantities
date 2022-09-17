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
        V = PV.a₁*PV.Basis.e₁ + PV.a₂*PV.Basis.e₂ + PV.a₃*PV.Basis.e₃
        return V[i]
    end

    function PhysicsVector(VQ::Vector; dict::Dict=vector_dict)
        if haskey(dict, dimension(VQ[1]))
            return dict[dimension(VQ[1])](VQ)
        end
    end
    function Base.:*(PV₁::PhysicsVector, PV₂::PhysicsVector)
        return PhysicsVector(PV₁ .* PV₂)
    end
    function Base.:*(n::Number, PV::PhysicsVector)
        return PhysicsVector(n .* PV)
    end
    function Base.:*(PV::PhysicsVector, n::Number)
        return PhysicsVector(PV .* n)
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
        function Position(V)
            return Position( V...)
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
        function Velocity(V)
            return Velocity(V...)
        end