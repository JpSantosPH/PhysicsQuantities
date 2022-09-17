using LinearAlgebra
using Unitful

abstract type PhysicsScalar <: AbstractVector{Number} end
    Base.size(PS::PhysicsScalar) = (1,)
    function Base.getindex(PS::PhysicsScalar, i::Int)
        if i == 1
            return PS.magnitude
        end
    end
    function (A::Unitful.FreeUnits)(m::Number)
        return m * A
    end
    function Unitful.dimension(PS::PhysicsScalar)
        return dimension(PS.magnitude)
    end

    function PhysicsScalar(Q::Quantity; dict::Dict=scalar_dict)
        if haskey(dict, dimension(Q))
            return dict[dimension(Q)](Q)
        else
            return Q
        end
    end
    function PhysicsScalar(VQ::Vector{Quantity})
        return PhysicsScalar(VQ...)
    end
    function Base.:*(n::Number, PS::PhysicsScalar)
        return PhysicsScalar(n * PS.magnitude)
    end
    function Base.:*(PS::PhysicsScalar, n::Number)
        return PhysicsScalar(PS.magnitude * n)
    end
    function Base.:*(V::Vector, PS::PhysicsScalar)
        return V .* PS.magnitude
    end
    function Base.:*(PS::PhysicsScalar, V::Vector)
        return PS.magnitude .* V
    end

    struct Time <: PhysicsScalar
        magnitude::typeof(1.0u"s")

        Time(magnitude::Quantity=0.0u"s") = new(magnitude)
    end
        Time(m::Number=0.0) = Time(m*u"s")

    struct Length <: PhysicsScalar
        magnitude::typeof(1.0u"m")

        Length(magnitude::Quantity=0.0u"m") = new(magnitude)
    end
        Length(m::Number=0) = Length(m * u"m")

    struct Mass <: PhysicsScalar
        magnitude::typeof(1.0u"kg")

        Mass(magnitude::Quantity=0.0u"kg") = new(magnitude)
    end
        Mass(m::Number=0.0) = Mass(m * u"kg")

    struct Speed <: PhysicsScalar
        magnitude::typeof(1.0u"m/s")

        Speed(magnitude::Quantity=0.0u"m/s") = new(magnitude)
    end
        Speed(m::Number=0.0) = Speed(m * u"m/s")

    struct Frequency <:PhysicsScalar
        magnitude::typeof(1.0u"s^-1")

        Frequency(magnitude::Quantity=0.0u"s^-1") = new(magnitude)
    end
        Frequency(m::Number=0.0) = Frequency(m * u"s^-1")