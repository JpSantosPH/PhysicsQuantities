using LinearAlgebra
using Unitful

abstract type PhysicsScalar <: AbstractVector{Number} end
    Base.size(PS::PhysicsScalar) = (1,)
    function Base.getindex(PS::PhysicsScalar, i::Int)
        if i == 1
            return PS.magnitude
        end
    end

    function Unitful.dimension(PS::PhysicsScalar)
        return dimension(PS.magnitude)
    end

    function PhysicsScalar(magnitude::Quantity)
        return dimension(magnitude)(magnitude)
    end
    function PhysicsScalar( (magnitude) )
        return PhysicsScalar(magnitude)
    end

### SI base units ###
    struct Time <: PhysicsScalar
        magnitude::typeof(1.0u"s")

        function Time(magnitude::Number=0.0u"s")
            if !(magnitude isa Quantity)
                magnitude = magnitude * u"s"
            end
            new(magnitude)
        end
    end

    struct Length <: PhysicsScalar
        magnitude::typeof(1.0u"m")

        function Length(magnitude::Number=0.0u"m")
            if !(magnitude isa Quantity)
                magnitude = magnitude * u"m"
            end
            new(magnitude)
        end
    end

    struct Mass <: PhysicsScalar
        magnitude::typeof(1.0u"kg")

        function Mass(magnitude::Number=0.0u"kg")
            if !(magnitude isa Quantity)
                magnitude = magnitude * u"kg"
            end
            new(magnitude)
        end
    end

    struct Current <: PhysicsScalar
        magnitude::typeof(1.0u"A")

        function Current(magnitude::Number=0.0u"A")
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

### Named units derived from SI base units ###
    struct Frequency <: PhysicsScalar
        magnitude::typeof(1.0u"Hz")

        function Frequency(magnitude::Number=0.0u"Hz")
            if !(magnitude isa Quantity)
                magnitude = magnitude * u"Hz"
            end
            new(magnitude)
        end
    end

    
    
    

    struct Energy <: PhysicsScalar
        magnitude::typeof(1.0u"J")

        function Energy(magnitude::Number=0.0u"J")
            if !(magnitude isa Quantity)
                magnitude = magnitude * u"J"
            end
            new(magnitude)
        end
    end

    struct Pressure <: PhysicsScalar
        magnitude::typeof(1.0u"kPa")
    
        function Pressure(magnitude::Number=100.0u"kPa")
            
        end
    end

### Kinematic SI derived units ###
    struct Speed <: PhysicsScalar
        magnitude::typeof(1.0u"m/s")

        function Speed(magnitude::Number=0.0u"m/s")
            if !(magnitude isa Quantity)
                magnitude = magnitude * u"m/s"
            end
            new(magnitude)
        end
    end