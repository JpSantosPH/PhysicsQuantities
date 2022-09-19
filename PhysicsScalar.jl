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

    struct Angle <: PhysicsScalar
        magnitude::typeof(1.0u"rad")

        function Angle(magnitude::Number=0.0u"rad")
            if !(magnitude isa Quantity)
                magnitude = magnitude * u"rad"
            end
            new(magnitude)
        end
    end

    struct Pressure <: PhysicsScalar
        magnitude::typeof(1.0u"kPa")
    
        function Pressure(magnitude::Number=100.0u"kPa")
            if !(magnitude isa Quantity)
                magnitude = magnitude * u"kPa"
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

    struct Power <: PhysicsScalar
        magnitude::typeof(1.0u"W")

        function Power(magnitude::Number=0.0u"W")
            if !(magnitude isa Quantity)
                magnitude = magnitude * u"W"
            end
            new(magnitude)
        end
    end

    struct Charge <: PhysicsScalar
        magnitude::typeof(1.0u"C")

        function Charge(magnitude::Number=0.0u"C")
            if !(magnitude isa Quantity)
                magnitude = magnitude * u"C"
            end
            new(magnitude)
        end
    end

    struct Voltage <: PhysicsScalar
        magnitude::typeof(1.0u"V")

        function Voltage(magnitude::Number=0.0u"V")
            if !(magnitude isa Quantity)
                magnitude = magnitude * u"V"
            end
            new(magnitude)
        end
    end

    struct Capacitance <: PhysicsScalar
        magnitude::typeof(1.0u"F")

        function Capacitance(magnitude::Number=0.0u"F")
            if !(magnitude isa Quantity)
                magnitude = magnitude * u"F"
            end
            new(magnitude)
        end
    end

    struct Resistance <: PhysicsScalar
        magnitude::typeof(1.0u"Ω")

        function Resistance(magnitude::Number=0.0u"Ω")
            if !(magnitude isa Quantity)
                magnitude = magnitude * u"Ω"
            end
            new(magnitude)
        end
    end
 
    struct Conductance <: PhysicsScalar
        magnitude::typeof(1.0u"S")

        function Conductance(magnitude::Number=0.0u"S")
            if !(magnitude isa Quantity)
                magnitude = magnitude * u"S"
            end
            new(magnitude)
        end
    end

    struct MagneticFlux <: PhysicsScalar
        magnitude::typeof(1.0u"Wb")

        function MagneticFlux(magnitude::Number=0.0u"Wb")
            if !(magnitude isa Quantity)
                magnitude = magnitude * u"Wb"
            end
            new(magnitude)
        end
    end

    struct Inductance <: PhysicsScalar
        magnitude::typeof(1.0u"H")

        function Inductance(magnitude::Number=0.0u"H")
            if !(magnitude isa Quantity)
                magnitude = magnitude * u"H"
            end
            new(magnitude)
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