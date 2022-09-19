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
    typeof(dimension(u"mol")) => Substance,
    typeof(dimension(u"cd")) => Luminous,

    typeof(dimension(u"Hz")) => Frequency,
    typeof(dimension(u"rad")) => Angle,
    typeof(dimension(u"kPa")) => Pressure,
    typeof(dimension(u"J")) => Energy,
    typeof(dimension(u"W")) => Power,
    typeof(dimension(u"C")) => Charge,
    typeof(dimension(u"V")) => Voltage,
    typeof(dimension(u"F")) => Capacitance,
    typeof(dimension(u"Ω")) => Resistance,
    typeof(dimension(u"S")) => Conductance,
    typeof(dimension(u"Wb")) => MagneticFlux,
    typeof(dimension(u"H")) => Inductance,

    typeof(dimension(u"m/s")) => Speed
)
### SI base units ###
    function (dimension_type::typeof(dimension(u"s")))(m::Quantity)
        return Time(m)
    end
    function (dimension_type::typeof(dimension(u"m")))(m::Quantity)
        return Length(m)
    end
    function (dimension_type::typeof(dimension(u"kg")))(m::Quantity)
        return Mass(m)
    end
    function (dimension_type::typeof(dimension(u"A")))(m::Quantity)
        return Current(m)
    end
    function (dimension_type::typeof(dimension(u"K")))(m::Quantity)
        return Temperature(m)
    end
    function (dimension_type::typeof(dimension(u"mol")))(m::Quantity)
        return Substance(m)
    end
    function (dimension_type::typeof(dimension(u"cd")))(m::Quantity)
        return Luminous(m)
    end

### Named units derived from SI base units ###
    function (dimension_type::typeof(dimension(u"Hz")))(m::Quantity)
        return Frequency(m)
    end
    function (dimension_type::typeof(dimension(u"rad")))(m::Quantity)
        return Angle(m)
    end
    function (dimension_type::typeof(dimension(u"kPa")))(m::Quantity)
        return Pressure(m)
    end
    function (dimension_type::typeof(dimension(u"J")))(m::Quantity)
        return Energy(m)
    end
    function (dimension_type::typeof(dimension(u"W")))(m::Quantity)
        return Power(m)
    end
    function (dimension_type::typeof(dimension(u"C")))(m::Quantity)
        return Charge(m)
    end
    function (dimension_type::typeof(dimension(u"V")))(m::Quantity)
        return Voltage(m)
    end
    function (dimension_type::typeof(dimension(u"F")))(m::Quantity)
        return Capacitance(m)
    end
    function (dimension_type::typeof(dimension(u"Ω")))(m::Quantity)
        return Resistance(m)
    end
    function (dimension_type::typeof(dimension(u"S")))(m::Quantity)
        return Conductance(m)
    end
    function (dimension_type::typeof(dimension(u"Wb")))(m::Quantity)
        return MagneticFlux(m)
    end
    function (dimension_type::typeof(dimension(u"H")))(m::Quantity)
        return Inductance(m)
    end

### Kinematic SI derived units ###
    function (dimension_type::typeof(dimension(u"m/s")))(m::Quantity)
        return Speed(m)
    end