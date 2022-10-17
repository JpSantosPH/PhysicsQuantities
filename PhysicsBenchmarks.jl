using BenchmarkTools

@benchmark [Acceleration(1,2,3) * Time(i) for i in 1:100]
    # Memory estimate: 2.50 KiB, allocs estimate: 1.
@benchmark [Length(i)/Time(i) for i in 1:100]
    # Memory estimate: 896 bytes, allocs estimate: 1.
@benchmark [Length(1)/Time(i)^2 for i in 1:100]
    # Memory estimate: 896 bytes, allocs estimate: 1.
@benchmark [kinetic_energy(Mass(10))(Speed(i)) for i in 1:100]
    # Memory estimate: 896 bytes, allocs estimate: 1.
@benchmark [kinetic_energy(Mass(10))(Velocity(i)) for i in 1:100]
    # Memory estimate: 896 bytes, allocs estimate: 1.
@benchmark [ElectricFieldStrength(Charge(4u"nC"))(Length(i)) for i in 1:100]
    # Memory estimate: 896 bytes, allocs estimate: 1.
@benchmark [ElectricFieldStrength(Charge(4u"nC"))(Position(i)) for i in 1:100]
    # Memory estimate: 2.50 KiB, allocs estimate: 1.