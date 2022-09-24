using BenchmarkTools

### Base Julia ###
    @benchmark [[1u"m/s^2", 2u"m/s^2", 3u"m/s^2"] .* i*u"s" for i in 1:1000]
        # Time  (mean ± σ):   153.382 μs ± 195.937 μs
        # Memory estimate: 242.31 KiB, allocs estimate: 3001.

    @benchmark [(1u"m")/(i*u"s") for i in 1:10000]
        # Time  (mean ± σ):   43.568 μs ± 142.308 μs
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [(1u"m")/((i*u"s")^2) for i in 1:10000]
        # Time  (mean ± σ):   45.247 μs ± 147.801 μs
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [1/2 * 10u"kg" * (i*u"m/s")^2 for i in 1:10000]
        # Time  (mean ± σ):   33.340 μs ± 120.274 μs
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [my_electric_field(4u"nC")(i*u"m") for i in 1:1000]
        # Time  (mean ± σ):   2.898 μs ±  10.503 μs
        # Memory estimate: 7.94 KiB, allocs estimate: 1.

    @benchmark [my_electric_field(4u"nC")([i*u"m", 0u"m", 0u"m"]) for i in 1:1000]
        # Time  (mean ± σ):   196.312 μs ± 263.195 μs
        # Memory estimate: 242.31 KiB, allocs estimate: 3001.

### w/o auto convert ###
    @benchmark [PhysicsVector(Acceleration(1,2,3) * Time(i)) for i in 1:1000]
        # Time  (mean ± σ):   21.371 μs ±  44.728 μs
        # Memory estimate: 23.48 KiB, allocs estimate: 2.

    @benchmark [Acceleration(1,2,3) * Time(i) for i in 1:1000]
        # Time  (mean ± σ):   42.287 μs ± 99.229 μs
        # Memory estimate: 70.31 KiB, allocs estimate: 2999.

    @benchmark [PhysicsScalar(Length(1)/Time(i)) for i in 1:10000]
        # Time  (mean ± σ):   51.557 μs ± 199.992 μs
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [Length(1)/Time(i) for i in 1:10000]
        # Time  (mean ± σ):   40.000 μs ± 126.427 μs
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [PhysicsScalar(Length(1)/Time(i)^2) for i in 1:10000]
        # Time  (mean ± σ):   46.789 μs ± 159.342 μs
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [kinetic_energy(Mass(10))(Speed(i)) for i in 1:10000]
        # Time  (mean ± σ):   37.447 μs ± 132.310 μs
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [kinetic_energy(Mass(10))(Velocity(i)) for i in 1:10000]
        # Time  (mean ± σ):   34.758 μs ± 123.611 μs
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [PhysicsScalar(kinetic_energy(Mass(10))(Speed(i))) for i in 1:10000]
        # Time  (mean ± σ):   30.871 μs ± 113.300 μs
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [PhysicsScalar(kinetic_energy(Mass(10))(Velocity(i))) for i in 1:10000]
        # Time  (mean ± σ):   38.695 μs ± 137.350 μs
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [ElectricField(4u"nC")(Length(i)) for i in 1:1000]
        # Time  (mean ± σ):     2.092 μs ±   8.833 μs
        # Memory estimate: 7.94 KiB, allocs estimate: 1.

    @benchmark [ElectricField(4u"nC")(Position(i)) for i in 1:1000]
        # Time  (mean ± σ):   43.850 μs ± 92.302 μs
        # Memory estimate: 23.48 KiB, allocs estimate: 2.

### w/ auto convert ###
    @benchmark [PhysicsVector(Acceleration(1,2,3) * Time(i)) for i in 1:1000]
        # Time  (mean ± σ):   12.356 μs ±  30.553 μs
        # Memory estimate: 23.48 KiB, allocs estimate: 2.

    @benchmark [Acceleration(1,2,3) * Time(i) for i in 1:1000]
        # Time  (mean ± σ):   11.844 μs ±  27.937 μs
        # Memory estimate: 23.48 KiB, allocs estimate: 2.

    @benchmark [PhysicsScalar(Length(1)/Time(i)) for i in 1:10000]
        # Time  (mean ± σ):   32.620 μs ± 116.400 μs
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [Length(1)/Time(i) for i in 1:10000]
        # Time  (mean ± σ):   27.955 μs ± 94.058 μs #
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [PhysicsScalar(Length(1)/Time(i)^2) for i in 1:10000]
        # Time  (mean ± σ):   26.987 μs ± 94.951 μs #
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [Length(1)/Time(i)^2 for i in 1:10000]
        # Time  (mean ± σ):   26.375 μs ± 86.603 μs #
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [kinetic_energy(Mass(10))(Speed(i)) for i in 1:10000]
        # Time  (mean ± σ):   26.820 μs ± 103.198 μs
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [kinetic_energy(Mass(10))(Velocity(i)) for i in 1:10000]
        # Time  (mean ± σ):   27.091 μs ± 99.707 μs
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [PhysicsScalar(kinetic_energy(Mass(10))(Speed(i))) for i in 1:10000]
        # Time  (mean ± σ):   28.722 μs ± 105.998 μs
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [PhysicsScalar(kinetic_energy(Mass(10))(Velocity(i))) for i in 1:10000]
        # Time  (mean ± σ):   26.331 μs ± 102.381 μs
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [ElectricField(4u"nC")(Length(i)) for i in 1:1000]
        # Time  (mean ± σ):   2.706 μs ±  13.011 μs
        # Memory estimate: 7.94 KiB, allocs estimate: 1.

    @benchmark [ElectricField(4u"nC")(Position(i)) for i in 1:1000]
        # Time  (mean ± σ):   39.235 μs ± 51.262 μs#
        # Memory estimate: 23.48 KiB, allocs estimate: 2.

### w/ auto convert and PhysicsScalar ###
    @benchmark [PhysicsVector(Acceleration(1,2,3) * Time(i)) for i in 1:1000]
        # Time  (mean ± σ):   6.110 μs ±  18.120 μs
        # Memory estimate: 23.48 KiB, allocs estimate: 2.

    @benchmark [Acceleration(1,2,3) * Time(i) for i in 1:1000]
        # Time  (mean ± σ):   5.527 μs ±  17.022 μs
        # Memory estimate: 23.48 KiB, allocs estimate: 2.

    @benchmark [PhysicsScalar(Length(1)/Time(i)) for i in 1:10000]
        # Time  (mean ± σ):   20.708 μs ± 73.106 μs
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [Length(1)/Time(i) for i in 1:10000]
        # Time  (mean ± σ):   20.663 μs ± 76.632 μs
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [PhysicsScalar(Length(1)/Time(i)^2) for i in 1:10000]
        # Time  (mean ± σ):   95.200 μs ± 121.204 μs
        # Memory estimate: 234.41 KiB, allocs estimate: 10001.

    @benchmark [Length(1)/Time(i)^2 for i in 1:10000]
        # Time  (mean ± σ):   104.294 μs ± 123.875 μs
        # Memory estimate: 234.41 KiB, allocs estimate: 10001.

    @benchmark [kinetic_energy(Mass(10))(Speed(i)) for i in 1:10000]
        # Time  (mean ± σ):   25.756 μs ± 97.381 μs
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [kinetic_energy(Mass(10))(Velocity(i)) for i in 1:10000]
        # Time  (mean ± σ):   25.206 μs ± 85.181 μs
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [PhysicsScalar(kinetic_energy(Mass(10))(Speed(i))) for i in 1:10000]
        # Time  (mean ± σ):   26.595 μs ± 102.833 μs
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [PhysicsScalar(kinetic_energy(Mass(10))(Velocity(i))) for i in 1:10000]
        # Time  (mean ± σ):   26.832 μs ± 99.389 μs
        # Memory estimate: 78.17 KiB, allocs estimate: 2.

    @benchmark [ElectricField(4u"nC")(Length(i)) for i in 1:1000]
        # Time  (mean ± σ):     2.260 μs
        # Memory estimate: 7.94 KiB, allocs estimate: 1.

    @benchmark [ElectricField(4u"nC")(Position(i)) for i in 1:1000]
        # Time  (mean ± σ):   1.264 ms ± 348.767 μs
        # Memory estimate: 351.89 KiB, allocs estimate: 18009.

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