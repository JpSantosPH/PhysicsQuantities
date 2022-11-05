abstract type PhysicsScalar <: Number end
    Base.show(io::IO, PS::PhysicsScalar) = print(io, physicstype(PS),"(", PS.m, ")")
    Base.collect(PS::PhysicsScalar) = PS.m
    Base.getindex(PS::PhysicsScalar, i::Integer) = if i == 1; return PS.m end

    struct GeneralScalar{T<:Number} <: PhysicsScalar
        m::T
    end

    struct Time{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"s"), Unitful.FreeUnits{B, dimension(u"s"), nothing}}
    end
        function Time(m::Number=0.0u"s")
            m = correct_units(m, u"s")
            return Time(m)
        end

    struct Length{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m"), Unitful.FreeUnits{B, dimension(u"m"), nothing}}
    end
        function Length(m::Number=0.0u"m")
            m = correct_units(m, u"m")
            return Length(m)
        end

    struct Mass{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"kg"), Unitful.FreeUnits{B, dimension(u"kg"), nothing}}
    end
        function Mass(m::Number=0.0u"kg")
            m = correct_units(m, u"kg")
            return Mass(m)
        end

    struct Current{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"A"), Unitful.FreeUnits{B, dimension(u"A"), nothing}}
    end
        function Current(m::Number=0.0u"A")
            m = correct_units(m, u"A")
            return Current(m)
        end

    struct Temperature{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"K"), Unitful.FreeUnits{B, dimension(u"K"), nothing}}
    end
        function Temperature(m::Number=273.15u"K")
            m = correct_units(m, u"K")
            if m ≤ 0u"K"; error("Physics Error") end
            return Temperature(m)
        end

    struct Substance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"mol"), Unitful.FreeUnits{B, dimension(u"mol"), nothing}}
    end
        function Substance(m::Number=0.0u"mol")
            m = correct_units(m, u"mol")
            return Substance(m)
        end

    struct Luminous{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"cd"), Unitful.FreeUnits{B, dimension(u"cd"), nothing}}
    end
        function Luminous(m::Number=0.0u"cd")
            m = correct_units(m, u"cd")
            return Luminous(m)
        end

    struct Frequency{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"Hz"), Unitful.FreeUnits{B, dimension(u"Hz"), nothing}}
    end
        function Frequency(m::Number=0.0u"Hz")
            m = correct_units(m, u"Hz")
            return Frequency(m)
        end

    struct Angle{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"rad"), Unitful.FreeUnits{B, dimension(u"rad"), nothing}}
    end
        function Angle(m::Number=0.0u"rad")
            m = correct_units(m, u"rad")
            return Angle(m)
        end

    struct Pressure{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"kPa"), Unitful.FreeUnits{B, dimension(u"kPa"), nothing}}
    end
        function Pressure(m::Number=100.0u"kPa")
            m = correct_units(m, u"kPa")
            return Pressure(m)
        end

    struct Energy{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"J"), Unitful.FreeUnits{B, dimension(u"J"), nothing}}
    end
        function Energy(m::Number=0.0u"J")
            m = correct_units(m, u"J")
            return Energy(m)
        end

    struct Power{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"W"), Unitful.FreeUnits{B, dimension(u"W"), nothing}}
    end
        function Power(m::Number=0.0u"W")
            m = correct_units(m, u"W")
            return Power(m)
        end

    struct Charge{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"C"), Unitful.FreeUnits{B, dimension(u"C"), nothing}}
    end
        function Charge(m::Number=0.0u"C")
            m = correct_units(m, u"C")
            return Charge(m)
        end

    struct Voltage{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"V"), Unitful.FreeUnits{B, dimension(u"V"), nothing}}
    end
        function Voltage(m::Number=0.0u"V")
            m = correct_units(m, u"V")
            return Voltage(m)
        end

    struct Capacitance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"F"), Unitful.FreeUnits{B, dimension(u"F"), nothing}}
    end
        function Capacitance(m::Number=0.0u"F")
            m = correct_units(m, u"F")
            return Capacitance(m)
        end

    struct Resistance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"Ω"), Unitful.FreeUnits{B, dimension(u"Ω"), nothing}}
    end
        function Resistance(m::Number=0.0u"Ω")
            m = correct_units(m, u"Ω")
            return Resistance(m)
        end

    struct Conductance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"S"), Unitful.FreeUnits{B, dimension(u"S"), nothing}}
    end
        function Conductance(m::Number=0.0u"S")
            m = correct_units(m, u"S")
            return Conductance(m)
        end

    struct MagneticFlux{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"Wb"), Unitful.FreeUnits{B, dimension(u"Wb"), nothing}}
    end
        function MagneticFlux(m::Number=0.0u"Wb")
            m = correct_units(m, u"Wb")
            return MagneticFlux(m)
        end

    struct Induction{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"T"), Unitful.FreeUnits{B, dimension(u"T"), nothing}}
    end
        function Induction(m::Number=0.0u"T")
            m = correct_units(m, u"T")
            return Induction(m)
        end

    struct Inductance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"H"), Unitful.FreeUnits{B, dimension(u"H"), nothing}}
    end
        function Inductance(m::Number=0.0u"H")
            m = correct_units(m, u"H")
            return Inductance(m)
        end

    struct LuminousFlux{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"lm"), Unitful.FreeUnits{B, dimension(u"lm"), nothing}}
    end
        function LuminousFlux(m::Number=0.0u"lm")
            m = correct_units(m, u"lm")
            m = uconvert(u"lm", m)
            return LuminousFlux(m)
        end

    struct Illuminance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"lx"), Unitful.FreeUnits{B, dimension(u"lx"), nothing}}
    end
        function Illuminance(m::Number=0.0u"lx")
            m = correct_units(m, u"lx")
            return Illuminance(m)
        end

    struct Radioactivity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"Bq"), Unitful.FreeUnits{B, dimension(u"Bq"), nothing}}
    end
        function Radioactivity(m::Number=0.0u"Bq")
            m = correct_units(m, u"Bq")
            m = uconvert(u"Bq", m)
            return Radioactivity(m)
        end

    struct AbsorbedDose{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"Gy"), Unitful.FreeUnits{B, dimension(u"Gy"), nothing}}
    end
        function AbsorbedDose(m::Number=0.0u"Gy")
            m = correct_units(m, u"Gy")
            m = uconvert(u"Gy", m)
            return AbsorbedDose(m)
        end

    struct EquivalentDose{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"Sv"), Unitful.FreeUnits{B, dimension(u"Sv"), nothing}}
    end
        function EquivalentDose(m::Number=0.0u"Sv")
            m = correct_units(m, u"Sv")
            m = uconvert(u"Sv", m)
            return EquivalentDose(m)
        end

    struct CatalyticActivity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"kat"), Unitful.FreeUnits{B, dimension(u"kat"), nothing}}
    end
        function CatalyticActivity(m::Number=0.0u"kat")
            m = correct_units(m, u"kat")
            return CatalyticActivity(m)
        end

    struct Speed{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m/s"), Unitful.FreeUnits{B, dimension(u"m/s"), nothing}}
    end
        function Speed(m::Number=0.0u"m/s")
            m = correct_units(m, u"m/s")
            return Speed(m)
        end

    struct FrequencyDrift{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"Hz/s"), Unitful.FreeUnits{B, dimension(u"Hz/s"), nothing}}
    end
        function FrequencyDrift(m::Number=0.0u"Hz/s")
            m = correct_units(m, u"Hz/s")
            return FrequencyDrift(m)
        end

    struct VolumetricFlow{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m^3/s"), Unitful.FreeUnits{B, dimension(u"m^3/s"), nothing}}
    end
        function VolumetricFlow(m::Number=0.0u"m^3/s")
            m = correct_units(m, u"m^3/s")
            return VolumetricFlow(m)
        end

    struct Area{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m^2"), Unitful.FreeUnits{B, dimension(u"m^2"), nothing}}
    end
        function Area(m::Number=0.0u"m^2")
            m = correct_units(m, u"m^2")
            return Area(m)
        end

    struct Volume{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m^3"), Unitful.FreeUnits{B, dimension(u"m^3"), nothing}}
    end
        function Volume(m::Number=0.0u"m^3")
            m = correct_units(m, u"m^3")
            return Volume(m)
        end

    struct Wavenumber{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m^-1"), Unitful.FreeUnits{B, dimension(u"m^-1"), nothing}}
    end
        function Wavenumber(m::Number=0.0u"m^-1")
            m = correct_units(m, u"m^-1")
            return Wavenumber(m)
        end

    struct LinearDensity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"kg/m"), Unitful.FreeUnits{B, dimension(u"kg/m"), nothing}}
    end
        function LinearDensity(m::Number=0.0u"kg/m")
            m = correct_units(m, u"kg/m")
            return LinearDensity(m)
        end

    struct AreaDensity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"kg/m^2"), Unitful.FreeUnits{B, dimension(u"kg/m^2"), nothing}}
    end
        function AreaDensity(m::Number=0.0u"kg/m^2")
            m = correct_units(m, u"kg/m^2")
            return AreaDensity(m)
        end

    struct Density{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"kg/m^3"), Unitful.FreeUnits{B, dimension(u"kg/m^3"), nothing}}
    end
        function Density(m::Number=0.0u"kg/m^3")
            m = correct_units(m, u"kg/m^3")
            return Density(m)
        end

    struct SpecificVolume{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m^3/kg"), Unitful.FreeUnits{B, dimension(u"m^3/kg"), nothing}}
    end
        function SpecificVolume(m::Number=0.0u"m^3/kg")
            m = correct_units(m, u"m^3/kg")
            return SpecificVolume(m)
        end

    struct Action{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"J*s"), Unitful.FreeUnits{B, dimension(u"J*s"), nothing}}
    end
        function Action(m::Number=0.0u"J*s")
            m = correct_units(m, u"J*s")
            return Action(m)
        end

    struct SpecificEnergy{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"J/kg"), Unitful.FreeUnits{B, dimension(u"J/kg"), nothing}}
    end
        function SpecificEnergy(m::Number=0.0u"J/kg")
            m = correct_units(m, u"J/kg")
            return SpecificEnergy(m)
        end

    struct EnergyDensity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"J/m^3"), Unitful.FreeUnits{B, dimension(u"J/m^3"), nothing}}
    end
        function EnergyDensity(m::Number=0.0u"J/m^3")
            m = correct_units(m, u"J/m^3")
            m = uconvert(u"J/m^3", m)
            return EnergyDensity(m)
        end

    struct SurfaceTension{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"N/m"), Unitful.FreeUnits{B, dimension(u"N/m"), nothing}}
    end
        function SurfaceTension(m::Number=0.0u"N/m")
            m = correct_units(m, u"N/m")
            return SurfaceTension(m)
        end

    struct KinematicViscosity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m^2/s"), Unitful.FreeUnits{B, dimension(u"m^2/s"), nothing}}
    end
        function KinematicViscosity(m::Number=0.0u"m^2/s")
            m = correct_units(m, u"m^2/s")
            m = uconvert(u"m^2/s", m)
            return KinematicViscosity(m)
        end

    struct DynamicViscosity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"Pa*s"), Unitful.FreeUnits{B, dimension(u"Pa*s"), nothing}}
    end
        function DynamicViscosity(m::Number=0.0u"Pa*s")
            m = correct_units(m, u"Pa*s")
            return DynamicViscosity(m)
        end

    struct MassFLowRate{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"kg/s"), Unitful.FreeUnits{B, dimension(u"kg/s"), nothing}}
    end
        function MassFLowRate(m::Number=0.0u"kg/s")
            m = correct_units(m, u"kg/s")
            return MassFLowRate(m)
        end

    struct AbsorbedDoseRate{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"Gy/s"), Unitful.FreeUnits{B, dimension(u"Gy/s"), nothing}}
    end
        function AbsorbedDoseRate(m::Number=0.0u"Gy/s")
            m = correct_units(m, u"Gy/s")
            return AbsorbedDoseRate(m)
        end

    struct FuelEfficiency{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m/m^3"), Unitful.FreeUnits{B, dimension(u"m/m^3"), nothing}}
    end
        function FuelEfficiency(m::Number=0.0u"m/m^3")
            m = correct_units(m, u"m/m^3")
            return FuelEfficiency(m)
        end

    struct EnergyFluxDensity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"J/(m^2*s)"), Unitful.FreeUnits{B, dimension(u"J/(m^2*s)"), nothing}}
    end
        function EnergyFluxDensity(m::Number=0.0u"J/(m^2*s)")
            m = correct_units(m, u"J/(m^2*s)")
            return EnergyFluxDensity(m)
        end

    struct Compressibility{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"Pa^-1"), Unitful.FreeUnits{B, dimension(u"Pa^-1"), nothing}}
    end
        function Compressibility(m::Number=0.0u"Pa^-1")
            m = correct_units(m, u"Pa^-1")
            return Compressibility(m)
        end

    struct MomentOfInertia{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"kg*m^2"), Unitful.FreeUnits{B, dimension(u"kg*m^2"), nothing}}
    end
        function MomentOfInertia(m::Number=0.0u"kg*m^2")
            m = correct_units(m, u"kg*m^2")
            return MomentOfInertia(m)
        end

    struct SpecificAngularMomentum{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"N*m*s/kg"), Unitful.FreeUnits{B, dimension(u"N*m*s/kg"), nothing}}
    end
        function SpecificAngularMomentum(m::Number=0.0u"N*m*s/kg")
            m = correct_units(m, u"N*m*s/kg")
            return SpecificAngularMomentum(m)
        end

    struct SpectralPower{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"W/m"), Unitful.FreeUnits{B, dimension(u"W/m"), nothing}}
    end
        function SpectralPower(m::Number=0.0u"W/m")
            m = correct_units(m, u"W/m")
            return SpectralPower(m)
        end

    struct Irradiance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"W/m^2"), Unitful.FreeUnits{B, dimension(u"W/m^2"), nothing}}
    end
        function Irradiance(m::Number=0.0u"W/m^2")
            m = correct_units(m, u"W/m^2")
            m = uconvert(u"W/m^2", m)
            return Irradiance(m)
        end

    struct SpectralIrradiance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"W/m^3"), Unitful.FreeUnits{B, dimension(u"W/m^3"), nothing}}
    end
        function SpectralIrradiance(m::Number=0.0u"W/m^3")
            m = correct_units(m, u"W/m^3")
            return SpectralIrradiance(m)
        end

    struct RadiantIntensity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"W/sr"), Unitful.FreeUnits{B, dimension(u"W/sr"), nothing}}
    end
        function RadiantIntensity(m::Number=0.0u"W/sr")
            m = correct_units(m, u"W/sr")
            m = uconvert(u"W/sr", m)
            return RadiantIntensity(m)
        end

    struct SpectralIntensity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"W/(sr*m)"), Unitful.FreeUnits{B, dimension(u"W/(sr*m)"), nothing}}
    end
        function SpectralIntensity(m::Number=0.0u"W/(sr*m)")
            m = correct_units(m, u"W/(sr*m)")
            m = uconvert(u"W/(sr*m)", m)
            return SpectralIntensity(m)
        end

    struct Radiance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"W/(sr*m^2)"), Unitful.FreeUnits{B, dimension(u"W/(sr*m^2)"), nothing}}
    end
        function Radiance(m::Number=0.0u"W/(sr*m^2)")
            m = correct_units(m, u"W/(sr*m^2)")
            m = uconvert(u"W/(sr*m^2)", m)
            return Radiance(m)
        end

    struct SpectralRadiance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"W/(sr*m^3)"), Unitful.FreeUnits{B, dimension(u"W/(sr*m^3)"), nothing}}
    end
        function SpectralRadiance(m::Number=0.0u"W/(sr*m^3)")
            m = correct_units(m, u"W/(sr*m^3)")
            m = uconvert(u"W/(sr*m^3)", m)
            return SpectralRadiance(m)
        end

    struct RadiantExposure{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"J/m^2"), Unitful.FreeUnits{B, dimension(u"J/m^2"), nothing}}
    end
        function RadiantExposure(m::Number=0.0u"J/m^2")
            m = correct_units(m, u"J/m^2")
            m = uconvert(u"J/m^2", m)
            return RadiantExposure(m)
        end

    struct Molarity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"mol/m^3"), Unitful.FreeUnits{B, dimension(u"mol/m^3"), nothing}}
    end
        function Molarity(m::Number=0.0u"mol/m^3")
            m = correct_units(m, u"mol/m^3")
            return Molarity(m)
        end

        struct MolarVolume{A,B} <: PhysicsScalar where {A,B}
            m::Quantity{A, dimension(u"m^3/mol"), Unitful.FreeUnits{B, dimension(u"m^3/mol"), nothing}}
        end
            function MolarVolume(m::Number=0.0u"m^3/mol")
                m = correct_units(m, u"m^3/mol")

                return MolarVolume(m)
            end

    struct MolarHeatCapacity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"J/(K*mol)"), Unitful.FreeUnits{B, dimension(u"J/(K*mol)"), nothing}}
    end
        function MolarHeatCapacity(m::Number=0.0u"J/(K*mol)")
            m = correct_units(m, u"J/(K*mol)")
            return MolarHeatCapacity(m)
        end

    struct MolarEnergy{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"J/mol"), Unitful.FreeUnits{B, dimension(u"J/mol"), nothing}}
    end
        function MolarEnergy(m::Number=0.0u"J/mol")
            m = correct_units(m, u"J/mol")
            return MolarEnergy(m)
        end

    struct MolarConductivity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"S*m^2/mol"), Unitful.FreeUnits{B, dimension(u"S*m^2/mol"), nothing}}
    end
        function MolarConductivity(m::Number=0.0u"S*m^2/mol")
            m = correct_units(m, u"S*m^2/mol")
            return MolarConductivity(m)
        end

    struct Molality{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"mol/kg"), Unitful.FreeUnits{B, dimension(u"mol/kg"), nothing}}
    end
        function Molality(m::Number=0.0u"mol/kg")
            m = correct_units(m, u"mol/kg")
            return Molality(m)
        end

    struct MolarMass{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"kg/mol"), Unitful.FreeUnits{B, dimension(u"kg/mol"), nothing}}
    end
        function MolarMass(m::Number=0.0u"kg/mol")
            m = correct_units(m, u"kg/mol")
            return MolarMass(m)
        end

    struct CatalyticEfficiency{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m^3/(mol*s)"), Unitful.FreeUnits{B, dimension(u"m^3/(mol*s)"), nothing}}
    end
        function CatalyticEfficiency(m::Number=0.0u"m^3/(mol*s)")
            m = correct_units(m, u"m^3/(mol*s)")
            return CatalyticEfficiency(m)
        end

    struct VolumeChargeDensity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"C/m^3"), Unitful.FreeUnits{B, dimension(u"C/m^3"), nothing}}
    end
        function VolumeChargeDensity(m::Number=0.0u"C/m^3")
            m = correct_units(m, u"C/m^3")
            return VolumeChargeDensity(m)
        end

    struct AreaChargeDensity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"C/m^2"), Unitful.FreeUnits{B, dimension(u"C/m^2"), nothing}}
    end
        function AreaChargeDensity(m::Number=0.0u"C/m^2")
            m = correct_units(m, u"C/m^2")
            return AreaChargeDensity(m)
        end

    struct LinearChargeDensity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"C/m"), Unitful.FreeUnits{B, dimension(u"C/m"), nothing}}
    end
        function LinearChargeDensity(m::Number=0.0u"C/m")
            m = correct_units(m, u"C/m")
            return LinearChargeDensity(m)
        end

    struct Conductivity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"S/m"), Unitful.FreeUnits{B, dimension(u"S/m"), nothing}}
    end
        function Conductivity(m::Number=0.0u"S/m")
            m = correct_units(m, u"S/m")
            return Conductivity(m)
        end

    struct Permittivity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"F/m"), Unitful.FreeUnits{B, dimension(u"F/m"), nothing}}
    end
        function Permittivity(m::Number=0.0u"F/m")
            m = correct_units(m, u"F/m")
            return Permittivity(m)
        end

    struct MagneticPermittivity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"H/m"), Unitful.FreeUnits{B, dimension(u"H/m"), nothing}}
    end
        function MagneticPermittivity(m::Number=0.0u"H/m")
            m = correct_units(m, u"H/m")
            return MagneticPermittivity(m)
        end

    struct Exposure{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"C/kg"), Unitful.FreeUnits{B, dimension(u"C/kg"), nothing}}
    end
        function Exposure(m::Number=0.0u"C/kg")
            m = correct_units(m, u"C/kg")
            return Exposure(m)
        end

    struct Resistivity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"Ω*m"), Unitful.FreeUnits{B, dimension(u"Ω*m"), nothing}}
    end
        function Resistivity(m::Number=0.0u"Ω*m")
            m = correct_units(m, u"Ω*m")
            return Resistivity(m)
        end

    struct ElectronMobility{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m^2/(V*s)"), Unitful.FreeUnits{B, dimension(u"m^2/(V*s)"), nothing}}
    end
        function ElectronMobility(m::Number=0.0u"m^2/(V*s)")
            m = correct_units(m, u"m^2/(V*s)")
            return ElectronMobility(m)
        end

    struct MagneticReluctance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"H^-1"), Unitful.FreeUnits{B, dimension(u"H^-1"), nothing}}
    end
        function MagneticReluctance(m::Number=0.0u"H^-1")
            m = correct_units(m, u"H^-1")
            return MagneticReluctance(m)
        end

    struct MagneticRrigidity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"T*m"), Unitful.FreeUnits{B, dimension(u"T*m"), nothing}}
    end
        function MagneticRrigidity(m::Number=0.0u"T*m")
            m = correct_units(m, u"T*m")
            return MagneticRrigidity(m)
        end

    struct MagnetomotiveForce{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"A*rad"), Unitful.FreeUnits{B, dimension(u"A*rad"), nothing}}
    end
        function MagnetomotiveForce(m::Number=0.0u"A*rad")
            m = correct_units(m, u"A*rad")
            m = uconvert(u"A*rad", m)
            return MagnetomotiveForce(m)
        end

    struct MagneticSusceptibility{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"m/H"), Unitful.FreeUnits{B, dimension(u"m/H"), nothing}}
    end
        function MagneticSusceptibility(m::Number=0.0u"m/H")
            m = correct_units(m, u"m/H")
            return MagneticSusceptibility(m)
        end

    struct LuminousEnergy{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"lm*s"), Unitful.FreeUnits{B, dimension(u"lm*s"), nothing}}
    end
        function LuminousEnergy(m::Number=0.0u"lm*s")
            m = correct_units(m, u"lm*s")
            return LuminousEnergy(m)
        end

    struct LuminousExposure{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"lx*s"), Unitful.FreeUnits{B, dimension(u"lx*s"), nothing}}
    end
        function LuminousExposure(m::Number=0.0u"lx*s")
            m = correct_units(m, u"lx*s")
            return LuminousExposure(m)
        end

    struct Luminance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"cd/m^2"), Unitful.FreeUnits{B, dimension(u"cd/m^2"), nothing}}
    end
        function Luminance(m::Number=0.0u"cd/m^2")
            m = correct_units(m, u"cd/m^2")
            m = uconvert(u"cd/m^2", m)
            return Luminance(m)
        end

    struct LuminousEfficacy{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"lm/W"), Unitful.FreeUnits{B, dimension(u"lm/W"), nothing}}
    end
        function LuminousEfficacy(m::Number=0.0u"lm/W")
            m = correct_units(m, u"lm/W")
            return LuminousEfficacy(m)
        end

    struct HeatCapacity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"J/K"), Unitful.FreeUnits{B, dimension(u"J/K"), nothing}}
    end
        function HeatCapacity(m::Number=0.0u"J/K")
            m = correct_units(m, u"J/K")
            return HeatCapacity(m)
        end

    struct SpecificHeatCapacity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"J/(K*kg)"), Unitful.FreeUnits{B, dimension(u"J/(K*kg)"), nothing}}
    end
        function SpecificHeatCapacity(m::Number=0.0u"J/(K*kg)")
            m = correct_units(m, u"J/(K*kg)")
            return SpecificHeatCapacity(m)
        end

    struct ThermalConductivity{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"W/(m*K)"), Unitful.FreeUnits{B, dimension(u"W/(m*K)"), nothing}}
    end
        function ThermalConductivity(m::Number=0.0u"W/(m*K)")
            m = correct_units(m, u"W/(m*K)")
            return ThermalConductivity(m)
        end

    struct ThermalResistance{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"K/W"), Unitful.FreeUnits{B, dimension(u"K/W"), nothing}}
    end
        function ThermalResistance(m::Number=0.0u"K/W")
            m = correct_units(m, u"K/W")
            return ThermalResistance(m)
        end

    struct ThermalExpansionCoefficient{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"K^-1"), Unitful.FreeUnits{B, dimension(u"K^-1"), nothing}}
    end
        function ThermalExpansionCoefficient(m::Number=0.0u"K^-1")
            m = correct_units(m, u"K^-1")
            return ThermalExpansionCoefficient(m)
        end

    struct TemperatureGradient{A,B} <: PhysicsScalar where {A,B}
        m::Quantity{A, dimension(u"K/m"), Unitful.FreeUnits{B, dimension(u"K/m"), nothing}}
    end
        function TemperatureGradient(m::Number=0.0u"K/m")
            m = correct_units(m, u"K/m")
            return TemperatureGradient(m)
        end
