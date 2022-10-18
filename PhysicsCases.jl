function PhysicsVector(x::Number, y::Number, z::Number)
    if dimension(x) == dimension(y) == dimension(z)
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
        else;  x, y, z = ps_strip(x, y, z); return GeneralVector(x, y, z)
        end
    end
end
PhysicsVector( (x, y, z) ) = PhysicsVector(x, y, z)

function PhysicsScalar(m::Number)
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
    else; m = ps_strip(m);                  return GeneralScalar(m)
    end
end
    PhysicsScalar(PS::PhysicsScalar) = PhysicsScalar(PS.m)