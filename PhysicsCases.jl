function physicstype(x::Number, y::Number, z::Number)
    if dimension(x) == dimension(y) == dimension(z)
        d = dimension(x)
        if     d == dimension(u"m");        return Position
        elseif d == dimension(u"N");        return Force
        elseif d == dimension(u"m/s");      return Velocity
        elseif d == dimension(u"m/s^2");    return Acceleration
        elseif d == dimension(u"m/s^3");    return Jerk
        elseif d == dimension(u"m/s^4");    return Snap
        elseif d == dimension(u"rad/s");    return AngularVelocity
        elseif d == dimension(u"rad/s^2");  return AngularAcceleration
        elseif d == dimension(u"kg*m/s");   return Momentum
        elseif d == dimension(u"N*m*s");    return AngularMomentum
        elseif d == dimension(u"N*m");      return Torque
        elseif d == dimension(u"C/m^2");    return ElectricDisplacementField
        elseif d == dimension(u"A/m^2");    return CurrentDensity
        elseif d == dimension(u"N/C");      return ElectricFieldStrength
        elseif d == dimension(u"A/m");      return MagneticFieldStrength
        elseif d == dimension(u"J/T");      return MagneticDipoleMoment
        elseif d == dimension(u"Wb/m");     return MagneticVectorPotential
        else                                return GeneralVector
        end
    end
end
    physicstype(PV::PhysicsVector) = physicstype(PV.x, PV.y, PV.z)
    physicstype((x, y, z)) = physicstype(x, y, z)

function physicstype(m::Number)
    d = dimension(m)
    u = unit(m)
    if     u == u"cd/m^2";                  return Luminance
    elseif u == u"lm";                      return LuminousFlux
    elseif u == u"Bq";                      return Radioactivity
    elseif u == u"Gy";                      return AbsorbedDose
    elseif u == u"Sv";                      return EquivalentDose
    elseif u == u"A*rad";                   return MagnetomotiveForce
    elseif u == u"J/m^2";                   return RadiantExposure
    elseif u == u"W/(sr*m^3)";              return SpectralRadiance
    elseif u == u"J/m^3";                   return EnergyDensity
    elseif u == u"W/(sr*m^2)";              return Radiance
    elseif u == u"W/m^2";                   return Irradiance
    elseif u == u"W/(sr*m)";                return SpectralIntensity
    elseif u == u"W/sr";                    return RadiantIntensity
    elseif u == u"m^2/s";                   return KinematicViscosity
    elseif u == u"rad" || u == u"°";        return Angle
    elseif d == dimension(u"s");            return Time
    elseif d == dimension(u"m");            return Length
    elseif d == dimension(u"kg");           return Mass
    elseif d == dimension(u"A");            return Current
    elseif d == dimension(u"K");            return Temperature
    elseif d == dimension(u"mol");          return Substance
    elseif d == dimension(u"cd");           return Luminous
    elseif d == dimension(u"kPa");          return Pressure
    elseif d == dimension(u"J");            return Energy
    elseif d == dimension(u"W");            return Power
    elseif d == dimension(u"C");            return Charge
    elseif d == dimension(u"V");            return Voltage
    elseif d == dimension(u"F");            return Capacitance
    elseif d == dimension(u"Ω");            return Resistance
    elseif d == dimension(u"S");            return Conductance
    elseif d == dimension(u"Wb");           return MagneticFlux
    elseif d == dimension(u"T");            return Induction
    elseif d == dimension(u"H");            return Inductance
    elseif d == dimension(u"lx");           return Illuminance
    elseif d == dimension(u"kat");          return CatalyticActivity
    elseif d == dimension(u"m/s");          return Speed
    elseif d == dimension(u"m^3/s");        return VolumetricFlow
    elseif d == dimension(u"Hz/s");         return FrequencyDrift
    elseif d == dimension(u"m^2");          return Area
    elseif d == dimension(u"m^3");          return Volume
    elseif d == dimension(u"m^-1");         return Wavenumber
    elseif d == dimension(u"kg/m");         return LinearDensity
    elseif d == dimension(u"kg/m^2");       return AreaDensity
    elseif d == dimension(u"kg/m^3");       return Density
    elseif d == dimension(u"m^3/kg");       return SpecificVolume
    elseif d == dimension(u"J*s");          return Action
    elseif d == dimension(u"J/kg");         return SpecificEnergy
    elseif d == dimension(u"N/m");          return SurfaceTension
    elseif d == dimension(u"Pa*s");         return DynamicViscosity
    elseif d == dimension(u"kg/s");         return MassFLowRate
    elseif d == dimension(u"Gy/s");         return AbsorbedDoseRate
    elseif d == dimension(u"m/m^3");        return FuelEfficiency
    elseif d == dimension(u"J/(m^2*s)");    return EnergyFluxDensity
    elseif d == dimension(u"Pa^-1");        return Compressibility
    elseif d == dimension(u"kg*m^2");       return MomentOfInertia
    elseif d == dimension(u"N*m*s/kg");     return SpecificAngularMomentum
    elseif d == dimension(u"W/m");          return SpectralPower
    elseif d == dimension(u"W/m^3");        return SpectralIrradiance
    elseif d == dimension(u"mol/m^3");      return Molarity
    elseif d == dimension(u"m^3/mol");      return MolarVolume
    elseif d == dimension(u"J/(K*mol)");    return MolarHeatCapacity
    elseif d == dimension(u"J/mol");        return MolarEnergy
    elseif d == dimension(u"S*m^2/mol");    return MolarConductivity
    elseif d == dimension(u"mol/kg");       return Molality
    elseif d == dimension(u"kg/mol");       return MolarMass
    elseif d == dimension(u"m^3/(mol*s)");  return CatalyticEfficiency
    elseif d == dimension(u"C/m^3");        return VolumeChargeDensity
    elseif d == dimension(u"C/m^2");        return AreaChargeDensity
    elseif d == dimension(u"C/m");          return LinearChargeDensity
    elseif d == dimension(u"S/m");          return Conductivity
    elseif d == dimension(u"F/m");          return Permittivity
    elseif d == dimension(u"H/m");          return MagneticPermittivity
    elseif d == dimension(u"C/kg");         return Exposure
    elseif d == dimension(u"Ω*m");          return Resistivity
    elseif d == dimension(u"m^2/(V*s)");    return ElectronMobility
    elseif d == dimension(u"H^-1");         return MagneticReluctance
    elseif d == dimension(u"T*m");          return MagneticRrigidity
    elseif d == dimension(u"m/H");          return MagneticSusceptibility
    elseif d == dimension(u"lm*s");         return LuminousEnergy
    elseif d == dimension(u"lx*s");         return LuminousExposure
    elseif d == dimension(u"lm/W");         return LuminousEfficacy
    elseif d == dimension(u"J/K");          return HeatCapacity
    elseif d == dimension(u"J/(K*kg)");     return SpecificHeatCapacity
    elseif d == dimension(u"W/(m*K)");      return ThermalConductivity
    elseif d == dimension(u"K/W");          return ThermalResistance
    elseif d == dimension(u"K^-1");         return ThermalExpansionCoefficient
    elseif d == dimension(u"K/m");          return TemperatureGradient
    elseif d == dimension(u"Hz");           return Frequency
    else                                    return GeneralScalar
    end
end
    physicstype(PS::PhysicsScalar) = physicstype(PS.m)

function physics(x::Number, y::Number, z::Number)
    d = dimension(x)
    if     d == dimension(u"m");        return Position(x, y, z)
    elseif d == dimension(u"N");        return Force(x, y, z)
    elseif d == dimension(u"m/s");      return Velocity(x, y, z)
    elseif d == dimension(u"m/s^2");    return Acceleration(x, y, z)
    elseif d == dimension(u"m/s^3");    return Jerk(x, y, z)
    elseif d == dimension(u"m/s^4");    return Snap(x, y, z)
    elseif d == dimension(u"rad/s");    return AngularVelocity(x, y, z)
    elseif d == dimension(u"rad/s^2");  return AngularAcceleration(x, y, z)
    elseif d == dimension(u"kg*m/s");   return Momentum(x, y, z)
    elseif d == dimension(u"N*m*s");    return AngularMomentum(x, y, z)
    elseif d == dimension(u"N*m");      return Torque(x, y, z)
    elseif d == dimension(u"C/m^2");    return ElectricDisplacementField(x, y, z)
    elseif d == dimension(u"A/m^2");    return CurrentDensity(x, y, z)
    elseif d == dimension(u"N/C");      return ElectricFieldStrength(x, y, z)
    elseif d == dimension(u"A/m");      return MagneticFieldStrength(x, y, z)
    elseif d == dimension(u"J/T");      return MagneticDipoleMoment(x, y, z)
    elseif d == dimension(u"Wb/m");     return MagneticVectorPotential(x, y, z)
    else;                               return GeneralVector(x, y, z)
    end
end
    physics(PV::PhysicsVector) = physics(PV.x, PV.y, PV.z)
    physics((x, y, z)) = physics(x, y, z)

function physics(m::Number)
    d = dimension(m)
    u = unit(m)
    if     u == u"cd/m^2";                  return Luminance(m)
    elseif u == u"lm";                      return LuminousFlux(m)
    elseif u == u"Bq";                      return Radioactivity(m)
    elseif u == u"Gy";                      return AbsorbedDose(m)
    elseif u == u"Sv";                      return EquivalentDose(m)
    elseif u == u"A*rad";                   return MagnetomotiveForce(m)
    elseif u == u"J/m^2";                   return RadiantExposure(m)
    elseif u == u"W/(sr*m^3)";              return SpectralRadiance(m)
    elseif u == u"J/m^3";                   return EnergyDensity(m)
    elseif u == u"W/(sr*m^2)";              return Radiance(m)
    elseif u == u"W/m^2";                   return Irradiance(m)
    elseif u == u"W/(sr*m)";                return SpectralIntensity(m)
    elseif u == u"W/sr";                    return RadiantIntensity(m)
    elseif u == u"m^2/s";                   return KinematicViscosity(m)
    elseif u == u"rad" || u == u"°";        return Angle(m)
    elseif d == dimension(u"s");            return Time(m)
    elseif d == dimension(u"m");            return Length(m)
    elseif d == dimension(u"kg");           return Mass(m)
    elseif d == dimension(u"A");            return Current(m)
    elseif d == dimension(u"K");            return Temperature(m)
    elseif d == dimension(u"mol");          return Substance(m)
    elseif d == dimension(u"cd");           return Luminous(m)
    elseif d == dimension(u"kPa");          return Pressure(m)
    elseif d == dimension(u"J");            return Energy(m)
    elseif d == dimension(u"W");            return Power(m)
    elseif d == dimension(u"C");            return Charge(m)
    elseif d == dimension(u"V");            return Voltage(m)
    elseif d == dimension(u"F");            return Capacitance(m)
    elseif d == dimension(u"Ω");            return Resistance(m)
    elseif d == dimension(u"S");            return Conductance(m)
    elseif d == dimension(u"Wb");           return MagneticFlux(m)
    elseif d == dimension(u"T");            return Induction(m)
    elseif d == dimension(u"H");            return Inductance(m)
    elseif d == dimension(u"lx");           return Illuminance(m)
    elseif d == dimension(u"kat");          return CatalyticActivity(m)
    elseif d == dimension(u"m/s");          return Speed(m)
    elseif d == dimension(u"m^3/s");        return VolumetricFlow(m)
    elseif d == dimension(u"Hz/s");         return FrequencyDrift(m)
    elseif d == dimension(u"m^2");          return Area(m)
    elseif d == dimension(u"m^3");          return Volume(m)
    elseif d == dimension(u"m^-1");         return Wavenumber(m)
    elseif d == dimension(u"kg/m");         return LinearDensity(m)
    elseif d == dimension(u"kg/m^2");       return AreaDensity(m)
    elseif d == dimension(u"kg/m^3");       return Density(m)
    elseif d == dimension(u"m^3/kg");       return SpecificVolume(m)
    elseif d == dimension(u"J*s");          return Action(m)
    elseif d == dimension(u"J/kg");         return SpecificEnergy(m)
    elseif d == dimension(u"N/m");          return SurfaceTension(m)
    elseif d == dimension(u"Pa*s");         return DynamicViscosity(m)
    elseif d == dimension(u"kg/s");         return MassFLowRate(m)
    elseif d == dimension(u"Gy/s");         return AbsorbedDoseRate(m)
    elseif d == dimension(u"m/m^3");        return FuelEfficiency(m)
    elseif d == dimension(u"J/(m^2*s)");    return EnergyFluxDensity(m)
    elseif d == dimension(u"Pa^-1");        return Compressibility(m)
    elseif d == dimension(u"kg*m^2");       return MomentOfInertia(m)
    elseif d == dimension(u"N*m*s/kg");     return SpecificAngularMomentum(m)
    elseif d == dimension(u"W/m");          return SpectralPower(m)
    elseif d == dimension(u"W/m^3");        return SpectralIrradiance(m)
    elseif d == dimension(u"mol/m^3");      return Molarity(m)
    elseif d == dimension(u"m^3/mol");      return MolarVolume(m)
    elseif d == dimension(u"J/(K*mol)");    return MolarHeatCapacity(m)
    elseif d == dimension(u"J/mol");        return MolarEnergy(m)
    elseif d == dimension(u"S*m^2/mol");    return MolarConductivity(m)
    elseif d == dimension(u"mol/kg");       return Molality(m)
    elseif d == dimension(u"kg/mol");       return MolarMass(m)
    elseif d == dimension(u"m^3/(mol*s)");  return CatalyticEfficiency(m)
    elseif d == dimension(u"C/m^3");        return VolumeChargeDensity(m)
    elseif d == dimension(u"C/m^2");        return AreaChargeDensity(m)
    elseif d == dimension(u"C/m");          return LinearChargeDensity(m)
    elseif d == dimension(u"S/m");          return Conductivity(m)
    elseif d == dimension(u"F/m");          return Permittivity(m)
    elseif d == dimension(u"H/m");          return MagneticPermittivity(m)
    elseif d == dimension(u"C/kg");         return Exposure(m)
    elseif d == dimension(u"Ω*m");          return Resistivity(m)
    elseif d == dimension(u"m^2/(V*s)");    return ElectronMobility(m)
    elseif d == dimension(u"H^-1");         return MagneticReluctance(m)
    elseif d == dimension(u"T*m");          return MagneticRrigidity(m)
    elseif d == dimension(u"m/H");          return MagneticSusceptibility(m)
    elseif d == dimension(u"lm*s");         return LuminousEnergy(m)
    elseif d == dimension(u"lx*s");         return LuminousExposure(m)
    elseif d == dimension(u"lm/W");         return LuminousEfficacy(m)
    elseif d == dimension(u"J/K");          return HeatCapacity(m)
    elseif d == dimension(u"J/(K*kg)");     return SpecificHeatCapacity(m)
    elseif d == dimension(u"W/(m*K)");      return ThermalConductivity(m)
    elseif d == dimension(u"K/W");          return ThermalResistance(m)
    elseif d == dimension(u"K^-1");         return ThermalExpansionCoefficient(m)
    elseif d == dimension(u"K/m");          return TemperatureGradient(m)
    elseif d == dimension(u"Hz");           return Frequency(m)
    else                                    return GeneralScalar(m)
    end
end
    physics(PS::PhysicsScalar) = physics(PS.m)
