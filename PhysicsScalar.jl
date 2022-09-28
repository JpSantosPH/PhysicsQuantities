using LinearAlgebra
using Unitful

abstract type PhysicsScalar <: Number end
    struct Time{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"s"), Unitful.FreeUnits{T, dimension(u"s"), nothing}}
    end
        Base.show(io::IO, PS::Time) = print(io, Time,"(", PS.m, ")")
        function Time(m::Number=0.0u"s")
            if !(m isa Quantity); m = m*u"s" end
            m = convert(Quantity{Float64, dimension(u"s")}, m)
            return Time(m)
        end

    struct Length{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"m"), Unitful.FreeUnits{T, dimension(u"m"), nothing}}
    end
        Base.show(io::IO, PS::Length) = print(io, Length,"(", PS.m, ")")
        function Length(m::Number=0.0u"m")
            if !(m isa Quantity); m = m*u"m" end
            m = convert(Quantity{Float64, dimension(u"m")}, m)
            return Length(m)
        end

    struct Mass{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"kg"), Unitful.FreeUnits{T, dimension(u"kg"), nothing}}
    end
        Base.show(io::IO, PS::Mass) = print(io, Mass,"(", PS.m, ")")
        function Mass(m::Number=0.0u"kg")
            if !(m isa Quantity); m = m*u"kg" end
            m = convert(Quantity{Float64, dimension(u"kg")}, m)
            return Mass(m)
        end

    struct Current{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"A"), Unitful.FreeUnits{T, dimension(u"A"), nothing}}
    end
        Base.show(io::IO, PS::Current) = print(io, Current,"(", PS.m, ")")
        function Current(m::Number=0.0u"A")
            if !(m isa Quantity); m = m*u"A" end
            m = convert(Quantity{Float64, dimension(u"A")}, m)
            return Current(m)
        end

    struct Temperature{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"K"), Unitful.FreeUnits{T, dimension(u"K"), nothing}}
    end
        Base.show(io::IO, PS::Temperature) = print(io, Temperature,"(", PS.m, ")")
        function Temperature(m::Number=273.15u"K")
            if !(m isa Quantity); m = m*u"K" end
            if m ≤ 0u"K"; error("Physics Error") end
            m = convert(Quantity{Float64, dimension(u"K")}, m)
            return Temperature(m)
        end

    struct Substance{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"mol"), Unitful.FreeUnits{T, dimension(u"mol"), nothing}}
    end
        Base.show(io::IO, PS::Substance) = print(io, Substance,"(", PS.m, ")")
        function Substance(m::Number=0.0u"mol")
            if !(m isa Quantity); m = m*u"mol" end
            m = convert(Quantity{Float64, dimension(u"mol")}, m)
            return Substance(m)
        end

    struct Luminous{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"cd"), Unitful.FreeUnits{T, dimension(u"cd"), nothing}}
    end
        Base.show(io::IO, PS::Luminous) = print(io, Luminous,"(", PS.m, ")")
        function Luminous(m::Number=0.0u"cd")
            if !(m isa Quantity); m = m*u"cd" end
            m = convert(Quantity{Float64, dimension(u"cd")}, m)
            return Luminous(m)
        end

    struct Frequency{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"Hz"), Unitful.FreeUnits{T, dimension(u"Hz"), nothing}}
    end
        Base.show(io::IO, PS::Frequency) = print(io, Frequency,"(", PS.m, ")")
        function Frequency(m::Number=0.0u"Hz")
            if !(m isa Quantity); m = m*u"Hz" end
            m = convert(Quantity{Float64, dimension(u"Hz")}, m)
            return Frequency(m)
        end

    struct Angle{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"rad"), Unitful.FreeUnits{T, dimension(u"rad"), nothing}}
    end
        Base.show(io::IO, PS::Angle) = print(io, Angle,"(", PS.m, ")")
        function Angle(m::Number=0.0u"rad")
            if !(m isa Quantity); m = m*u"rad" end
            m = convert(Quantity{Float64, dimension(u"rad")}, m)
            return Angle(m)
        end

    struct Pressure{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"kPa"), Unitful.FreeUnits{T, dimension(u"kPa"), nothing}}
    end
        Base.show(io::IO, PS::Pressure) = print(io, Pressure,"(", PS.m, ")")
        function Pressure(m::Number=100.0u"kPa")
            if !(m isa Quantity); m = m*u"kPa" end
            m = convert(Quantity{Float64, dimension(u"kPa")}, m)
            return Pressure(m)
        end

    struct Energy{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"J"), Unitful.FreeUnits{T, dimension(u"J"), nothing}}
    end
        Base.show(io::IO, PS::Energy) = print(io, Energy,"(", PS.m, ")")
        function Energy(m::Number=0.0u"J")
            if !(m isa Quantity); m = m*u"J" end
            m = convert(Quantity{Float64, dimension(u"J")}, m)
            return Energy(m)
        end

    struct Power{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"W"), Unitful.FreeUnits{T, dimension(u"W"), nothing}}
    end
        Base.show(io::IO, PS::Power) = print(io, Power,"(", PS.m, ")")
        function Power(m::Number=0.0u"W")
            if !(m isa Quantity); m = m*u"W" end
            m = convert(Quantity{Float64, dimension(u"W")}, m)
            return Power(m)
        end

    struct Charge{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"C"), Unitful.FreeUnits{T, dimension(u"C"), nothing}}
    end
        Base.show(io::IO, PS::Charge) = print(io, Charge,"(", PS.m, ")")
        function Charge(m::Number=0.0u"C")
            if !(m isa Quantity); m = m*u"C" end
            m = convert(Quantity{Float64, dimension(u"C")}, m)
            return Charge(m)
        end

    struct Voltage{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"V"), Unitful.FreeUnits{T, dimension(u"V"), nothing}}
    end
        Base.show(io::IO, PS::Voltage) = print(io, Voltage,"(", PS.m, ")")
        function Voltage(m::Number=0.0u"V")
            if !(m isa Quantity); m = m*u"V" end
            m = convert(Quantity{Float64, dimension(u"V")}, m)
            return Voltage(m)
        end

    struct Capacitance{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"F"), Unitful.FreeUnits{T, dimension(u"F"), nothing}}
    end
        Base.show(io::IO, PS::Capacitance) = print(io, Capacitance,"(", PS.m, ")")
        function Capacitance(m::Number=0.0u"F")
            if !(m isa Quantity); m = m*u"F" end
            m = convert(Quantity{Float64, dimension(u"F")}, m)
            return Capacitance(m)
        end

    struct Resistance{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"Ω"), Unitful.FreeUnits{T, dimension(u"Ω"), nothing}}
    end
        Base.show(io::IO, PS::Resistance) = print(io, Resistance,"(", PS.m, ")")
        function Resistance(m::Number=0.0u"Ω")
            if !(m isa Quantity); m = m*u"Ω" end
            m = convert(Quantity{Float64, dimension(u"Ω")}, m)
            return Resistance(m)
        end
 
    struct Conductance{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"S"), Unitful.FreeUnits{T, dimension(u"S"), nothing}}
    end
        Base.show(io::IO, PS::Conductance) = print(io, Conductance,"(", PS.m, ")")
        function Conductance(m::Number=0.0u"S")
            if !(m isa Quantity); m = m*u"S" end
            m = convert(Quantity{Float64, dimension(u"S")}, m)
            return Conductance(m)
        end

    struct MagneticFlux{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"Wb"), Unitful.FreeUnits{T, dimension(u"Wb"), nothing}}
    end
        Base.show(io::IO, PS::MagneticFlux) = print(io, MagneticFlux,"(", PS.m, ")")
        function MagneticFlux(m::Number=0.0u"Wb")
            if !(m isa Quantity); m = m*u"Wb" end
            m = convert(Quantity{Float64, dimension(u"Wb")}, m)
            return MagneticFlux(m)
        end
    
    struct Induction{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"T"), Unitful.FreeUnits{T, dimension(u"T"), nothing}}
    end
        Base.show(io::IO, PS::Induction) = print(io, Induction,"(", PS.m, ")")
        function Induction(m::Number=0.0u"T")
            if !(m isa Quantity); m = m*u"T" end
            m = convert(Quantity{Float64, dimension(u"T")}, m)
            return Induction(m)
        end

    struct Inductance{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"H"), Unitful.FreeUnits{T, dimension(u"H"), nothing}}
    end
        Base.show(io::IO, PS::Inductance) = print(io, Inductance,"(", PS.m, ")")
        function Inductance(m::Number=0.0u"H")
            if !(m isa Quantity); m = m*u"H" end
            m = convert(Quantity{Float64, dimension(u"H")}, m)
            return Inductance(m)
        end

    struct LuminousFlux{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"lm"), Unitful.FreeUnits{T, dimension(u"lm"), nothing}}
    end
        Base.show(io::IO, PS::LuminousFlux) = print(io, LuminousFlux,"(", PS.m, ")")
        function LuminousFlux(m::Number=0.0u"lm")
            if !(m isa Quantity); m = m*u"lm" end
            m = convert(Quantity{Float64, dimension(u"lm")}, m)
            return LuminousFlux(m)
        end

    struct Illuminance{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"lx"), Unitful.FreeUnits{T, dimension(u"lx"), nothing}}
    end
        Base.show(io::IO, PS::Illuminance) = print(io, Illuminance,"(", PS.m, ")")
        function Illuminance(m::Number=0.0u"lx")
            if !(m isa Quantity); m = m*u"lx" end
            m = convert(Quantity{Float64, dimension(u"lx")}, m)
            return Illuminance(m)
        end
    
    struct Radioactivity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"Bq"), Unitful.FreeUnits{T, dimension(u"Bq"), nothing}}
    end
        Base.show(io::IO, PS::Radioactivity) = print(io, Radioactivity,"(", PS.m, ")")
        function Radioactivity(m::Number=0.0u"Bq")
            if !(m isa Quantity); m = m*u"Bq" end
            m = convert(Quantity{Float64, dimension(u"Bq")}, m)
            return Radioactivity(m)
        end

    struct AbsorbedDose{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"Gy"), Unitful.FreeUnits{T, dimension(u"Gy"), nothing}}
    end
        Base.show(io::IO, PS::AbsorbedDose) = print(io, AbsorbedDose,"(", PS.m, ")")
        function AbsorbedDose(m::Number=0.0u"Gy")
            if !(m isa Quantity); m = m*u"Gy" end
            m = convert(Quantity{Float64, dimension(u"Gy")}, m)
            return AbsorbedDose(m)
        end

    struct EquivalentDose{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"Sv"), Unitful.FreeUnits{T, dimension(u"Sv"), nothing}}
    end
        Base.show(io::IO, PS::EquivalentDose) = print(io, EquivalentDose,"(", PS.m, ")")
        function EquivalentDose(m::Number=0.0u"Sv")
            if !(m isa Quantity); m = m*u"Sv" end
            m = convert(Quantity{Float64, dimension(u"Sv")}, m)
            return EquivalentDose(m)
        end

    struct CatalyticActivity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"kat"), Unitful.FreeUnits{T, dimension(u"kat"), nothing}}
    end
        Base.show(io::IO, PS::CatalyticActivity) = print(io, CatalyticActivity,"(", PS.m, ")")
        function CatalyticActivity(m::Number=0.0u"kat")
            if !(m isa Quantity); m = m*u"kat" end
            m = convert(Quantity{Float64, dimension(u"kat")}, m)
            return CatalyticActivity(m)
        end

    struct Speed{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"m/s"), Unitful.FreeUnits{T, dimension(u"m/s"), nothing}}
    end
        Base.show(io::IO, PS::Speed) = print(io, Speed,"(", PS.m, ")")
        function Speed(m::Number=0.0u"m/s")
            if !(m isa Quantity); m = m*u"m/s" end
            m = convert(Quantity{Float64, dimension(u"m/s")}, m)
            return Speed(m)
        end

    struct FrequencyDrift{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"Hz/s"), Unitful.FreeUnits{T, dimension(u"Hz/s"), nothing}}
    end
        Base.show(io::IO, PS::FrequencyDrift) = print(io, FrequencyDrift,"(", PS.m, ")")
        function FrequencyDrift(m::Number=0.0u"Hz/s")
            if !(m isa Quantity); m = m*u"Hz/s" end
            m = convert(Quantity{Float64, dimension(u"Hz/s")}, m)
            return FrequencyDrift(m)
        end
    
    struct VolumetricFlow{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"m^3/s"), Unitful.FreeUnits{T, dimension(u"m^3/s"), nothing}}
    end
        Base.show(io::IO, PS::VolumetricFlow) = print(io, VolumetricFlow,"(", PS.m, ")")
        function VolumetricFlow(m::Number=0.0u"m^3/s")
            if !(m isa Quantity); m = m*u"m^3/s" end
            m = convert(Quantity{Float64, dimension(u"m^3/s")}, m)
            return VolumetricFlow(m)
        end

    struct Area{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"m^2"), Unitful.FreeUnits{T, dimension(u"m^2"), nothing}}
    end
        Base.show(io::IO, PS::Area) = print(io, Area,"(", PS.m, ")")
        function Area(m::Number=0.0u"m^2")
            if !(m isa Quantity); m = m*u"m^2" end
            m = convert(Quantity{Float64, dimension(u"m^2")}, m)
            return Area(m)
        end

    struct Volume{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"m^3"), Unitful.FreeUnits{T, dimension(u"m^3"), nothing}}
    end
        Base.show(io::IO, PS::Volume) = print(io, Volume,"(", PS.m, ")")
        function Volume(m::Number=0.0u"m^3")
            if !(m isa Quantity); m = m*u"m^3" end
            m = convert(Quantity{Float64, dimension(u"m^3")}, m)
            return Volume(m)
        end

    struct Wavenumber{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"m^-1"), Unitful.FreeUnits{T, dimension(u"m^-1"), nothing}}
    end
        Base.show(io::IO, PS::Wavenumber) = print(io, Wavenumber,"(", PS.m, ")")
        function Wavenumber(m::Number=0.0u"m^-1")
            if !(m isa Quantity); m = m*u"m^-1" end
            m = convert(Quantity{Float64, dimension(u"m^-1")}, m)
            return Wavenumber(m)
        end

    struct LinearDensity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"kg/m"), Unitful.FreeUnits{T, dimension(u"kg/m"), nothing}}
    end
        Base.show(io::IO, PS::LinearDensity) = print(io, LinearDensity,"(", PS.m, ")")
        function LinearDensity(m::Number=0.0u"kg/m")
            if !(m isa Quantity); m = m*u"kg/m" end
            m = convert(Quantity{Float64, dimension(u"kg/m")}, m)
            return LinearDensity(m)
        end

    struct AreaDensity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"kg/m^2"), Unitful.FreeUnits{T, dimension(u"kg/m^2"), nothing}}
    end
        Base.show(io::IO, PS::AreaDensity) = print(io, AreaDensity,"(", PS.m, ")")
        function AreaDensity(m::Number=0.0u"kg/m^2")
            if !(m isa Quantity); m = m*u"kg/m^2" end
            m = convert(Quantity{Float64, dimension(u"kg/m^2")}, m)
            return AreaDensity(m)
        end

    struct Density{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"kg/m^3"), Unitful.FreeUnits{T, dimension(u"kg/m^3"), nothing}}
    end
        Base.show(io::IO, PS::Density) = print(io, Density,"(", PS.m, ")")
        function Density(m::Number=0.0u"kg/m^3")
            if !(m isa Quantity); m = m*u"kg/m^3" end
            m = convert(Quantity{Float64, dimension(u"kg/m^3")}, m)
            return Density(m)
        end
    
    struct SpecificVolume{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"m^3/kg"), Unitful.FreeUnits{T, dimension(u"m^3/kg"), nothing}}
    end
        Base.show(io::IO, PS::SpecificVolume) = print(io, SpecificVolume,"(", PS.m, ")")
        function SpecificVolume(m::Number=0.0u"m^3/kg")
            if !(m isa Quantity); m = m*u"m^3/kg" end
            m = convert(Quantity{Float64, dimension(u"m^3/kg")}, m)
            return SpecificVolume(m)
        end
    
    struct Action{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"J*s"), Unitful.FreeUnits{T, dimension(u"J*s"), nothing}}
    end
        Base.show(io::IO, PS::Action) = print(io, Action,"(", PS.m, ")")
        function Action(m::Number=0.0u"J*s")
            if !(m isa Quantity); m = m*u"J*s" end
            m = convert(Quantity{Float64, dimension(u"J*s")}, m)
            return Action(m)
        end

    