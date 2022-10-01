using LinearAlgebra
using Unitful

abstract type PhysicsScalar <: Number end
    struct GeneralScalar{T<:Number} <: PhysicsScalar
        m::T
    end
    Base.show(io::IO, PS::GeneralScalar) = print(io, GeneralScalar,"(", PS.m, ")")

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

    struct SpecificEnergy{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"J/kg"), Unitful.FreeUnits{T, dimension(u"J/kg"), nothing}}
    end
        Base.show(io::IO, PS::SpecificEnergy) = print(io, SpecificEnergy,"(", PS.m, ")")
        function SpecificEnergy(m::Number=0.0u"J/kg")
            if !(m isa Quantity); m = m*u"J/kg" end
            m = convert(Quantity{Float64, dimension(u"J/kg")}, m)
            return SpecificEnergy(m)
        end

    struct EnergyDensity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"J/m^3"), Unitful.FreeUnits{T, dimension(u"J/m^3"), nothing}}
    end
        Base.show(io::IO, PS::EnergyDensity) = print(io, EnergyDensity,"(", PS.m, ")")
        function EnergyDensity(m::Number=0.0u"J/m^3")
            if !(m isa Quantity); m = m*u"J/m^3" end
            m = convert(Quantity{Float64, dimension(u"J/m^3")}, m)
            return EnergyDensity(m)
        end

    struct SurfaceTension{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"N/m"), Unitful.FreeUnits{T, dimension(u"N/m"), nothing}}
    end
        Base.show(io::IO, PS::SurfaceTension) = print(io, SurfaceTension,"(", PS.m, ")")
        function SurfaceTension(m::Number=0.0u"N/m")
            if !(m isa Quantity); m = m*u"N/m" end
            m = convert(Quantity{Float64, dimension(u"N/m")}, m)
            return SurfaceTension(m)
        end

    struct KinematicViscosity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"m^2/s"), Unitful.FreeUnits{T, dimension(u"m^2/s"), nothing}}
    end
        Base.show(io::IO, PS::KinematicViscosity) = print(io, KinematicViscosity,"(", PS.m, ")")
        function KinematicViscosity(m::Number=0.0u"m^2/s")
            if !(m isa Quantity); m = m*u"m^2/s" end
            m = convert(Quantity{Float64, dimension(u"m^2/s")}, m)
            return KinematicViscosity(m)
        end

    struct DynamicViscosity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"Pa*s"), Unitful.FreeUnits{T, dimension(u"Pa*s"), nothing}}
    end
        Base.show(io::IO, PS::DynamicViscosity) = print(io, DynamicViscosity,"(", PS.m, ")")
        function DynamicViscosity(m::Number=0.0u"Pa*s")
            if !(m isa Quantity); m = m*u"Pa*s" end
            m = convert(Quantity{Float64, dimension(u"Pa*s")}, m)
            return DynamicViscosity(m)
        end

    struct MassFLowRate{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"kg/s"), Unitful.FreeUnits{T, dimension(u"kg/s"), nothing}}
    end
        Base.show(io::IO, PS::MassFLowRate) = print(io, MassFLowRate,"(", PS.m, ")")
        function MassFLowRate(m::Number=0.0u"kg/s")
            if !(m isa Quantity); m = m*u"kg/s" end
            m = convert(Quantity{Float64, dimension(u"kg/s")}, m)
            return MassFLowRate(m)
        end

    struct AbsorbedDoseRate{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"Gy/s"), Unitful.FreeUnits{T, dimension(u"Gy/s"), nothing}}
    end
        Base.show(io::IO, PS::AbsorbedDoseRate) = print(io, AbsorbedDoseRate,"(", PS.m, ")")
        function AbsorbedDoseRate(m::Number=0.0u"Gy/s")
            if !(m isa Quantity); m = m*u"Gy/s" end
            m = convert(Quantity{Float64, dimension(u"Gy/s")}, m)
            return AbsorbedDoseRate(m)
        end

    struct FuelEfficiency{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"m/m^3"), Unitful.FreeUnits{T, dimension(u"m/m^3"), nothing}}
    end
        Base.show(io::IO, PS::FuelEfficiency) = print(io, FuelEfficiency,"(", PS.m, ")")
        function FuelEfficiency(m::Number=0.0u"m/m^3")
            if !(m isa Quantity); m = m*u"m/m^3" end
            m = convert(Quantity{Float64, dimension(u"m/m^3")}, m)
            return FuelEfficiency(m)
        end

    struct EnergyFluxDensity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"J/(m^2*s)"), Unitful.FreeUnits{T, dimension(u"J/(m^2*s)"), nothing}}
    end
        Base.show(io::IO, PS::EnergyFluxDensity) = print(io, EnergyFluxDensity,"(", PS.m, ")")
        function EnergyFluxDensity(m::Number=0.0u"J/(m^2*s)")
            if !(m isa Quantity); m = m*u"J/(m^2*s)" end
            m = convert(Quantity{Float64, dimension(u"J/(m^2*s)")}, m)
            return EnergyFluxDensity(m)
        end

    struct Compressibility{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"Pa^-1"), Unitful.FreeUnits{T, dimension(u"Pa^-1"), nothing}}
    end
        Base.show(io::IO, PS::Compressibility) = print(io, Compressibility,"(", PS.m, ")")
        function Compressibility(m::Number=0.0u"Pa^-1")
            if !(m isa Quantity); m = m*u"Pa^-1" end
            m = convert(Quantity{Float64, dimension(u"Pa^-1")}, m)
            return Compressibility(m)
        end

    struct MomentOfInertia{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"kg*m^2"), Unitful.FreeUnits{T, dimension(u"kg*m^2"), nothing}}
    end
        Base.show(io::IO, PS::MomentOfInertia) = print(io, MomentOfInertia,"(", PS.m, ")")
        function MomentOfInertia(m::Number=0.0u"kg*m^2")
            if !(m isa Quantity); m = m*u"kg*m^2" end
            m = convert(Quantity{Float64, dimension(u"kg*m^2")}, m)
            return MomentOfInertia(m)
        end

    struct SpecificAngularMomentum{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"N*m*s/kg"), Unitful.FreeUnits{T, dimension(u"N*m*s/kg"), nothing}}
    end
        Base.show(io::IO, PS::SpecificAngularMomentum) = print(io, SpecificAngularMomentum,"(", PS.m, ")")
        function SpecificAngularMomentum(m::Number=0.0u"N*m*s/kg")
            if !(m isa Quantity); m = m*u"N*m*s/kg" end
            m = convert(Quantity{Float64, dimension(u"N*m*s/kg")}, m)
            return SpecificAngularMomentum(m)
        end

    struct SpectralPower{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"W/m"), Unitful.FreeUnits{T, dimension(u"W/m"), nothing}}
    end
        Base.show(io::IO, PS::SpectralPower) = print(io, SpectralPower,"(", PS.m, ")")
        function SpectralPower(m::Number=0.0u"W/m")
            if !(m isa Quantity); m = m*u"W/m" end
            m = convert(Quantity{Float64, dimension(u"W/m")}, m)
            return SpectralPower(m)
        end

    struct Irradiance{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"W/m^2"), Unitful.FreeUnits{T, dimension(u"W/m^2"), nothing}}
    end
        Base.show(io::IO, PS::Irradiance) = print(io, Irradiance,"(", PS.m, ")")
        function Irradiance(m::Number=0.0u"W/m^2")
            if !(m isa Quantity); m = m*u"W/m^2" end
            m = convert(Quantity{Float64, dimension(u"W/m^2")}, m)
            return Irradiance(m)
        end

    struct SpectralIrradiance{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"W/m^3"), Unitful.FreeUnits{T, dimension(u"W/m^3"), nothing}}
    end
        Base.show(io::IO, PS::SpectralIrradiance) = print(io, SpectralIrradiance,"(", PS.m, ")")
        function SpectralIrradiance(m::Number=0.0u"W/m^3")
            if !(m isa Quantity); m = m*u"W/m^3" end
            m = convert(Quantity{Float64, dimension(u"W/m^3")}, m)
            return SpectralIrradiance(m)
        end

    struct RadiantIntensity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"W/sr"), Unitful.FreeUnits{T, dimension(u"W/sr"), nothing}}
    end
        Base.show(io::IO, PS::RadiantIntensity) = print(io, RadiantIntensity,"(", PS.m, ")")
        function RadiantIntensity(m::Number=0.0u"W/sr")
            if !(m isa Quantity); m = m*u"W/sr" end
            m = convert(Quantity{Float64, dimension(u"W/sr")}, m)
            return RadiantIntensity(m)
        end

    struct SpectralIntensity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"W/(sr*m)"), Unitful.FreeUnits{T, dimension(u"W/(sr*m)"), nothing}}
    end
        Base.show(io::IO, PS::SpectralIntensity) = print(io, SpectralIntensity,"(", PS.m, ")")
        function SpectralIntensity(m::Number=0.0u"W/(sr*m)")
            if !(m isa Quantity); m = m*u"W/(sr*m)" end
            m = convert(Quantity{Float64, dimension(u"W/(sr*m)")}, m)
            return SpectralIntensity(m)
        end

    struct Radiance{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"W/(sr*m^2)"), Unitful.FreeUnits{T, dimension(u"W/(sr*m^2)"), nothing}}
    end
        Base.show(io::IO, PS::Radiance) = print(io, Radiance,"(", PS.m, ")")
        function Radiance(m::Number=0.0u"W/(sr*m^2)")
            if !(m isa Quantity); m = m*u"W/(sr*m^2)" end
            m = convert(Quantity{Float64, dimension(u"W/(sr*m^2)")}, m)
            return Radiance(m)
        end

    struct SpectralRadiance{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"W/(sr*m^3)"), Unitful.FreeUnits{T, dimension(u"W/(sr*m^3)"), nothing}}
    end
        Base.show(io::IO, PS::SpectralRadiance) = print(io, SpectralRadiance,"(", PS.m, ")")
        function SpectralRadiance(m::Number=0.0u"W/(sr*m^3)")
            if !(m isa Quantity); m = m*u"W/(sr*m^3)" end
            m = convert(Quantity{Float64, dimension(u"W/(sr*m^3)")}, m)
            return SpectralRadiance(m)
        end

    struct RadiantExposure{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"J/m^2"), Unitful.FreeUnits{T, dimension(u"J/m^2"), nothing}}
    end
        Base.show(io::IO, PS::RadiantExposure) = print(io, RadiantExposure,"(", PS.m, ")")
        function RadiantExposure(m::Number=0.0u"J/m^2")
            if !(m isa Quantity); m = m*u"J/m^2" end
            m = convert(Quantity{Float64, dimension(u"J/m^2")}, m)
            return RadiantExposure(m)
        end

    struct Molarity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"mol/m^3"), Unitful.FreeUnits{T, dimension(u"mol/m^3"), nothing}}
    end
        Base.show(io::IO, PS::Molarity) = print(io, Molarity,"(", PS.m, ")")
        function Molarity(m::Number=0.0u"mol/m^3")
            if !(m isa Quantity); m = m*u"mol/m^3" end
            m = convert(Quantity{Float64, dimension(u"mol/m^3")}, m)
            return Molarity(m)
        end

        struct MolarVolume{T} <: PhysicsScalar where {T}
            m::Quantity{Float64, dimension(u"m^3/mol"), Unitful.FreeUnits{T, dimension(u"m^3/mol"), nothing}}
        end
            Base.show(io::IO, PS::MolarVolume) = print(io, MolarVolume,"(", PS.m, ")")
            function MolarVolume(m::Number=0.0u"m^3/mol")
                if !(m isa Quantity); m = m*u"m^3/mol" end
                m = convert(Quantity{Float64, dimension(u"m^3/mol")}, m)
                return MolarVolume(m)
            end

    struct MolarHeatCapacity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"J/(K*mol)"), Unitful.FreeUnits{T, dimension(u"J/(K*mol)"), nothing}}
    end
        Base.show(io::IO, PS::MolarHeatCapacity) = print(io, MolarHeatCapacity,"(", PS.m, ")")
        function MolarHeatCapacity(m::Number=0.0u"J/(K*mol)")
            if !(m isa Quantity); m = m*u"J/(K*mol)" end
            m = convert(Quantity{Float64, dimension(u"J/(K*mol)")}, m)
            return MolarHeatCapacity(m)
        end

    struct MolarEnergy{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"J/mol"), Unitful.FreeUnits{T, dimension(u"J/mol"), nothing}}
    end
        Base.show(io::IO, PS::MolarEnergy) = print(io, MolarEnergy,"(", PS.m, ")")
        function MolarEnergy(m::Number=0.0u"J/mol")
            if !(m isa Quantity); m = m*u"J/mol" end
            m = convert(Quantity{Float64, dimension(u"J/mol")}, m)
            return MolarEnergy(m)
        end

    struct MolarConductivity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"S*m^2/mol"), Unitful.FreeUnits{T, dimension(u"S*m^2/mol"), nothing}}
    end
        Base.show(io::IO, PS::MolarConductivity) = print(io, MolarConductivity,"(", PS.m, ")")
        function MolarConductivity(m::Number=0.0u"S*m^2/mol")
            if !(m isa Quantity); m = m*u"S*m^2/mol" end
            m = convert(Quantity{Float64, dimension(u"S*m^2/mol")}, m)
            return MolarConductivity(m)
        end

    struct Molality{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"mol/kg"), Unitful.FreeUnits{T, dimension(u"mol/kg"), nothing}}
    end
        Base.show(io::IO, PS::Molality) = print(io, Molality,"(", PS.m, ")")
        function Molality(m::Number=0.0u"mol/kg")
            if !(m isa Quantity); m = m*u"mol/kg" end
            m = convert(Quantity{Float64, dimension(u"mol/kg")}, m)
            return Molality(m)
        end

    struct MolarMass{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"kg/mol"), Unitful.FreeUnits{T, dimension(u"kg/mol"), nothing}}
    end
        Base.show(io::IO, PS::MolarMass) = print(io, MolarMass,"(", PS.m, ")")
        function MolarMass(m::Number=0.0u"kg/mol")
            if !(m isa Quantity); m = m*u"kg/mol" end
            m = convert(Quantity{Float64, dimension(u"kg/mol")}, m)
            return MolarMass(m)
        end

    struct CatalyticEfficiency{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"m^3/(mol*s)"), Unitful.FreeUnits{T, dimension(u"m^3/(mol*s)"), nothing}}
    end
        Base.show(io::IO, PS::CatalyticEfficiency) = print(io, CatalyticEfficiency,"(", PS.m, ")")
        function CatalyticEfficiency(m::Number=0.0u"m^3/(mol*s)")
            if !(m isa Quantity); m = m*u"m^3/(mol*s)" end
            m = convert(Quantity{Float64, dimension(u"m^3/(mol*s)")}, m)
            return CatalyticEfficiency(m)
        end

    struct VolumeChargeDensity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"C/m^3"), Unitful.FreeUnits{T, dimension(u"C/m^3"), nothing}}
    end
        Base.show(io::IO, PS::VolumeChargeDensity) = print(io, VolumeChargeDensity,"(", PS.m, ")")
        function VolumeChargeDensity(m::Number=0.0u"C/m^3")
            if !(m isa Quantity); m = m*u"C/m^3" end
            m = convert(Quantity{Float64, dimension(u"C/m^3")}, m)
            return VolumeChargeDensity(m)
        end

    struct AreaChargeDensity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"C/m^2"), Unitful.FreeUnits{T, dimension(u"C/m^2"), nothing}}
    end
        Base.show(io::IO, PS::AreaChargeDensity) = print(io, AreaChargeDensity,"(", PS.m, ")")
        function AreaChargeDensity(m::Number=0.0u"C/m^2")
            if !(m isa Quantity); m = m*u"C/m^2" end
            m = convert(Quantity{Float64, dimension(u"C/m^2")}, m)
            return AreaChargeDensity(m)
        end

    struct LinearChargeDensity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"C/m"), Unitful.FreeUnits{T, dimension(u"C/m"), nothing}}
    end
        Base.show(io::IO, PS::LinearChargeDensity) = print(io, LinearChargeDensity,"(", PS.m, ")")
        function LinearChargeDensity(m::Number=0.0u"C/m")
            if !(m isa Quantity); m = m*u"C/m" end
            m = convert(Quantity{Float64, dimension(u"C/m")}, m)
            return LinearChargeDensity(m)
        end

    struct Conductivity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"S/m"), Unitful.FreeUnits{T, dimension(u"S/m"), nothing}}
    end
        Base.show(io::IO, PS::Conductivity) = print(io, Conductivity,"(", PS.m, ")")
        function Conductivity(m::Number=0.0u"S/m")
            if !(m isa Quantity); m = m*u"S/m" end
            m = convert(Quantity{Float64, dimension(u"S/m")}, m)
            return Conductivity(m)
        end

    struct Permittivity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"F/m"), Unitful.FreeUnits{T, dimension(u"F/m"), nothing}}
    end
        Base.show(io::IO, PS::Permittivity) = print(io, Permittivity,"(", PS.m, ")")
        function Permittivity(m::Number=0.0u"F/m")
            if !(m isa Quantity); m = m*u"F/m" end
            m = convert(Quantity{Float64, dimension(u"F/m")}, m)
            return Permittivity(m)
        end

    struct MagneticPermittivity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"H/m"), Unitful.FreeUnits{T, dimension(u"H/m"), nothing}}
    end
        Base.show(io::IO, PS::MagneticPermittivity) = print(io, MagneticPermittivity,"(", PS.m, ")")
        function MagneticPermittivity(m::Number=0.0u"H/m")
            if !(m isa Quantity); m = m*u"H/m" end
            m = convert(Quantity{Float64, dimension(u"H/m")}, m)
            return MagneticPermittivity(m)
        end

    struct Exposure{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"C/kg"), Unitful.FreeUnits{T, dimension(u"C/kg"), nothing}}
    end
        Base.show(io::IO, PS::Exposure) = print(io, Exposure,"(", PS.m, ")")
        function Exposure(m::Number=0.0u"C/kg")
            if !(m isa Quantity); m = m*u"C/kg" end
            m = convert(Quantity{Float64, dimension(u"C/kg")}, m)
            return Exposure(m)
        end

    struct Resistivity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"Ω*m"), Unitful.FreeUnits{T, dimension(u"Ω*m"), nothing}}
    end
        Base.show(io::IO, PS::Resistivity) = print(io, Resistivity,"(", PS.m, ")")
        function Resistivity(m::Number=0.0u"Ω*m")
            if !(m isa Quantity); m = m*u"Ω*m" end
            m = convert(Quantity{Float64, dimension(u"Ω*m")}, m)
            return Resistivity(m)
        end

    struct ElectronMobility{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"m^2/(V*s)"), Unitful.FreeUnits{T, dimension(u"m^2/(V*s)"), nothing}}
    end
        Base.show(io::IO, PS::ElectronMobility) = print(io, ElectronMobility,"(", PS.m, ")")
        function ElectronMobility(m::Number=0.0u"m^2/(V*s)")
            if !(m isa Quantity); m = m*u"m^2/(V*s)" end
            m = convert(Quantity{Float64, dimension(u"m^2/(V*s)")}, m)
            return ElectronMobility(m)
        end

    struct MagneticReluctance{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"H^-1"), Unitful.FreeUnits{T, dimension(u"H^-1"), nothing}}
    end
        Base.show(io::IO, PS::MagneticReluctance) = print(io, MagneticReluctance,"(", PS.m, ")")
        function MagneticReluctance(m::Number=0.0u"H^-1")
            if !(m isa Quantity); m = m*u"H^-1" end
            m = convert(Quantity{Float64, dimension(u"H^-1")}, m)
            return MagneticReluctance(m)
        end

    struct MagneticRrigidity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"T*m"), Unitful.FreeUnits{T, dimension(u"T*m"), nothing}}
    end
        Base.show(io::IO, PS::MagneticRrigidity) = print(io, MagneticRrigidity,"(", PS.m, ")")
        function MagneticRrigidity(m::Number=0.0u"T*m")
            if !(m isa Quantity); m = m*u"T*m" end
            m = convert(Quantity{Float64, dimension(u"T*m")}, m)
            return MagneticRrigidity(m)
        end

    struct MagnetomotiveForce{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"A*rad"), Unitful.FreeUnits{T, dimension(u"A*rad"), nothing}}
    end
        Base.show(io::IO, PS::MagnetomotiveForce) = print(io, MagnetomotiveForce,"(", PS.m, ")")
        function MagnetomotiveForce(m::Number=0.0u"A*rad")
            if !(m isa Quantity); m = m*u"A*rad" end
            m = convert(Quantity{Float64, dimension(u"A*rad")}, m)
            return MagnetomotiveForce(m)
        end

    struct MagneticSusceptibility{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"m/H"), Unitful.FreeUnits{T, dimension(u"m/H"), nothing}}
    end
        Base.show(io::IO, PS::MagneticSusceptibility) = print(io, MagneticSusceptibility,"(", PS.m, ")")
        function MagneticSusceptibility(m::Number=0.0u"m/H")
            if !(m isa Quantity); m = m*u"m/H" end
            m = convert(Quantity{Float64, dimension(u"m/H")}, m)
            return MagneticSusceptibility(m)
        end

    struct LuminousEnergy{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"lm*s"), Unitful.FreeUnits{T, dimension(u"lm*s"), nothing}}
    end
        Base.show(io::IO, PS::LuminousEnergy) = print(io, LuminousEnergy,"(", PS.m, ")")
        function LuminousEnergy(m::Number=0.0u"lm*s")
            if !(m isa Quantity); m = m*u"lm*s" end
            m = convert(Quantity{Float64, dimension(u"lm*s")}, m)
            return LuminousEnergy(m)
        end

    struct LuminousExposure{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"lx*s"), Unitful.FreeUnits{T, dimension(u"lx*s"), nothing}}
    end
        Base.show(io::IO, PS::LuminousExposure) = print(io, LuminousExposure,"(", PS.m, ")")
        function LuminousExposure(m::Number=0.0u"lx*s")
            if !(m isa Quantity); m = m*u"lx*s" end
            m = convert(Quantity{Float64, dimension(u"lx*s")}, m)
            return LuminousExposure(m)
        end

    struct Luminance{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"cd/m^2"), Unitful.FreeUnits{T, dimension(u"cd/m^2"), nothing}}
    end
        Base.show(io::IO, PS::Luminance) = print(io, Luminance,"(", PS.m, ")")
        function Luminance(m::Number=0.0u"cd/m^2")
            if !(m isa Quantity); m = m*u"cd/m^2" end
            m = convert(Quantity{Float64, dimension(u"cd/m^2")}, m)
            return Luminance(m)
        end

    struct LuminousEfficacy{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"lm/W"), Unitful.FreeUnits{T, dimension(u"lm/W"), nothing}}
    end
        Base.show(io::IO, PS::LuminousEfficacy) = print(io, LuminousEfficacy,"(", PS.m, ")")
        function LuminousEfficacy(m::Number=0.0u"lm/W")
            if !(m isa Quantity); m = m*u"lm/W" end
            m = convert(Quantity{Float64, dimension(u"lm/W")}, m)
            return LuminousEfficacy(m)
        end

    struct HeatCapacity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"J/K"), Unitful.FreeUnits{T, dimension(u"J/K"), nothing}}
    end
        Base.show(io::IO, PS::HeatCapacity) = print(io, HeatCapacity,"(", PS.m, ")")
        function HeatCapacity(m::Number=0.0u"J/K")
            if !(m isa Quantity); m = m*u"J/K" end
            m = convert(Quantity{Float64, dimension(u"J/K")}, m)
            return HeatCapacity(m)
        end

    struct SpecificHeatCapacity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"J/(K*kg)"), Unitful.FreeUnits{T, dimension(u"J/(K*kg)"), nothing}}
    end
        Base.show(io::IO, PS::SpecificHeatCapacity) = print(io, SpecificHeatCapacity,"(", PS.m, ")")
        function SpecificHeatCapacity(m::Number=0.0u"J/(K*kg)")
            if !(m isa Quantity); m = m*u"J/(K*kg)" end
            m = convert(Quantity{Float64, dimension(u"J/(K*kg)")}, m)
            return SpecificHeatCapacity(m)
        end

    struct ThermalConductivity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"W/(m*K)"), Unitful.FreeUnits{T, dimension(u"W/(m*K)"), nothing}}
    end
        Base.show(io::IO, PS::ThermalConductivity) = print(io, ThermalConductivity,"(", PS.m, ")")
        function ThermalConductivity(m::Number=0.0u"W/(m*K)")
            if !(m isa Quantity); m = m*u"W/(m*K)" end
            m = convert(Quantity{Float64, dimension(u"W/(m*K)")}, m)
            return ThermalConductivity(m)
        end

    struct ThermalResistance{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"K/W"), Unitful.FreeUnits{T, dimension(u"K/W"), nothing}}
    end
        Base.show(io::IO, PS::ThermalResistance) = print(io, ThermalResistance,"(", PS.m, ")")
        function ThermalResistance(m::Number=0.0u"K/W")
            if !(m isa Quantity); m = m*u"K/W" end
            m = convert(Quantity{Float64, dimension(u"K/W")}, m)
            return ThermalResistance(m)
        end

    struct ThermalExpansionCoefficient{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"K^-1"), Unitful.FreeUnits{T, dimension(u"K^-1"), nothing}}
    end
        Base.show(io::IO, PS::ThermalExpansionCoefficient) = print(io, ThermalExpansionCoefficient,"(", PS.m, ")")
        function ThermalExpansionCoefficient(m::Number=0.0u"K^-1")
            if !(m isa Quantity); m = m*u"K^-1" end
            m = convert(Quantity{Float64, dimension(u"K^-1")}, m)
            return ThermalExpansionCoefficient(m)
        end

    struct TemperatureGradient{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"K/m"), Unitful.FreeUnits{T, dimension(u"K/m"), nothing}}
    end
        Base.show(io::IO, PS::TemperatureGradient) = print(io, TemperatureGradient,"(", PS.m, ")")
        function TemperatureGradient(m::Number=0.0u"K/m")
            if !(m isa Quantity); m = m*u"K/m" end
            m = convert(Quantity{Float64, dimension(u"K/m")}, m)
            return TemperatureGradient(m)
        end