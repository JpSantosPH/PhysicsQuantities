using LinearAlgebra
using Unitful

abstract type PhysicsScalar <: AbstractVector{Number} end
    Base.size(PS::PhysicsScalar) = (1,)
    function Base.getindex(PS::PhysicsScalar, i::Int)
        if i == 1
            return PS.m
        end
    end

    function Unitful.dimension(PS::PhysicsScalar)
        return dimension(PS.m)
    end

    function PhysicsScalar(m::Quantity)
        return dimension(m)(m)
    end
    function PhysicsScalar( (m) )
        return PhysicsScalar(m)
    end

### SI base units ###
    struct Time <: PhysicsScalar
        m::typeof(1.0u"s")

        function Time(m::Number=0.0u"s")
            if !(m isa Quantity)
                m = m * u"s"
            end
            new(m)
        end
    end

    struct Length <: PhysicsScalar
        m::typeof(1.0u"m")

        function Length(m::Number=0.0u"m")
            if !(m isa Quantity)
                m = m * u"m"
            end
            new(m)
        end
    end

    struct Mass <: PhysicsScalar
        m::typeof(1.0u"kg")

        function Mass(m::Number=0.0u"kg")
            if !(m isa Quantity)
                m = m * u"kg"
            end
            new(m)
        end
    end

    struct Current <: PhysicsScalar
        m::typeof(1.0u"A")

        function Current(m::Number=0.0u"A")
            if !(m isa Quantity)
                m = m * u"A"
            end
            new(m)
        end
    end

    struct Temperature <: PhysicsScalar
        m::typeof(1.0u"K")

        function Temperature(m::Number=273.15u"K")
            if ustrip(m) ≤ 0
                error("Physics Error")
            end
            if !(m isa Quantity)
                m = m * u"K"
            end
            new(m)
        end
    end

### Named units derived from SI base units ###
    struct Frequency <: PhysicsScalar
        m::typeof(1.0u"Hz")

        function Frequency(m::Number=0.0u"Hz")
            if !(m isa Quantity)
                m = m * u"Hz"
            end
            new(m)
        end
    end

    struct Angle <: PhysicsScalar
        m::typeof(1.0u"rad")

        function Angle(m::Number=0.0u"rad")
            if !(m isa Quantity)
                m = m * u"rad"
            end
            new(m)
        end
    end

    struct Pressure <: PhysicsScalar
        m::typeof(1.0u"kPa")
    
        function Pressure(m::Number=100.0u"kPa")
            if !(m isa Quantity)
                m = m * u"kPa"
            end
            new(m)
        end
    end

    struct Energy <: PhysicsScalar
        m::typeof(1.0u"J")

        function Energy(m::Number=0.0u"J")
            if !(m isa Quantity)
                m = m * u"J"
            end
            new(m)
        end
    end

    struct Power <: PhysicsScalar
        m::typeof(1.0u"W")

        function Power(m::Number=0.0u"W")
            if !(m isa Quantity)
                m = m * u"W"
            end
            new(m)
        end
    end

    struct Charge <: PhysicsScalar
        m::typeof(1.0u"C")

        function Charge(m::Number=0.0u"C")
            if !(m isa Quantity)
                m = m * u"C"
            end
            new(m)
        end
    end

    struct Voltage <: PhysicsScalar
        m::typeof(1.0u"V")

        function Voltage(m::Number=0.0u"V")
            if !(m isa Quantity)
                m = m * u"V"
            end
            new(m)
        end
    end

    struct Capacitance <: PhysicsScalar
        m::typeof(1.0u"F")

        function Capacitance(m::Number=0.0u"F")
            if !(m isa Quantity)
                m = m * u"F"
            end
            new(m)
        end
    end

    struct Resistance <: PhysicsScalar
        m::typeof(1.0u"Ω")

        function Resistance(m::Number=0.0u"Ω")
            if !(m isa Quantity)
                m = m * u"Ω"
            end
            new(m)
        end
    end
 
    struct Conductance <: PhysicsScalar
        m::typeof(1.0u"S")

        function Conductance(m::Number=0.0u"S")
            if !(m isa Quantity)
                m = m * u"S"
            end
            new(m)
        end
    end

    struct MagneticFlux <: PhysicsScalar
        m::typeof(1.0u"Wb")

        function MagneticFlux(m::Number=0.0u"Wb")
            if !(m isa Quantity)
                m = m * u"Wb"
            end
            new(m)
        end
    end

    struct Inductance <: PhysicsScalar
        m::typeof(1.0u"H")

        function Inductance(m::Number=0.0u"H")
            if !(m isa Quantity)
                m = m * u"H"
            end
            new(m)
        end
    end

### Kinematic SI derived units ###
    struct Speed <: PhysicsScalar
        m::typeof(1.0u"m/s")

        function Speed(m::Number=0.0u"m/s")
            if !(m isa Quantity)
                m = m * u"m/s"
            end
            new(m)
        end
    end