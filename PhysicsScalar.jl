using LinearAlgebra
using Unitful

abstract type PhysicsScalar <: Real end
    function Base.:+(a::T, b::T) where {T<:PhysicsScalar}
        c = a.magnitude + b.magnitude
        return T(c)
    end
    function Base.:*(PS::PhysicsScalar, m::Real)
        a = PS.magnitude * m
        return PhysicsScalar(a)
    end
    function Base.:*(m::Real, PS::PhysicsScalar)
        a = PS.magnitude * m
        return PhysicsScalar(a)
    end

    function (A::Unitful.FreeUnits)(m::Real)
        return m * A
    end
    function Unitful.dimension(PS::PhysicsScalar)
        return dimension(PS.magnitude)
    end

    function PhysicsScalar(Q::Quantity)
        if dimension(Q) == dimension(u"m/s")
            return Speed(Q)
        end
    end

    struct Time <: PhysicsScalar
        magnitude::typeof(1.0u"s")
    end
        Time(m::Real) = Time(m*u"s")

    struct Length <: PhysicsScalar
        magnitude::typeof(1.0u"m")
    end
        Length(m::Real) = Length(m * u"m")

    struct Mass <: PhysicsScalar
        magnitude::typeof(1.0u"kg")
    end
        Mass(m::Real) = Mass(m * u"kg")

    struct Speed <: PhysicsScalar
        magnitude::typeof(1.0u"m/s")
    end
        Speed(m::Real) = Speed(m * u"m/s")

    struct Frequency <:PhysicsScalar
        magnitude::typeof(1.0u"s^-1")
    end
        Frequency(m::Real) = Frequency(m * u"s^-1")