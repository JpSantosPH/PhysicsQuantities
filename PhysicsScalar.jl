abstract type PhysicsScalar <: Number end
    Base.show(io::IO, PS::PhysicsScalar) = print(io, typeof(PS)," ", PS.m)
    Base.collect(PS::PhysicsScalar) = PS.m
    Base.getindex(PS::PhysicsScalar, i::Integer) = if i == 1; return PS.m end

    struct GeneralScalar{T<:Number} <: PhysicsScalar
        m::T
    end

    struct Time <: PhysicsScalar
        m
        function Time(m::Number=0.0u"s")
            m = correct_units(m, u"s")
            return new(m)
        end
    end

    struct Length <: PhysicsScalar
        m
        function Length(m::Number=0.0u"m")
            m = correct_units(m, u"m")
            return new(m)
        end
    end

    struct Mass <: PhysicsScalar
        m
        function Mass(m::Number=0.0u"kg")
            m = correct_units(m, u"kg")
            return new(m)
        end
    end

    struct Current <: PhysicsScalar
        m
        function Current(m::Number=0.0u"A")
            m = correct_units(m, u"A")
            return new(m)
        end
    end

    struct Temperature <: PhysicsScalar
        m
        function Temperature(m::Number=273.15u"K")
            m = correct_units(m, u"K")
            if m ≤ 0u"K"; error("Physics Error") end
            return new(m)
        end
    end

    struct Substance <: PhysicsScalar
        m
        function Substance(m::Number=0.0u"mol")
            m = correct_units(m, u"mol")
            return new(m)
        end
    end

    struct Luminous <: PhysicsScalar
        m
        function Luminous(m::Number=0.0u"cd")
            m = correct_units(m, u"cd")
            return new(m)
        end
    end

    struct Frequency <: PhysicsScalar
        m
        function Frequency(m::Number=0.0u"Hz")
            m = correct_units(m, u"Hz")
            return new(m)
        end
    end

    struct Angle <: PhysicsScalar
        m
        function Angle(m::Number=0.0u"rad")
            m = correct_units(m, u"rad")
            return new(m)
        end
    end

    struct Pressure <: PhysicsScalar
        m
        function Pressure(m::Number=100.0u"kPa")
            m = correct_units(m, u"kPa")
            return new(m)
        end
    end

    struct Energy <: PhysicsScalar
        m
        function Energy(m::Number=0.0u"J")
            m = correct_units(m, u"J")
            return new(m)
        end
    end

    struct Power <: PhysicsScalar
        m
        function Power(m::Number=0.0u"W")
            m = correct_units(m, u"W")
            return new(m)
        end
    end

    struct Charge <: PhysicsScalar
        m
        function Charge(m::Number=0.0u"C")
            m = correct_units(m, u"C")
            return new(m)
        end
    end

    struct Voltage <: PhysicsScalar
        m
        function Voltage(m::Number=0.0u"V")
            m = correct_units(m, u"V")
            return new(m)
        end
    end

    struct Capacitance <: PhysicsScalar
        m
        function Capacitance(m::Number=0.0u"F")
            m = correct_units(m, u"F")
            return new(m)
        end
    end

    struct Resistance <: PhysicsScalar
        m
        function Resistance(m::Number=0.0u"Ω")
            m = correct_units(m, u"Ω")
            return new(m)
        end
    end

    struct Conductance <: PhysicsScalar
        m
        function Conductance(m::Number=0.0u"S")
            m = correct_units(m, u"S")
            return new(m)
        end
    end

    struct MagneticFlux <: PhysicsScalar
        m
        function MagneticFlux(m::Number=0.0u"Wb")
            m = correct_units(m, u"Wb")
            return new(m)
        end
    end

    struct Induction <: PhysicsScalar
        m
        function Induction(m::Number=0.0u"T")
            m = correct_units(m, u"T")
            return new(m)
        end
    end

    struct Inductance <: PhysicsScalar
        m
        function Inductance(m::Number=0.0u"H")
            m = correct_units(m, u"H")
            return new(m)
        end
    end

    struct LuminousFlux <: PhysicsScalar
        m
        function LuminousFlux(m::Number=0.0u"lm")
            m = correct_units(m, u"lm")
            m = uconvert(u"lm", m)
            return new(m)
        end
    end

    struct Illuminance <: PhysicsScalar
        m
        function Illuminance(m::Number=0.0u"lx")
            m = correct_units(m, u"lx")
            return new(m)
        end
    end

    struct Radioactivity <: PhysicsScalar
        m
        function Radioactivity(m::Number=0.0u"Bq")
            m = correct_units(m, u"Bq")
            m = uconvert(u"Bq", m)
            return new(m)
        end
    end

    struct AbsorbedDose <: PhysicsScalar
        m
        function AbsorbedDose(m::Number=0.0u"Gy")
            m = correct_units(m, u"Gy")
            m = uconvert(u"Gy", m)
            return new(m)
        end
    end

    struct EquivalentDose <: PhysicsScalar
        m
        function EquivalentDose(m::Number=0.0u"Sv")
            m = correct_units(m, u"Sv")
            m = uconvert(u"Sv", m)
            return new(m)
        end
    end

    struct CatalyticActivity <: PhysicsScalar
        m
        function CatalyticActivity(m::Number=0.0u"kat")
            m = correct_units(m, u"kat")
            return new(m)
        end
    end

    struct Speed <: PhysicsScalar
        m
        function Speed(m::Number=0.0u"m/s")
            m = correct_units(m, u"m/s")
            return new(m)
        end
    end

    struct FrequencyDrift <: PhysicsScalar
        m
        function FrequencyDrift(m::Number=0.0u"Hz/s")
            m = correct_units(m, u"Hz/s")
            return new(m)
        end
    end

    struct VolumetricFlow <: PhysicsScalar
        m
        function VolumetricFlow(m::Number=0.0u"m^3/s")
            m = correct_units(m, u"m^3/s")
            return new(m)
        end
    end

    struct Area <: PhysicsScalar
        m
        function Area(m::Number=0.0u"m^2")
            m = correct_units(m, u"m^2")
            return new(m)
        end
    end

    struct Volume <: PhysicsScalar
        m
        function Volume(m::Number=0.0u"m^3")
            m = correct_units(m, u"m^3")
            return new(m)
        end
    end

    struct Wavenumber <: PhysicsScalar
        m
        function Wavenumber(m::Number=0.0u"m^-1")
            m = correct_units(m, u"m^-1")
            return new(m)
        end
    end

    struct LinearDensity <: PhysicsScalar
        m
        function LinearDensity(m::Number=0.0u"kg/m")
            m = correct_units(m, u"kg/m")
            return new(m)
        end
    end

    struct AreaDensity <: PhysicsScalar
        m
        function AreaDensity(m::Number=0.0u"kg/m^2")
            m = correct_units(m, u"kg/m^2")
            return new(m)
        end
    end

    struct Density <: PhysicsScalar
        m
        function Density(m::Number=0.0u"kg/m^3")
            m = correct_units(m, u"kg/m^3")
            return new(m)
        end
    end

    struct SpecificVolume <: PhysicsScalar
        m
        function SpecificVolume(m::Number=0.0u"m^3/kg")
            m = correct_units(m, u"m^3/kg")
            return new(m)
        end
    end

    struct Action <: PhysicsScalar
        m
        function Action(m::Number=0.0u"J*s")
            m = correct_units(m, u"J*s")
            return new(m)
        end
    end

    struct SpecificEnergy <: PhysicsScalar
        m
        function SpecificEnergy(m::Number=0.0u"J/kg")
            m = correct_units(m, u"J/kg")
            return new(m)
        end
    end

    struct EnergyDensity <: PhysicsScalar
        m
        function EnergyDensity(m::Number=0.0u"J/m^3")
            m = correct_units(m, u"J/m^3")
            m = uconvert(u"J/m^3", m)
            return new(m)
        end
    end

    struct SurfaceTension <: PhysicsScalar
        m
        function SurfaceTension(m::Number=0.0u"N/m")
            m = correct_units(m, u"N/m")
            return new(m)
        end
    end

    struct KinematicViscosity <: PhysicsScalar
        m
        function KinematicViscosity(m::Number=0.0u"m^2/s")
            m = correct_units(m, u"m^2/s")
            m = uconvert(u"m^2/s", m)
            return new(m)
        end
    end

    struct DynamicViscosity <: PhysicsScalar
        m
        function DynamicViscosity(m::Number=0.0u"Pa*s")
            m = correct_units(m, u"Pa*s")
            return new(m)
        end
    end

    struct MassFLowRate <: PhysicsScalar
        m
        function MassFLowRate(m::Number=0.0u"kg/s")
            m = correct_units(m, u"kg/s")
            return new(m)
        end
    end

    struct AbsorbedDoseRate <: PhysicsScalar
        m
        function AbsorbedDoseRate(m::Number=0.0u"Gy/s")
            m = correct_units(m, u"Gy/s")
            return new(m)
        end
    end

    struct FuelEfficiency <: PhysicsScalar
        m
        function FuelEfficiency(m::Number=0.0u"m/m^3")
            m = correct_units(m, u"m/m^3")
            return new(m)
        end
    end

    struct EnergyFluxDensity <: PhysicsScalar
        m
        function EnergyFluxDensity(m::Number=0.0u"J/(m^2*s)")
            m = correct_units(m, u"J/(m^2*s)")
            return new(m)
        end
    end

    struct Compressibility <: PhysicsScalar
        m
        function Compressibility(m::Number=0.0u"Pa^-1")
            m = correct_units(m, u"Pa^-1")
            return new(m)
        end
    end

    struct MomentOfInertia <: PhysicsScalar
        m
        function MomentOfInertia(m::Number=0.0u"kg*m^2")
            m = correct_units(m, u"kg*m^2")
            return new(m)
        end
    end

    struct SpecificAngularMomentum <: PhysicsScalar
        m
        function SpecificAngularMomentum(m::Number=0.0u"N*m*s/kg")
            m = correct_units(m, u"N*m*s/kg")
            return new(m)
        end
    end

    struct SpectralPower <: PhysicsScalar
        m
        function SpectralPower(m::Number=0.0u"W/m")
            m = correct_units(m, u"W/m")
            return new(m)
        end
    end

    struct Irradiance <: PhysicsScalar
        m
        function Irradiance(m::Number=0.0u"W/m^2")
            m = correct_units(m, u"W/m^2")
            m = uconvert(u"W/m^2", m)
            return new(m)
        end
    end

    struct SpectralIrradiance <: PhysicsScalar
        m
        function SpectralIrradiance(m::Number=0.0u"W/m^3")
            m = correct_units(m, u"W/m^3")
            return new(m)
        end
    end

    struct RadiantIntensity <: PhysicsScalar
        m
        function RadiantIntensity(m::Number=0.0u"W/sr")
            m = correct_units(m, u"W/sr")
            m = uconvert(u"W/sr", m)
            return new(m)
        end
    end

    struct SpectralIntensity <: PhysicsScalar
        m
        function SpectralIntensity(m::Number=0.0u"W/(sr*m)")
            m = correct_units(m, u"W/(sr*m)")
            m = uconvert(u"W/(sr*m)", m)
            return new(m)
        end
    end

    struct Radiance <: PhysicsScalar
        m
        function Radiance(m::Number=0.0u"W/(sr*m^2)")
            m = correct_units(m, u"W/(sr*m^2)")
            m = uconvert(u"W/(sr*m^2)", m)
            return new(m)
        end
    end

    struct SpectralRadiance <: PhysicsScalar
        m
        function SpectralRadiance(m::Number=0.0u"W/(sr*m^3)")
            m = correct_units(m, u"W/(sr*m^3)")
            m = uconvert(u"W/(sr*m^3)", m)
            return new(m)
        end
    end

    struct RadiantExposure <: PhysicsScalar
        m
        function RadiantExposure(m::Number=0.0u"J/m^2")
            m = correct_units(m, u"J/m^2")
            m = uconvert(u"J/m^2", m)
            return new(m)
        end
    end

    struct Molarity <: PhysicsScalar
        m
        function Molarity(m::Number=0.0u"mol/m^3")
            m = correct_units(m, u"mol/m^3")
            return new(m)
        end
    end

    struct MolarVolume <: PhysicsScalar
        m
        function MolarVolume(m::Number=0.0u"m^3/mol")
            m = correct_units(m, u"m^3/mol")
            return new(m)
        end
    end

    struct MolarHeatCapacity <: PhysicsScalar
        m
        function MolarHeatCapacity(m::Number=0.0u"J/(K*mol)")
            m = correct_units(m, u"J/(K*mol)")
            return new(m)
        end
    end

    struct MolarEnergy <: PhysicsScalar
        m
        function MolarEnergy(m::Number=0.0u"J/mol")
            m = correct_units(m, u"J/mol")
            return new(m)
        end
    end

    struct MolarConductivity <: PhysicsScalar
        m
        function MolarConductivity(m::Number=0.0u"S*m^2/mol")
            m = correct_units(m, u"S*m^2/mol")
            return new(m)
        end
    end

    struct Molality <: PhysicsScalar
        m
        function Molality(m::Number=0.0u"mol/kg")
            m = correct_units(m, u"mol/kg")
            return new(m)
        end
    end

    struct MolarMass <: PhysicsScalar
        m
        function MolarMass(m::Number=0.0u"kg/mol")
            m = correct_units(m, u"kg/mol")
            return new(m)
        end
    end

    struct CatalyticEfficiency <: PhysicsScalar
        m
        function CatalyticEfficiency(m::Number=0.0u"m^3/(mol*s)")
            m = correct_units(m, u"m^3/(mol*s)")
            return new(m)
        end
    end

    struct VolumeChargeDensity <: PhysicsScalar
        m
        function VolumeChargeDensity(m::Number=0.0u"C/m^3")
            m = correct_units(m, u"C/m^3")
            return new(m)
        end
    end

    struct AreaChargeDensity <: PhysicsScalar
        m
        function AreaChargeDensity(m::Number=0.0u"C/m^2")
            m = correct_units(m, u"C/m^2")
            return new(m)
        end
    end

    struct LinearChargeDensity <: PhysicsScalar
        m
        function LinearChargeDensity(m::Number=0.0u"C/m")
            m = correct_units(m, u"C/m")
            return new(m)
        end
    end

    struct Conductivity <: PhysicsScalar
        m
        function Conductivity(m::Number=0.0u"S/m")
            m = correct_units(m, u"S/m")
            return new(m)
        end
    end

    struct Permittivity <: PhysicsScalar
        m
        function Permittivity(m::Number=0.0u"F/m")
            m = correct_units(m, u"F/m")
            return new(m)
        end
    end

    struct MagneticPermittivity <: PhysicsScalar
        m
        function MagneticPermittivity(m::Number=0.0u"H/m")
            m = correct_units(m, u"H/m")
            return new(m)
        end
    end

    struct Exposure <: PhysicsScalar
        m
        function Exposure(m::Number=0.0u"C/kg")
            m = correct_units(m, u"C/kg")
            return new(m)
        end
    end

    struct Resistivity <: PhysicsScalar
        m
        function Resistivity(m::Number=0.0u"Ω*m")
            m = correct_units(m, u"Ω*m")
            return new(m)
        end
    end

    struct ElectronMobility <: PhysicsScalar
        m
        function ElectronMobility(m::Number=0.0u"m^2/(V*s)")
            m = correct_units(m, u"m^2/(V*s)")
            return new(m)
        end
    end

    struct MagneticReluctance <: PhysicsScalar
        m
        function MagneticReluctance(m::Number=0.0u"H^-1")
            m = correct_units(m, u"H^-1")
            return new(m)
        end
    end

    struct MagneticRrigidity <: PhysicsScalar
        m
        function MagneticRrigidity(m::Number=0.0u"T*m")
            m = correct_units(m, u"T*m")
            return new(m)
        end
    end

    struct MagnetomotiveForce <: PhysicsScalar
        m
        function MagnetomotiveForce(m::Number=0.0u"A*rad")
            m = correct_units(m, u"A*rad")
            m = uconvert(u"A*rad", m)
            return new(m)
        end
    end

    struct MagneticSusceptibility <: PhysicsScalar
        m
        function MagneticSusceptibility(m::Number=0.0u"m/H")
            m = correct_units(m, u"m/H")
            return new(m)
        end
    end

    struct LuminousEnergy <: PhysicsScalar
        m
        function LuminousEnergy(m::Number=0.0u"lm*s")
            m = correct_units(m, u"lm*s")
            return new(m)
        end
    end

    struct LuminousExposure <: PhysicsScalar
        m
        function LuminousExposure(m::Number=0.0u"lx*s")
            m = correct_units(m, u"lx*s")
            return new(m)
        end
    end

    struct Luminance <: PhysicsScalar
        m
        function Luminance(m::Number=0.0u"cd/m^2")
            m = correct_units(m, u"cd/m^2")
            m = uconvert(u"cd/m^2", m)
            return new(m)
        end
    end

    struct LuminousEfficacy <: PhysicsScalar
        m
        function LuminousEfficacy(m::Number=0.0u"lm/W")
            m = correct_units(m, u"lm/W")
            return new(m)
        end
    end

    struct HeatCapacity <: PhysicsScalar
        m
        function HeatCapacity(m::Number=0.0u"J/K")
            m = correct_units(m, u"J/K")
            return new(m)
        end
    end

    struct SpecificHeatCapacity <: PhysicsScalar
        m
        function SpecificHeatCapacity(m::Number=0.0u"J/(K*kg)")
            m = correct_units(m, u"J/(K*kg)")
            return new(m)
        end
    end

    struct ThermalConductivity <: PhysicsScalar
        m
        function ThermalConductivity(m::Number=0.0u"W/(m*K)")
            m = correct_units(m, u"W/(m*K)")
            return new(m)
        end
    end

    struct ThermalResistance <: PhysicsScalar
        m
        function ThermalResistance(m::Number=0.0u"K/W")
            m = correct_units(m, u"K/W")
            return new(m)
        end
    end

    struct ThermalExpansionCoefficient <: PhysicsScalar
        m
        function ThermalExpansionCoefficient(m::Number=0.0u"K^-1")
            m = correct_units(m, u"K^-1")
            return new(m)
        end
    end

    struct TemperatureGradient <: PhysicsScalar
        m
        function TemperatureGradient(m::Number=0.0u"K/m")
            m = correct_units(m, u"K/m")
            return new(m)
        end
    end