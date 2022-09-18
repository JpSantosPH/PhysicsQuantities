vector_dict = Dict(
    typeof(dimension(u"m")) => Position,
    typeof(dimension(u"m/s")) => Velocity,
    typeof(dimension(u"m/s^2")) => Acceleration,
)

function (type::typeof(dimension(u"m/s")))(x::T, y::T, z::T) where {T<:Quantity}
    return Velocity(x, y, z)
end


scalar_dict = Dict(
    dimension(u"s") => Time,
    dimension(u"m") => Length,
    dimension(u"kg") => Mass,
    dimension(u"A") => Current,
    dimension(u"K") => Temperature,
    dimension(u"m/s") => Speed,
    dimension(u"Hz") => Frequency
)