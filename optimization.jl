using BenchmarkTools

@benchmark [[1u"m/s^2", 2u"m/s^2", 3u"m/s^2"] .* i*u"s" for i in 1:1000]
@benchmark [(1u"m")/(i*u"s") for i in 1:10000]
@benchmark [(1u"m")/((i*u"s")^2) for i in 1:10000]
@benchmark [1/2 * 10u"kg" * (i*u"m/s")^2 for i in 1:10000]
@benchmark [my_electric_field(4u"nC")(i*u"m") for i in 1:1000]
@benchmark [my_electric_field(4u"nC")([i*u"m", 0u"m", 0u"m"]) for i in 1:1000]



@benchmark [PhysicsVector(Acceleration(1,2,3) * Time(i)) for i in 1:1000]
@benchmark [Acceleration(1,2,3) * Time(i) for i in 1:1000]
@benchmark [PhysicsScalar(Length(1)/Time(i)) for i in 1:10000]
@benchmark [Length(1)/Time(i) for i in 1:10000]
@benchmark [PhysicsScalar(Length(1)/Time(i)^2) for i in 1:10000]
@benchmark [Length(1)/Time(i)^2 for i in 1:10000]
@benchmark [kinetic_energy(Mass(10))(Speed(i)) for i in 1:10000]
@benchmark [kinetic_energy(Mass(10))(Velocity(i)) for i in 1:10000]
@benchmark [PhysicsScalar(kinetic_energy(Mass(10))(Speed(i))) for i in 1:10000]
@benchmark [PhysicsScalar(kinetic_energy(Mass(10))(Velocity(i))) for i in 1:10000]
@benchmark [ElectricField(4u"nC")(Length(i)) for i in 1:1000]
@benchmark [ElectricField(4u"nC")(Position(i)) for i in 1:1000]