using BenchmarkTools

### w/ and w/o auto constructor benchmarks ###
    ### Base Julia ###
        @benchmark [[1u"m/s^2", 2u"m/s^2", 3u"m/s^2"] .* i*u"s" for i in 1:1000]
            # Time  (mean ± σ):   153.382 μs ± 195.937 μs
            # Memory estimate: 242.31 KiB, allocs estimate: 3001.

        @benchmark [1u"m" / (i*u"s") for i in 1:10000]
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

        @benchmark [ElectricFieldStrength(4u"nC")(Length(i)) for i in 1:1000]
            # Time  (mean ± σ):     2.092 μs ±   8.833 μs
            # Memory estimate: 7.94 KiB, allocs estimate: 1.

        @benchmark [ElectricFieldStrength(4u"nC")(Position(i)) for i in 1:1000]
            # Time  (mean ± σ):   43.850 μs ± 92.302 μs
            # Memory estimate: 23.48 KiB, allocs estimate: 2.

    ### w/ auto convert ###
        @benchmark [Acceleration(1,2,3) * Time(i) for i in 1:1000]
            # Time  (mean ± σ):   11.844 μs ±  27.937 μs
            # Memory estimate: 23.48 KiB, allocs estimate: 2.

        @benchmark [Length(1)/Time(i) for i in 1:10000]
            # Time  (mean ± σ):   27.955 μs ± 94.058 μs #
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

        @benchmark [ElectricFieldStrength(4u"nC")(Length(i)) for i in 1:1000]
            # Time  (mean ± σ):   2.706 μs ±  13.011 μs
            # Memory estimate: 7.94 KiB, allocs estimate: 1.

        @benchmark [ElectricFieldStrength(4u"nC")(Position(i)) for i in 1:1000]
            # Time  (mean ± σ):   39.235 μs ± 51.262 μs#
            # Memory estimate: 23.48 KiB, allocs estimate: 2.
        1
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

        @benchmark [ElectricFieldStrength(4u"nC")(Length(i)) for i in 1:1000]
            # Time  (mean ± σ):     2.260 μs
            # Memory estimate: 7.94 KiB, allocs estimate: 1.

        @benchmark [ElectricFieldStrength(4u"nC")(Position(i)) for i in 1:1000]
            # Time  (mean ± σ):   1.264 ms ± 348.767 μs
            # Memory estimate: 351.89 KiB, allocs estimate: 18009.

##############################################

### w/ and w/o dimension constructor benchmarks ###
    @benchmark [Velocity(1*i,2*i,3*i) + Velocity(1/4 *i,1/5 *i,1/6 *i) for i in 1:100]
    # w/ dimension constructor
        # Time  (mean ± σ):   737.034 ns ±  1.767 μs
        # Memory estimate: 2.50 KiB, allocs estimate: 1.

    # w/o dimension constructor
        # Time  (mean ± σ):   735.818 ns ±  1.727 μs
        # # Memory estimate: 2.50 KiB, allocs estimate: 1.

    @benchmark [Velocity(1*i,2*i,3*i) + Velocity(1/4 *i,1/5 *i,1/6 *i) for i in 1:1000]
    # w/ dimension constructor
        # Time  (mean ± σ):   14.634 μs ±  30.878 μs
        # Memory estimate: 23.48 KiB, allocs estimate: 2.

    # w/o dimension constructor
        # Time  (mean ± σ):   18.556 μs ±  38.559 μs
        # Memory estimate: 23.48 KiB, allocs estimate: 2.

    @benchmark [Velocity(1*i,2*i,3*i) + Velocity(1/4 *i,1/5 *i,1/6 *i) for i in 1:10000]
    # w/ dimension constructor
        # Time  (mean ± σ):   33.716 μs ± 68.523 μs
        # Memory estimate: 234.42 KiB, allocs estimate: 2.       

    # w/o dimension constructor
        # Memory estimate: 2.29 MiB, allocs estimate: 2.
        # Memory estimate: 234.42 KiB, allocs estimate: 2.

    @benchmark [Velocity(1*i,2*i,3*i) + Velocity(1/4 *i,1/5 *i,1/6 *i) for i in 1:100000]
    # w/ dimension constructor    
        # Time  (mean ± σ):     1.038 ms ±  1.108 ms
        # Memory estimate: 2.29 MiB, allocs estimate: 2.

    # w/o dimension constructor
        # Time  (mean ± σ):   950.501 μs ±  1.169 ms
        # Memory estimate: 2.29 MiB, allocs estimate: 2.

    @benchmark [Velocity(1*i,2*i,3*i) + Velocity(1/4 *i,1/5 *i,1/6 *i) for i in 1:1000000]
    # w/ dimension constructor 
        # Time  (mean ± σ):   9.987 ms ±  4.246 ms
        # Memory estimate: 22.89 MiB, allocs estimate: 2.

    # w/o dimension constructor
        # Time  (mean ± σ):   9.394 ms ±  3.682 ms
        # Memory estimate: 22.89 MiB, allocs estimate: 2.
    @benchmark [Velocity(1*i,2*i,3*i) + Velocity(1/4 *i,1/5 *i,1/6 *i) for i in 1:10000000]
    # w/ dimension constructor 
        # Time  (mean ± σ):   96.526 ms ±  30.689 ms
        # Memory estimate: 228.88 MiB, allocs estimate: 2.
        
    # w/o dimension constructor
        # Time  (mean ± σ):   95.533 ms ±  29.757 ms
        # Memory estimate: 228.88 MiB, allocs estimate: 2.
###################################################
using BenchmarkTools

@benchmark [Acceleration(1,2,3) * Time(i) for i in 1:1000]
@benchmark [Length(1)/Time(i) for i in 1:10000]
@benchmark [Length(1)/Time(i)^2 for i in 1:10000]
@benchmark [kinetic_energy(Mass(10))(Speed(i)) for i in 1:10000]
@benchmark [kinetic_energy(Mass(10))(Velocity(i)) for i in 1:10000]
@benchmark [ElectricFieldStrength(4u"nC")(Length(i)) for i in 1:1000]
@benchmark [ElectricFieldStrength(4u"nC")(Position(i)) for i in 1:1000]