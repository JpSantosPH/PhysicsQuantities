using LinearAlgebra
using Unitful

abstract type PhysicsScalar <: Number end

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

    struct Substance <: PhysicsScalar
        m::typeof(1.0u"mol")

        function Substance(m::Number=0.0u"mol")
            if !(m isa Quantity)
                m = m * u"mol"
            end
            new(m)
        end
    end

    struct Luminous <: PhysicsScalar
        m::typeof(1.0u"cd")

        function Luminous(m::Number=0.0u"cd")
            if !(m isa Quantity)
                m = m * u"cd"
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
    
    struct Induction <: PhysicsScalar
        m::typeof(1.0u"T")
    
        function Induction(m::Number=0.0u"T")
            if !(m isa Quantity)
                m = m * u"T"
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

    struct LuminousFlux <: PhysicsScalar
        m::typeof(1.0u"lm")
    
        function LuminousFlux(m::Number=0.0u"lm")
            if !(m isa Quantity)
                m = m * u"lm"
            end
            new(m)
        end
    end

    struct Illuminance <: PhysicsScalar
        m::typeof(1.0u"lx")
    
        function Illuminance(m::Number=0.0u"lx")
            if !(m isa Quantity)
                m = m * u"lx"
            end
            new(m)
        end
    end
    
    struct Radioactivity <: PhysicsScalar
        m::typeof(1.0u"Bq")
    
        function Radioactivity(m::Number=0.0u"Bq")
            if !(m isa Quantity)
                m = m * u"Bq"
            end
            new(m)
        end
    end

    struct AbsorbedDose <: PhysicsScalar
        m::typeof(1.0u"Gy")
    
        function AbsorbedDose(m::Number=0.0u"Gy")
            if !(m isa Quantity)
                m = m * u"Gy"
            end
            new(m)
        end
    end

    struct EquivalentDose <: PhysicsScalar
        m::typeof(1.0u"Sv")
    
        function EquivalentDose(m::Number=0.0u"Sv")
            if !(m isa Quantity)
                m = m * u"Sv"
            end
            new(m)
        end
    end

    struct CatalyticActivity <: PhysicsScalar
        m::typeof(1.0u"kat")
    
        function CatalyticActivity(m::Number=0.0u"kat")
            if !(m isa Quantity)
                m = m * u"kat"
            end
            new(m)
        end
    end

    struct Speed <: PhysicsScalar
        m::typeof(1.0u"m/s")

        function Speed(m::Number=0.0u"m/s")
            if !(m isa Quantity)
                m = m * u"m/s"
            end
            new(m)
        end
    end

    struct Area <: PhysicsScalar
        m::typeof(1.0u"m^2")
    
        function Area(m::Number=0.0u"m^2")
            if !(m isa Quantity)
                m = m * u"m^2"
            end
            new(m)
        end
    end

    struct Volume <: PhysicsScalar
        m::typeof(1.0u"m^3")
    
        function Volume(m::Number=0.0u"m^3")
            if !(m isa Quantity)
                m = m * u"m^3"
            end
            new(m)
        end
    end

    struct Wavenumber <: PhysicsScalar
        m::typeof(1.0u"m^-1")
    
        function Wavenumber(m::Number=0.0u"m^-1")
            if !(m isa Quantity)
                m = m * u"m^-1"
            end
            new(m)
        end
    end

    struct LinearDensity <: PhysicsScalar
        m::typeof(1.0u"kg/m")
    
        function LinearDensity(m::Number=0.0u"kg/m")
            if !(m isa Quantity)
                m = m * u"kg/m"
            end
            new(m)
        end
    end

    struct AreaDensity <: PhysicsScalar
        m::typeof(1.0u"kg/m^2")
    
        function AreaDensity(m::Number=0.0u"kg/m^2")
            if !(m isa Quantity)
                m = m * u"kg/m^2"
            end
            new(m)
        end
    end

    struct Density <: PhysicsScalar
        m::typeof(1.0u"kg/m^3")
    
        function Density(m::Number=0.0u"kg/m^3")
            if !(m isa Quantity)
                m = m * u"kg/m^3"
            end
            new(m)
        end
    end
    
    struct SpecificVolume <: PhysicsScalar
        m::typeof(1.0u"m^3/kg")
    
        function SpecificVolume(m::Number=0.0u"m^3/kg")
            if !(m isa Quantity)
                m = m * u"m^3/kg"
            end
            new(m)
        end
    end
    
    struct Action <: PhysicsScalar
        m::typeof(1.0u"J*s")
    
        function Action(m::Number=0.0u"J*s")
            if !(m isa Quantity)
                m = m * u"J*s"
            end
            new(m)
        end
    end

    