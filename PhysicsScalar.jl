abstract type PhysicsScalar <: Number end
    struct GeneralScalar{T<:Number} <: PhysicsScalar
        m::T
    end
    Base.show(io::IO, PS::GeneralScalar) = print(io, GeneralScalar,"(", PS.m, ")")

    struct Time{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"s"), Unitful.FreeUnits{B, dimension(u"s"), nothing}}
    end
        Base.show(io::IO, PS::Time) = print(io, Time,"(", PS.m, ")")
        function Time(m::Number=0.0u"s")
            m = correct_units(m, u"s")
            return Time(m)
        end

    struct Length{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m"), Unitful.FreeUnits{B, dimension(u"m"), nothing}}
    end
        Base.show(io::IO, PS::Length) = print(io, Length,"(", PS.m, ")")
        function Length(m::Number=0.0u"m")
            m = correct_units(m, u"m")
            return Length(m)
        end

    struct Mass{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"kg"), Unitful.FreeUnits{B, dimension(u"kg"), nothing}}
    end
        Base.show(io::IO, PS::Mass) = print(io, Mass,"(", PS.m, ")")
        function Mass(m::Number=0.0u"kg")
            m = correct_units(m, u"kg")
            return Mass(m)
        end

    struct Current{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"A"), Unitful.FreeUnits{B, dimension(u"A"), nothing}}
    end
        Base.show(io::IO, PS::Current) = print(io, Current,"(", PS.m, ")")
        function Current(m::Number=0.0u"A")
            m = correct_units(m, u"A")
            return Current(m)
        end

    struct Temperature{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"K"), Unitful.FreeUnits{B, dimension(u"K"), nothing}}
    end
        Base.show(io::IO, PS::Temperature) = print(io, Temperature,"(", PS.m, ")")
        function Temperature(m::Number=273.15u"K")
            m = correct_units(m, u"K")
            if m ≤ 0u"K"; error("Physics Error") end
            return Temperature(m)
        end

    struct Substance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"mol"), Unitful.FreeUnits{B, dimension(u"mol"), nothing}}
    end
        Base.show(io::IO, PS::Substance) = print(io, Substance,"(", PS.m, ")")
        function Substance(m::Number=0.0u"mol")
            m = correct_units(m, u"mol")
            return Substance(m)
        end

    struct Luminous{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"cd"), Unitful.FreeUnits{B, dimension(u"cd"), nothing}}
    end
        Base.show(io::IO, PS::Luminous) = print(io, Luminous,"(", PS.m, ")")
        function Luminous(m::Number=0.0u"cd")
            m = correct_units(m, u"cd")
            return Luminous(m)
        end

    struct Frequency{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"Hz"), Unitful.FreeUnits{B, dimension(u"Hz"), nothing}}
    end
        Base.show(io::IO, PS::Frequency) = print(io, Frequency,"(", PS.m, ")")
        function Frequency(m::Number=0.0u"Hz")
            m = correct_units(m, u"Hz")
            return Frequency(m)
        end

    struct Angle{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"rad"), Unitful.FreeUnits{B, dimension(u"rad"), nothing}}
    end
        Base.show(io::IO, PS::Angle) = print(io, Angle,"(", PS.m, ")")
        function Angle(m::Number=0.0u"rad")
            m = correct_units(m, u"rad")
            return Angle(m)
        end

    struct Pressure{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"kPa"), Unitful.FreeUnits{B, dimension(u"kPa"), nothing}}
    end
        Base.show(io::IO, PS::Pressure) = print(io, Pressure,"(", PS.m, ")")
        function Pressure(m::Number=100.0u"kPa")
            m = correct_units(m, u"kPa")
            return Pressure(m)
        end

    struct Energy{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"J"), Unitful.FreeUnits{B, dimension(u"J"), nothing}}
    end
        Base.show(io::IO, PS::Energy) = print(io, Energy,"(", PS.m, ")")
        function Energy(m::Number=0.0u"J")
            m = correct_units(m, u"J")
            return Energy(m)
        end

    struct Power{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"W"), Unitful.FreeUnits{B, dimension(u"W"), nothing}}
    end
        Base.show(io::IO, PS::Power) = print(io, Power,"(", PS.m, ")")
        function Power(m::Number=0.0u"W")
            m = correct_units(m, u"W")
            return Power(m)
        end

    struct Charge{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"C"), Unitful.FreeUnits{B, dimension(u"C"), nothing}}
    end
        Base.show(io::IO, PS::Charge) = print(io, Charge,"(", PS.m, ")")
        function Charge(m::Number=0.0u"C")
            m = correct_units(m, u"C")
            return Charge(m)
        end

    struct Voltage{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"V"), Unitful.FreeUnits{B, dimension(u"V"), nothing}}
    end
        Base.show(io::IO, PS::Voltage) = print(io, Voltage,"(", PS.m, ")")
        function Voltage(m::Number=0.0u"V")
            m = correct_units(m, u"V")
            return Voltage(m)
        end

    struct Capacitance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"F"), Unitful.FreeUnits{B, dimension(u"F"), nothing}}
    end
        Base.show(io::IO, PS::Capacitance) = print(io, Capacitance,"(", PS.m, ")")
        function Capacitance(m::Number=0.0u"F")
            m = correct_units(m, u"F")
            return Capacitance(m)
        end

    struct Resistance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"Ω"), Unitful.FreeUnits{B, dimension(u"Ω"), nothing}}
    end
        Base.show(io::IO, PS::Resistance) = print(io, Resistance,"(", PS.m, ")")
        function Resistance(m::Number=0.0u"Ω")
            m = correct_units(m, u"Ω")
            return Resistance(m)
        end
 
    struct Conductance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"S"), Unitful.FreeUnits{B, dimension(u"S"), nothing}}
    end
        Base.show(io::IO, PS::Conductance) = print(io, Conductance,"(", PS.m, ")")
        function Conductance(m::Number=0.0u"S")
            m = correct_units(m, u"S")
            return Conductance(m)
        end

    struct MagneticFlux{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"Wb"), Unitful.FreeUnits{B, dimension(u"Wb"), nothing}}
    end
        Base.show(io::IO, PS::MagneticFlux) = print(io, MagneticFlux,"(", PS.m, ")")
        function MagneticFlux(m::Number=0.0u"Wb")
            m = correct_units(m, u"Wb")
            return MagneticFlux(m)
        end
    
    struct Induction{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"T"), Unitful.FreeUnits{B, dimension(u"T"), nothing}}
    end
        Base.show(io::IO, PS::Induction) = print(io, Induction,"(", PS.m, ")")
        function Induction(m::Number=0.0u"T")
            m = correct_units(m, u"T")
            return Induction(m)
        end

    struct Inductance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"H"), Unitful.FreeUnits{B, dimension(u"H"), nothing}}
    end
        Base.show(io::IO, PS::Inductance) = print(io, Inductance,"(", PS.m, ")")
        function Inductance(m::Number=0.0u"H")
            m = correct_units(m, u"H")
            return Inductance(m)
        end

    struct LuminousFlux{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"lm"), Unitful.FreeUnits{B, dimension(u"lm"), nothing}}
    end
        Base.show(io::IO, PS::LuminousFlux) = print(io, LuminousFlux,"(", PS.m, ")")
        function LuminousFlux(m::Number=0.0u"lm")
            m = correct_units(m, u"lm")
            m = uconvert(u"lm", m)
            return LuminousFlux(m)
        end

    struct Illuminance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"lx"), Unitful.FreeUnits{B, dimension(u"lx"), nothing}}
    end
        Base.show(io::IO, PS::Illuminance) = print(io, Illuminance,"(", PS.m, ")")
        function Illuminance(m::Number=0.0u"lx")
            m = correct_units(m, u"lx")
            return Illuminance(m)
        end
    
    struct Radioactivity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"Bq"), Unitful.FreeUnits{B, dimension(u"Bq"), nothing}}
    end
        Base.show(io::IO, PS::Radioactivity) = print(io, Radioactivity,"(", PS.m, ")")
        function Radioactivity(m::Number=0.0u"Bq")
            m = correct_units(m, u"Bq")
            m = uconvert(u"Bq", m)
            return Radioactivity(m)
        end

    struct AbsorbedDose{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"Gy"), Unitful.FreeUnits{B, dimension(u"Gy"), nothing}}
    end
        Base.show(io::IO, PS::AbsorbedDose) = print(io, AbsorbedDose,"(", PS.m, ")")
        function AbsorbedDose(m::Number=0.0u"Gy")
            m = correct_units(m, u"Gy")
            m = uconvert(u"Gy", m)
            return AbsorbedDose(m)
        end

    struct EquivalentDose{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"Sv"), Unitful.FreeUnits{B, dimension(u"Sv"), nothing}}
    end
        Base.show(io::IO, PS::EquivalentDose) = print(io, EquivalentDose,"(", PS.m, ")")
        function EquivalentDose(m::Number=0.0u"Sv")
            m = correct_units(m, u"Sv")
            m = uconvert(u"Sv", m)
            return EquivalentDose(m)
        end

    struct CatalyticActivity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"kat"), Unitful.FreeUnits{B, dimension(u"kat"), nothing}}
    end
        Base.show(io::IO, PS::CatalyticActivity) = print(io, CatalyticActivity,"(", PS.m, ")")
        function CatalyticActivity(m::Number=0.0u"kat")
            m = correct_units(m, u"kat")
            return CatalyticActivity(m)
        end

    struct Speed{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m/s"), Unitful.FreeUnits{B, dimension(u"m/s"), nothing}}
    end
        Base.show(io::IO, PS::Speed) = print(io, Speed,"(", PS.m, ")")
        function Speed(m::Number=0.0u"m/s")
            m = correct_units(m, u"m/s")
            return Speed(m)
        end

    struct FrequencyDrift{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"Hz/s"), Unitful.FreeUnits{B, dimension(u"Hz/s"), nothing}}
    end
        Base.show(io::IO, PS::FrequencyDrift) = print(io, FrequencyDrift,"(", PS.m, ")")
        function FrequencyDrift(m::Number=0.0u"Hz/s")
            m = correct_units(m, u"Hz/s")
            return FrequencyDrift(m)
        end
    
    struct VolumetricFlow{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m^3/s"), Unitful.FreeUnits{B, dimension(u"m^3/s"), nothing}}
    end
        Base.show(io::IO, PS::VolumetricFlow) = print(io, VolumetricFlow,"(", PS.m, ")")
        function VolumetricFlow(m::Number=0.0u"m^3/s")
            m = correct_units(m, u"m^3/s")
            return VolumetricFlow(m)
        end

    struct Area{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m^2"), Unitful.FreeUnits{B, dimension(u"m^2"), nothing}}
    end
        Base.show(io::IO, PS::Area) = print(io, Area,"(", PS.m, ")")
        function Area(m::Number=0.0u"m^2")
            m = correct_units(m, u"m^2")
            return Area(m)
        end

    struct Volume{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m^3"), Unitful.FreeUnits{B, dimension(u"m^3"), nothing}}
    end
        Base.show(io::IO, PS::Volume) = print(io, Volume,"(", PS.m, ")")
        function Volume(m::Number=0.0u"m^3")
            m = correct_units(m, u"m^3")
            return Volume(m)
        end

    struct Wavenumber{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m^-1"), Unitful.FreeUnits{B, dimension(u"m^-1"), nothing}}
    end
        Base.show(io::IO, PS::Wavenumber) = print(io, Wavenumber,"(", PS.m, ")")
        function Wavenumber(m::Number=0.0u"m^-1")
            m = correct_units(m, u"m^-1")
            return Wavenumber(m)
        end

    struct LinearDensity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"kg/m"), Unitful.FreeUnits{B, dimension(u"kg/m"), nothing}}
    end
        Base.show(io::IO, PS::LinearDensity) = print(io, LinearDensity,"(", PS.m, ")")
        function LinearDensity(m::Number=0.0u"kg/m")
            m = correct_units(m, u"kg/m")
            return LinearDensity(m)
        end

    struct AreaDensity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"kg/m^2"), Unitful.FreeUnits{B, dimension(u"kg/m^2"), nothing}}
    end
        Base.show(io::IO, PS::AreaDensity) = print(io, AreaDensity,"(", PS.m, ")")
        function AreaDensity(m::Number=0.0u"kg/m^2")
            m = correct_units(m, u"kg/m^2")
            return AreaDensity(m)
        end

    struct Density{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"kg/m^3"), Unitful.FreeUnits{B, dimension(u"kg/m^3"), nothing}}
    end
        Base.show(io::IO, PS::Density) = print(io, Density,"(", PS.m, ")")
        function Density(m::Number=0.0u"kg/m^3")
            m = correct_units(m, u"kg/m^3")
            return Density(m)
        end
    
    struct SpecificVolume{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m^3/kg"), Unitful.FreeUnits{B, dimension(u"m^3/kg"), nothing}}
    end
        Base.show(io::IO, PS::SpecificVolume) = print(io, SpecificVolume,"(", PS.m, ")")
        function SpecificVolume(m::Number=0.0u"m^3/kg")
            m = correct_units(m, u"m^3/kg")
            return SpecificVolume(m)
        end
    
    struct Action{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"J*s"), Unitful.FreeUnits{B, dimension(u"J*s"), nothing}}
    end
        Base.show(io::IO, PS::Action) = print(io, Action,"(", PS.m, ")")
        function Action(m::Number=0.0u"J*s")
            m = correct_units(m, u"J*s")
            return Action(m)
        end

    struct SpecificEnergy{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"J/kg"), Unitful.FreeUnits{B, dimension(u"J/kg"), nothing}}
    end
        Base.show(io::IO, PS::SpecificEnergy) = print(io, SpecificEnergy,"(", PS.m, ")")
        function SpecificEnergy(m::Number=0.0u"J/kg")
            m = correct_units(m, u"J/kg")
            return SpecificEnergy(m)
        end

    struct EnergyDensity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"J/m^3"), Unitful.FreeUnits{B, dimension(u"J/m^3"), nothing}}
    end
        Base.show(io::IO, PS::EnergyDensity) = print(io, EnergyDensity,"(", PS.m, ")")
        function EnergyDensity(m::Number=0.0u"J/m^3")
            m = correct_units(m, u"J/m^3")
            m = uconvert(u"J/m^3", m)
            return EnergyDensity(m)
        end

    struct SurfaceTension{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"N/m"), Unitful.FreeUnits{B, dimension(u"N/m"), nothing}}
    end
        Base.show(io::IO, PS::SurfaceTension) = print(io, SurfaceTension,"(", PS.m, ")")
        function SurfaceTension(m::Number=0.0u"N/m")
            m = correct_units(m, u"N/m")
            return SurfaceTension(m)
        end

    struct KinematicViscosity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m^2/s"), Unitful.FreeUnits{B, dimension(u"m^2/s"), nothing}}
    end
        Base.show(io::IO, PS::KinematicViscosity) = print(io, KinematicViscosity,"(", PS.m, ")")
        function KinematicViscosity(m::Number=0.0u"m^2/s")
            m = correct_units(m, u"m^2/s")
            m = uconvert(u"m^2/s", m)
            return KinematicViscosity(m)
        end

    struct DynamicViscosity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"Pa*s"), Unitful.FreeUnits{B, dimension(u"Pa*s"), nothing}}
    end
        Base.show(io::IO, PS::DynamicViscosity) = print(io, DynamicViscosity,"(", PS.m, ")")
        function DynamicViscosity(m::Number=0.0u"Pa*s")
            m = correct_units(m, u"Pa*s")
            return DynamicViscosity(m)
        end

    struct MassFLowRate{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"kg/s"), Unitful.FreeUnits{B, dimension(u"kg/s"), nothing}}
    end
        Base.show(io::IO, PS::MassFLowRate) = print(io, MassFLowRate,"(", PS.m, ")")
        function MassFLowRate(m::Number=0.0u"kg/s")
            m = correct_units(m, u"kg/s")
            return MassFLowRate(m)
        end

    struct AbsorbedDoseRate{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"Gy/s"), Unitful.FreeUnits{B, dimension(u"Gy/s"), nothing}}
    end
        Base.show(io::IO, PS::AbsorbedDoseRate) = print(io, AbsorbedDoseRate,"(", PS.m, ")")
        function AbsorbedDoseRate(m::Number=0.0u"Gy/s")
            m = correct_units(m, u"Gy/s")
            return AbsorbedDoseRate(m)
        end

    struct FuelEfficiency{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m/m^3"), Unitful.FreeUnits{B, dimension(u"m/m^3"), nothing}}
    end
        Base.show(io::IO, PS::FuelEfficiency) = print(io, FuelEfficiency,"(", PS.m, ")")
        function FuelEfficiency(m::Number=0.0u"m/m^3")
            m = correct_units(m, u"m/m^3")
            return FuelEfficiency(m)
        end

    struct EnergyFluxDensity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"J/(m^2*s)"), Unitful.FreeUnits{B, dimension(u"J/(m^2*s)"), nothing}}
    end
        Base.show(io::IO, PS::EnergyFluxDensity) = print(io, EnergyFluxDensity,"(", PS.m, ")")
        function EnergyFluxDensity(m::Number=0.0u"J/(m^2*s)")
            m = correct_units(m, u"J/(m^2*s)")
            return EnergyFluxDensity(m)
        end

    struct Compressibility{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"Pa^-1"), Unitful.FreeUnits{B, dimension(u"Pa^-1"), nothing}}
    end
        Base.show(io::IO, PS::Compressibility) = print(io, Compressibility,"(", PS.m, ")")
        function Compressibility(m::Number=0.0u"Pa^-1")
            m = correct_units(m, u"Pa^-1")
            return Compressibility(m)
        end

    struct MomentOfInertia{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"kg*m^2"), Unitful.FreeUnits{B, dimension(u"kg*m^2"), nothing}}
    end
        Base.show(io::IO, PS::MomentOfInertia) = print(io, MomentOfInertia,"(", PS.m, ")")
        function MomentOfInertia(m::Number=0.0u"kg*m^2")
            m = correct_units(m, u"kg*m^2")
            return MomentOfInertia(m)
        end

    struct SpecificAngularMomentum{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"N*m*s/kg"), Unitful.FreeUnits{B, dimension(u"N*m*s/kg"), nothing}}
    end
        Base.show(io::IO, PS::SpecificAngularMomentum) = print(io, SpecificAngularMomentum,"(", PS.m, ")")
        function SpecificAngularMomentum(m::Number=0.0u"N*m*s/kg")
            m = correct_units(m, u"N*m*s/kg")
            return SpecificAngularMomentum(m)
        end

    struct SpectralPower{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"W/m"), Unitful.FreeUnits{B, dimension(u"W/m"), nothing}}
    end
        Base.show(io::IO, PS::SpectralPower) = print(io, SpectralPower,"(", PS.m, ")")
        function SpectralPower(m::Number=0.0u"W/m")
            m = correct_units(m, u"W/m")
            return SpectralPower(m)
        end

    struct Irradiance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"W/m^2"), Unitful.FreeUnits{B, dimension(u"W/m^2"), nothing}}
    end
        Base.show(io::IO, PS::Irradiance) = print(io, Irradiance,"(", PS.m, ")")
        function Irradiance(m::Number=0.0u"W/m^2")
            m = correct_units(m, u"W/m^2")
            m = uconvert(u"W/m^2", m)
            return Irradiance(m)
        end

    struct SpectralIrradiance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"W/m^3"), Unitful.FreeUnits{B, dimension(u"W/m^3"), nothing}}
    end
        Base.show(io::IO, PS::SpectralIrradiance) = print(io, SpectralIrradiance,"(", PS.m, ")")
        function SpectralIrradiance(m::Number=0.0u"W/m^3")
            m = correct_units(m, u"W/m^3")
            return SpectralIrradiance(m)
        end

    struct RadiantIntensity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"W/sr"), Unitful.FreeUnits{B, dimension(u"W/sr"), nothing}}
    end
        Base.show(io::IO, PS::RadiantIntensity) = print(io, RadiantIntensity,"(", PS.m, ")")
        function RadiantIntensity(m::Number=0.0u"W/sr")
            m = correct_units(m, u"W/sr")
            m = uconvert(u"W/sr", m)
            return RadiantIntensity(m)
        end

    struct SpectralIntensity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"W/(sr*m)"), Unitful.FreeUnits{B, dimension(u"W/(sr*m)"), nothing}}
    end
        Base.show(io::IO, PS::SpectralIntensity) = print(io, SpectralIntensity,"(", PS.m, ")")
        function SpectralIntensity(m::Number=0.0u"W/(sr*m)")
            m = correct_units(m, u"W/(sr*m)")
            m = uconvert(u"W/(sr*m)", m)
            return SpectralIntensity(m)
        end

    struct Radiance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"W/(sr*m^2)"), Unitful.FreeUnits{B, dimension(u"W/(sr*m^2)"), nothing}}
    end
        Base.show(io::IO, PS::Radiance) = print(io, Radiance,"(", PS.m, ")")
        function Radiance(m::Number=0.0u"W/(sr*m^2)")
            m = correct_units(m, u"W/(sr*m^2)")
            m = uconvert(u"W/(sr*m^2)", m)
            return Radiance(m)
        end

    struct SpectralRadiance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"W/(sr*m^3)"), Unitful.FreeUnits{B, dimension(u"W/(sr*m^3)"), nothing}}
    end
        Base.show(io::IO, PS::SpectralRadiance) = print(io, SpectralRadiance,"(", PS.m, ")")
        function SpectralRadiance(m::Number=0.0u"W/(sr*m^3)")
            m = correct_units(m, u"W/(sr*m^3)")
            m = uconvert(u"W/(sr*m^3)", m)
            return SpectralRadiance(m)
        end

    struct RadiantExposure{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"J/m^2"), Unitful.FreeUnits{B, dimension(u"J/m^2"), nothing}}
    end
        Base.show(io::IO, PS::RadiantExposure) = print(io, RadiantExposure,"(", PS.m, ")")
        function RadiantExposure(m::Number=0.0u"J/m^2")
            m = correct_units(m, u"J/m^2")
            m = uconvert(u"J/m^2", m)
            return RadiantExposure(m)
        end

    struct Molarity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"mol/m^3"), Unitful.FreeUnits{B, dimension(u"mol/m^3"), nothing}}
    end
        Base.show(io::IO, PS::Molarity) = print(io, Molarity,"(", PS.m, ")")
        function Molarity(m::Number=0.0u"mol/m^3")
            m = correct_units(m, u"mol/m^3")
            return Molarity(m)
        end

        struct MolarVolume{A,B} <: PhysicsScalar where {A,B}
            m::Quantity{A, dimension(u"m^3/mol"), Unitful.FreeUnits{B, dimension(u"m^3/mol"), nothing}}
        end
            Base.show(io::IO, PS::MolarVolume) = print(io, MolarVolume,"(", PS.m, ")")
            function MolarVolume(m::Number=0.0u"m^3/mol")
                m = correct_units(m, u"m^3/mol")

                return MolarVolume(m)
            end

    struct MolarHeatCapacity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"J/(K*mol)"), Unitful.FreeUnits{B, dimension(u"J/(K*mol)"), nothing}}
    end
        Base.show(io::IO, PS::MolarHeatCapacity) = print(io, MolarHeatCapacity,"(", PS.m, ")")
        function MolarHeatCapacity(m::Number=0.0u"J/(K*mol)")
            m = correct_units(m, u"J/(K*mol)")
            return MolarHeatCapacity(m)
        end

    struct MolarEnergy{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"J/mol"), Unitful.FreeUnits{B, dimension(u"J/mol"), nothing}}
    end
        Base.show(io::IO, PS::MolarEnergy) = print(io, MolarEnergy,"(", PS.m, ")")
        function MolarEnergy(m::Number=0.0u"J/mol")
            m = correct_units(m, u"J/mol")
            return MolarEnergy(m)
        end

    struct MolarConductivity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"S*m^2/mol"), Unitful.FreeUnits{B, dimension(u"S*m^2/mol"), nothing}}
    end
        Base.show(io::IO, PS::MolarConductivity) = print(io, MolarConductivity,"(", PS.m, ")")
        function MolarConductivity(m::Number=0.0u"S*m^2/mol")
            m = correct_units(m, u"S*m^2/mol")
            return MolarConductivity(m)
        end

    struct Molality{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"mol/kg"), Unitful.FreeUnits{B, dimension(u"mol/kg"), nothing}}
    end
        Base.show(io::IO, PS::Molality) = print(io, Molality,"(", PS.m, ")")
        function Molality(m::Number=0.0u"mol/kg")
            m = correct_units(m, u"mol/kg")
            return Molality(m)
        end

    struct MolarMass{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"kg/mol"), Unitful.FreeUnits{B, dimension(u"kg/mol"), nothing}}
    end
        Base.show(io::IO, PS::MolarMass) = print(io, MolarMass,"(", PS.m, ")")
        function MolarMass(m::Number=0.0u"kg/mol")
            m = correct_units(m, u"kg/mol")
            return MolarMass(m)
        end

    struct CatalyticEfficiency{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m^3/(mol*s)"), Unitful.FreeUnits{B, dimension(u"m^3/(mol*s)"), nothing}}
    end
        Base.show(io::IO, PS::CatalyticEfficiency) = print(io, CatalyticEfficiency,"(", PS.m, ")")
        function CatalyticEfficiency(m::Number=0.0u"m^3/(mol*s)")
            m = correct_units(m, u"m^3/(mol*s)")
            return CatalyticEfficiency(m)
        end

    struct VolumeChargeDensity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"C/m^3"), Unitful.FreeUnits{B, dimension(u"C/m^3"), nothing}}
    end
        Base.show(io::IO, PS::VolumeChargeDensity) = print(io, VolumeChargeDensity,"(", PS.m, ")")
        function VolumeChargeDensity(m::Number=0.0u"C/m^3")
            m = correct_units(m, u"C/m^3")
            return VolumeChargeDensity(m)
        end

    struct AreaChargeDensity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"C/m^2"), Unitful.FreeUnits{B, dimension(u"C/m^2"), nothing}}
    end
        Base.show(io::IO, PS::AreaChargeDensity) = print(io, AreaChargeDensity,"(", PS.m, ")")
        function AreaChargeDensity(m::Number=0.0u"C/m^2")
            m = correct_units(m, u"C/m^2")
            return AreaChargeDensity(m)
        end

    struct LinearChargeDensity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"C/m"), Unitful.FreeUnits{B, dimension(u"C/m"), nothing}}
    end
        Base.show(io::IO, PS::LinearChargeDensity) = print(io, LinearChargeDensity,"(", PS.m, ")")
        function LinearChargeDensity(m::Number=0.0u"C/m")
            m = correct_units(m, u"C/m")
            return LinearChargeDensity(m)
        end

    struct Conductivity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"S/m"), Unitful.FreeUnits{B, dimension(u"S/m"), nothing}}
    end
        Base.show(io::IO, PS::Conductivity) = print(io, Conductivity,"(", PS.m, ")")
        function Conductivity(m::Number=0.0u"S/m")
            m = correct_units(m, u"S/m")
            return Conductivity(m)
        end

    struct Permittivity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"F/m"), Unitful.FreeUnits{B, dimension(u"F/m"), nothing}}
    end
        Base.show(io::IO, PS::Permittivity) = print(io, Permittivity,"(", PS.m, ")")
        function Permittivity(m::Number=0.0u"F/m")
            m = correct_units(m, u"F/m")
            return Permittivity(m)
        end

    struct MagneticPermittivity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"H/m"), Unitful.FreeUnits{B, dimension(u"H/m"), nothing}}
    end
        Base.show(io::IO, PS::MagneticPermittivity) = print(io, MagneticPermittivity,"(", PS.m, ")")
        function MagneticPermittivity(m::Number=0.0u"H/m")
            m = correct_units(m, u"H/m")
            return MagneticPermittivity(m)
        end

    struct Exposure{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"C/kg"), Unitful.FreeUnits{B, dimension(u"C/kg"), nothing}}
    end
        Base.show(io::IO, PS::Exposure) = print(io, Exposure,"(", PS.m, ")")
        function Exposure(m::Number=0.0u"C/kg")
            m = correct_units(m, u"C/kg")
            return Exposure(m)
        end

    struct Resistivity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"Ω*m"), Unitful.FreeUnits{B, dimension(u"Ω*m"), nothing}}
    end
        Base.show(io::IO, PS::Resistivity) = print(io, Resistivity,"(", PS.m, ")")
        function Resistivity(m::Number=0.0u"Ω*m")
            m = correct_units(m, u"Ω*m")
            return Resistivity(m)
        end

    struct ElectronMobility{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m^2/(V*s)"), Unitful.FreeUnits{B, dimension(u"m^2/(V*s)"), nothing}}
    end
        Base.show(io::IO, PS::ElectronMobility) = print(io, ElectronMobility,"(", PS.m, ")")
        function ElectronMobility(m::Number=0.0u"m^2/(V*s)")
            m = correct_units(m, u"m^2/(V*s)")
            return ElectronMobility(m)
        end

    struct MagneticReluctance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"H^-1"), Unitful.FreeUnits{B, dimension(u"H^-1"), nothing}}
    end
        Base.show(io::IO, PS::MagneticReluctance) = print(io, MagneticReluctance,"(", PS.m, ")")
        function MagneticReluctance(m::Number=0.0u"H^-1")
            m = correct_units(m, u"H^-1")
            return MagneticReluctance(m)
        end

    struct MagneticRrigidity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"T*m"), Unitful.FreeUnits{B, dimension(u"T*m"), nothing}}
    end
        Base.show(io::IO, PS::MagneticRrigidity) = print(io, MagneticRrigidity,"(", PS.m, ")")
        function MagneticRrigidity(m::Number=0.0u"T*m")
            m = correct_units(m, u"T*m")
            return MagneticRrigidity(m)
        end

    struct MagnetomotiveForce{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"A*rad"), Unitful.FreeUnits{B, dimension(u"A*rad"), nothing}}
    end
        Base.show(io::IO, PS::MagnetomotiveForce) = print(io, MagnetomotiveForce,"(", PS.m, ")")
        function MagnetomotiveForce(m::Number=0.0u"A*rad")
            m = correct_units(m, u"A*rad")
            m = uconvert(u"A*rad", m)
            return MagnetomotiveForce(m)
        end

    struct MagneticSusceptibility{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m/H"), Unitful.FreeUnits{B, dimension(u"m/H"), nothing}}
    end
        Base.show(io::IO, PS::MagneticSusceptibility) = print(io, MagneticSusceptibility,"(", PS.m, ")")
        function MagneticSusceptibility(m::Number=0.0u"m/H")
            m = correct_units(m, u"m/H")
            return MagneticSusceptibility(m)
        end

    struct LuminousEnergy{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"lm*s"), Unitful.FreeUnits{B, dimension(u"lm*s"), nothing}}
    end
        Base.show(io::IO, PS::LuminousEnergy) = print(io, LuminousEnergy,"(", PS.m, ")")
        function LuminousEnergy(m::Number=0.0u"lm*s")
            m = correct_units(m, u"lm*s")
            return LuminousEnergy(m)
        end

    struct LuminousExposure{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"lx*s"), Unitful.FreeUnits{B, dimension(u"lx*s"), nothing}}
    end
        Base.show(io::IO, PS::LuminousExposure) = print(io, LuminousExposure,"(", PS.m, ")")
        function LuminousExposure(m::Number=0.0u"lx*s")
            m = correct_units(m, u"lx*s")
            return LuminousExposure(m)
        end

    struct Luminance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"cd/m^2"), Unitful.FreeUnits{B, dimension(u"cd/m^2"), nothing}}
    end
        Base.show(io::IO, PS::Luminance) = print(io, Luminance,"(", PS.m, ")")
        function Luminance(m::Number=0.0u"cd/m^2")
            m = correct_units(m, u"cd/m^2")
            m = uconvert(u"cd/m^2", m)
            return Luminance(m)
        end

    struct LuminousEfficacy{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"lm/W"), Unitful.FreeUnits{B, dimension(u"lm/W"), nothing}}
    end
        Base.show(io::IO, PS::LuminousEfficacy) = print(io, LuminousEfficacy,"(", PS.m, ")")
        function LuminousEfficacy(m::Number=0.0u"lm/W")
            m = correct_units(m, u"lm/W")
            return LuminousEfficacy(m)
        end

    struct HeatCapacity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"J/K"), Unitful.FreeUnits{B, dimension(u"J/K"), nothing}}
    end
        Base.show(io::IO, PS::HeatCapacity) = print(io, HeatCapacity,"(", PS.m, ")")
        function HeatCapacity(m::Number=0.0u"J/K")
            m = correct_units(m, u"J/K")
            return HeatCapacity(m)
        end

    struct SpecificHeatCapacity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"J/(K*kg)"), Unitful.FreeUnits{B, dimension(u"J/(K*kg)"), nothing}}
    end
        Base.show(io::IO, PS::SpecificHeatCapacity) = print(io, SpecificHeatCapacity,"(", PS.m, ")")
        function SpecificHeatCapacity(m::Number=0.0u"J/(K*kg)")
            m = correct_units(m, u"J/(K*kg)")
            return SpecificHeatCapacity(m)
        end

    struct ThermalConductivity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"W/(m*K)"), Unitful.FreeUnits{B, dimension(u"W/(m*K)"), nothing}}
    end
        Base.show(io::IO, PS::ThermalConductivity) = print(io, ThermalConductivity,"(", PS.m, ")")
        function ThermalConductivity(m::Number=0.0u"W/(m*K)")
            m = correct_units(m, u"W/(m*K)")
            return ThermalConductivity(m)
        end

    struct ThermalResistance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"K/W"), Unitful.FreeUnits{B, dimension(u"K/W"), nothing}}
    end
        Base.show(io::IO, PS::ThermalResistance) = print(io, ThermalResistance,"(", PS.m, ")")
        function ThermalResistance(m::Number=0.0u"K/W")
            m = correct_units(m, u"K/W")
            return ThermalResistance(m)
        end

    struct ThermalExpansionCoefficient{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"K^-1"), Unitful.FreeUnits{B, dimension(u"K^-1"), nothing}}
    end
        Base.show(io::IO, PS::ThermalExpansionCoefficient) = print(io, ThermalExpansionCoefficient,"(", PS.m, ")")
        function ThermalExpansionCoefficient(m::Number=0.0u"K^-1")
            m = correct_units(m, u"K^-1")
            return ThermalExpansionCoefficient(m)
        end

    struct TemperatureGradient{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"K/m"), Unitful.FreeUnits{B, dimension(u"K/m"), nothing}}
    end
        Base.show(io::IO, PS::TemperatureGradient) = print(io, TemperatureGradient,"(", PS.m, ")")
        function TemperatureGradient(m::Number=0.0u"K/m")
            m = correct_units(m, u"K/m")
            return TemperatureGradient(m)
        end