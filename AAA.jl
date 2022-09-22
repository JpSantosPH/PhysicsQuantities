using BenchmarkTools

function kinetic_energy(m::Mass, v::Velocity)
    return 1/2 * m * v^2    
end

function electric_field(q::Charge)
    return E(r::Length) = uconvert(u"N/C",(1/(4π*(8.8541878128e-12u"F*m^-1"))) * (q/r^2))
end

function electric_field_2(q::Quantity)
    return E(r::Quantity) = PhysicsScalar(uconvert(u"N/C",(1/(4π*(8.8541878128e-12u"F*m^-1"))) * (q/r^2)))
end

@benchmark [kinetic_energy(Mass(i), Velocity(i)) for i in 1:100]

[kinetic_energy(Mass(i), Velocity(i)) for i in 1:10]

@benchmark [ElectricField(Charge(i))(Position(i)) for i in 1:10]

@benchmark [electric_field_2(i*u"nC")(i*u"m") for i in 1:10]

@benchmark [ElectricField(Charge(i))(Position(i)) for i in 1:10]


[electric_field(Charge(i),Length(i)) for i in 1:10]

@benchmark [Length(i)^i for i in 1:10]

@benchmark [(i * u"m")^2 for i in 1:10]