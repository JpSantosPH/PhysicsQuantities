function ElectricField(q::Charge)
    E(r::Position) = ElectricField((1/(4π*(8.8541878128e-12u"F*m^-1"))) * (q/r^2) * unitvec(r))
    E(r::Length) = uconvert(u"N/C",(1/(4π*(8.8541878128e-12u"F*m^-1"))) * (q/r^2))
    return E
end

function ElectricField(q::Quantity)
    if dimension(q) == dimension(u"C")
        return ElectricField(Charge(q))
    end
end

function kinetic_energy(m::Mass)
    KE(v::Velocity) = 1/2 * m * v^2
    KE(v::Speed) = 1/2 * m * v^2
end

function my_electric_field(q::Quantity)
    E(r::Vector) = (1/(4π*(8.8541878128e-12u"F*m^-1"))) * (q/(r⋅r)) * (r ./norm(r))
    E(r::Quantity) = uconvert(u"N/C",(1/(4π*(8.8541878128e-12u"F*m^-1"))) * (q/r^2))
    return E
end