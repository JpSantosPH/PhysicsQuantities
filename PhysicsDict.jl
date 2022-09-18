vector_dict = Dict(
    dimension(u"m") => Position,
    dimension(u"m/s") => Velocity,
    dimension(u"m/s^2") => Acceleration,
)

scalar_dict = Dict(
    dimension(u"s") => Time,
    dimension(u"m") => Length,
    dimension(u"kg") => Mass,
    dimension(u"A") => Current,
    dimension(u"m/s") => Speed,
    dimension(u"Hz") => Frequency
)