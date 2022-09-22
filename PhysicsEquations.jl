function ElectricField(q::Charge)
    E(r::Position) = (1/(4π*(8.8541878128e-12u"F*m^-1"))) * (q/r^2) * unitvec(r)
    E(r::Length) = uconvert(u"N/C",(1/(4π*(8.8541878128e-12u"F*m^-1"))) * (q/r^2))
    return E
end
function ElectricField(q::Quantity)
    if dimension(q) == dimension(u"C")
        return ElectricField(Charge(q))
    end
end