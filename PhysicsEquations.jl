function ElectricFieldStrength(q::Charge)
    EFS(r::Position) = ElectricFieldStrength((1/(4π*(8.8541878128e-12u"F*m^-1"))) * (q/r^2) * unitvec(r))
    EFS(r::Length) = uconvert(u"N/C",(1/(4π*(8.8541878128e-12u"F*m^-1"))) * (q/r^2))
    return EFS
end

function ElectricFieldStrength(q::Quantity)
    if dimension(q) == dimension(u"C")
        return ElectricFieldStrength(Charge(q))
    end
end

function kinetic_energy(m::Mass)
    KE(v::Velocity) = 1/2 * m * v^2
    KE(v::Speed) = 1/2 * m * v^2
    return KE
end

function my_electric_field(q::Quantity)
    E(r::Vector) = (1/(4π*(8.8541878128e-12u"F*m^-1"))) * (q/(r⋅r)) * (r ./norm(r))
    E(r::Quantity) = uconvert(u"N/C",(1/(4π*(8.8541878128e-12u"F*m^-1"))) * (q/r^2))
    return E
end