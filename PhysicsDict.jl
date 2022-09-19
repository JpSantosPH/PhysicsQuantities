vector_dict = Dict(
    typeof(dimension(u"m")) => Position,
    typeof(dimension(u"N")) => Force,
    
    typeof(dimension(u"m/s")) => Velocity,
    typeof(dimension(u"m/s^2")) => Acceleration,
)
### Named units derived from SI base units ###
    function (dimension_type::typeof(dimension(u"m")))(x::T, y::T, z::T) where {T<:Quantity}
        return Position(x, y, z)
    end
    function (dimension_type::typeof(dimension(u"N")))(x::T, y::T, z::T) where {T<:Quantity}
        return Force(x, y, z)
    end

### Kinematic SI derived units ###
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

    typeof(dimension(u"Hz")) => Frequency,
    typeof(dimension(u"rad")) => Angle,
    typeof(dimension(u"kPa")) => Pressure,
    typeof(dimension(u"J")) => Energy,
    typeof(dimension(u"W")) => Power,

    typeof(dimension(u"m/s")) => Speed
)
### SI base units ###
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

### Named units derived from SI base units ###
    function (dimension_type::typeof(dimension(u"Hz")))(magnitude::Quantity)
        return Frequency(magnitude)
    end
    function (dimension_type::typeof(dimension(u"rad")))(magnitude::Quantity)
        return Angle(magnitude)
    end
    function (dimension_type::typeof(dimension(u"J")))(magnitude::Quantity)
        return Energy(magnitude)
    end

### Kinematic SI derived units ###
    function (dimension_type::typeof(dimension(u"m/s")))(magnitude::Quantity)
        return Speed(magnitude)
    end