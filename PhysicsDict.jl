vector_dict = Dict(
    typeof(dimension(u"m")) => Position,
    typeof(dimension(u"m/s")) => Velocity,
    typeof(dimension(u"m/s^2")) => Acceleration,
)

function (dimension_type::typeof(dimension(u"m")))(x::T, y::T, z::T) where {T<:Quantity}
    return Position(x, y, z)
end
function (dimension_type::typeof(dimension(u"m/s")))(x::T, y::T, z::T) where {T<:Quantity}
    return Velocity(x, y, z)
end
function (dimension_type::typeof(dimension(u"m/s^2")))(x::T, y::T, z::T) where {T<:Quantity}
    return Acceleration(x, y, z)
end


scalar_dict = Dict(
    typeof(dimension(u"s")) => Time,
    typeof(dimension(u"m")) => Length,
    typeof(dimension(u"kg")) => Mass,
    typeof(dimension(u"A")) => Current,
    typeof(dimension(u"K")) => Temperature,
    typeof(dimension(u"m/s")) => Speed,
    typeof(dimension(u"Hz")) => Frequency
)
function (dimension_type::typeof(dimension(u"s")))(magnitude::Quantity)
    return Time(magnitude)
end
function (dimension_type::typeof(dimension(u"m")))(magnitude::Quantity)
    return Length(magnitude)
end
function (dimension_type::typeof(dimension(u"kg")))(magnitude::Quantity)
    return Mass(magnitude)
end
function (dimension_type::typeof(dimension(u"A")))(magnitude::Quantity)
    return Current(magnitude)
end
function (dimension_type::typeof(dimension(u"K")))(magnitude::Quantity)
    return Temperature(magnitude)
end
function (dimension_type::typeof(dimension(u"m/s")))(magnitude::Quantity)
    return Speed(magnitude)
end
function (dimension_type::typeof(dimension(u"Hz")))(magnitude::Quantity)
    return Frequency(magnitude)
end