vector_dict = Dict(
    dimension(u"m") => Position,
    dimension(u"N") => Force,
    
    dimension(u"m/s") => Velocity,
    dimension(u"m/s^2") => Acceleration,

    dimension(u"N/C") => ElectricField
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

    dimension(u"m/s") => Speed
)