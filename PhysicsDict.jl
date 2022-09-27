vector_dict = Dict(
    dimension(u"m") => Position,
    dimension(u"N") => Force,
    
    dimension(u"m/s") => Velocity,
    dimension(u"m/s^2") => Acceleration,
    dimension(u"m/s^3") => Jerk,
    dimension(u"m/s^4") => Snap,
    dimension(u"rad/s") => AngularVelocity,
    dimension(u"rad/s^2") => AngularAcceleration,
    dimension(u"kg*m/s") => Momentum,
    dimension(u"N*m*s") => AngularMomentum,
    dimension(u"N*m") => Torque,

    dimension(u"N/C") => ElectricFieldStrength,
)

scalar_dict = Dict(
    dimension(u"s") => Time,
    dimension(u"m") => Length,
    dimension(u"kg") => Mass,
    dimension(u"A") => Current,
    dimension(u"K") => Temperature,
    dimension(u"mol") => Substance,
    dimension(u"cd") => Luminous,
    dimension(u"Hz") => Frequency,
    dimension(u"rad") => Angle,
    dimension(u"kPa") => Pressure,
    dimension(u"J") => Energy,
    dimension(u"W") => Power,
    dimension(u"C") => Charge,
    dimension(u"V") => Voltage,
    dimension(u"F") => Capacitance,
    dimension(u"Ω") => Resistance,
    dimension(u"S") => Conductance,
    dimension(u"Wb") => MagneticFlux,
    dimension(u"T") => Induction,
    dimension(u"H") => Inductance,
    dimension(u"lm") => LuminousFlux,
    dimension(u"lx") => Illuminance,
    dimension(u"Bq") => Radioactivity,
    dimension(u"Gy") => AbsorbedDose,
    dimension(u"Sv") => EquivalentDose,
    dimension(u"kat") => CatalyticActivity,
    dimension(u"m/s") => Speed,
    dimension(u"Hz/s") => FrequencyDrift,
    dimension(u"m^3/s") => VolumetricFlow,
    dimension(u"m^2") => Area,
    dimension(u"m^3") => Volume,
    dimension(u"m^-1") => Wavenumber,
    dimension(u"kg/m") => LinearDensity,
    dimension(u"kg/m^2") => AreaDensity,
    dimension(u"kg/m^3") => Density,
    dimension(u"m^3/kg") => SpecificVolume,
    dimension(u"J*s") => Action,
)