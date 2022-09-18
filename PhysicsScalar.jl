using LinearAlgebra
using Unitful

abstract type PhysicsScalar <: AbstractVector{Number} end
    Base.size(PS::PhysicsScalar) = (1,)
    function Base.getindex(PS::PhysicsScalar, i::Int)
        if i == 1
            return PS.magnitude
        end
    end

    function (A::Unitful.FreeUnits)(n::Number)
        return n * A
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

        function Time(magnitude::Number=0.0)
            if !(magnitude isa Quantity)
                magnitude = magnitude * u"s"
            end
            new(magnitude)
        end
    end

    struct Length <: PhysicsScalar
        magnitude::typeof(1.0u"m")

        function Length(magnitude::Number=0.0)
            if !(magnitude isa Quantity)
                magnitude = magnitude * u"m"
            end
            new(magnitude)
        end
    end

    struct Mass <: PhysicsScalar
        magnitude::typeof(1.0u"kg")

        function Mass(magnitude::Number=0.0)
            if !(magnitude isa Quantity)
                magnitude = magnitude * u"kg"
            end
            new(magnitude)
        end
    end

    struct Current <: PhysicsScalar
        magnitude::typeof(1.0u"A")
    
        function Current(magnitude::Number=0.0)
            if !(magnitude isa Quantity)
                magnitude = magnitude * u"A"
            end
            new(magnitude)
        end
    end

    struct Temperature <: PhysicsScalar
        magnitude::typeof(1.0u"K")

        function Temperature(magnitude::Number=273.15u"K")
            if ustrip(magnitude) ≤ 0
                error("Physics Error")
            end
            if !(magnitude isa Quantity)
                magnitude = magnitude * u"K"
            end
            new(magnitude)
        end
    end

    struct Speed <: PhysicsScalar
        magnitude::typeof(1.0u"m/s")

        function Speed(magnitude::Number=0.0)
            if !(magnitude isa Quantity)
                magnitude = magnitude * u"m/s"
            end
            new(magnitude)
        end
    end

    struct Frequency <:PhysicsScalar
        magnitude::typeof(1.0u"Hz")

        function Frequency(magnitude::Number=0.0)
            if !(magnitude isa Quantity)
                magnitude = magnitude * u"Hz"
            end
            new(magnitude)
        end
    end