function PhysicsVector(x::T, y::T, z::T) where {T<:Number}
    d = dimension(x)
### Named units derived from SI base units ###
    if d == dimension(u"m")
        return Position(x, y, z)
    elseif d == dimension(u"N")
        return Force(x, y, z)
### Kinematic SI derived units ###
    elseif d == dimension(u"m/s")
        return Velocity(x, y, z)
    elseif d == dimension(u"m/s^2")
        return Acceleration(x, y, z)
    elseif d == dimension(u"N/C")
        return ElectricField(x, y, z)
    else
        return GeneralVector(x, y, z)
    end
end
function PhysicsVector( (x, y, z) )
    return PhysicsVector(x, y, z)
end

function PhysicsScalar(m::Number)
    d = dimension(m)
### SI base units ###
    if d == dimension(u"s")
        return Time(m)
    elseif d == dimension(u"m")
        return Length(m)
    elseif d == dimension(u"kg")
        return Mass(m)
    elseif d == dimension(u"A")
        return Current(m)
    elseif d == dimension(u"K")
        return Temperature(m)
    elseif d == dimension(u"mol")
        return Substance(m)
    elseif d == dimension(u"cd")
        return Luminous(m)
### Named units derived from SI base units ###
    elseif d == dimension(u"Hz")
        return Frequency(m)
    elseif unit(m) == unit(1.0u"rad")
        return Angle(m)
    elseif d == dimension(u"kPa")
        return Pressure(m)
    elseif d == dimension(u"J")
        return Energy(m)
    elseif d == dimension(u"W")
        return Power(m)
    elseif d == dimension(u"C")
        return Charge(m)
    elseif d == dimension(u"V")
        return Voltage(m)
    elseif d == dimension(u"F")
        return Capacitance(m)
    elseif d == dimension(u"Ω")
        return Resistance(m)
    elseif d == dimension(u"S")
        return Conductance(m)
    elseif d == dimension(u"Wb")
        return MagneticFlux(m)
    elseif d == dimension(u"H")
        return Inductance(m)
### Kinematic SI derived units ###
    elseif d == dimension(u"m/s")
        return Speed(m)
    else
        return m
    end
end
function PhysicsScalar(args)
    return PhysicsScalar(args...)
end