using MethodAnalysis
using JET

# compile time benchmark
    # t = ntuple(identity, 15)
    # tstart = time(); map(Frequency, t); time() - tstart
    # tstart = time(); map(Speed, t); time() - tstart

using BenchmarkTools

### PhysicsVector indexing optimization ###
    # before
        @benchmark [1.0u"m/s", 2.0u"m/s", 3.0u"m/s"][2]
            # Time  (mean ± σ):   46.976 ns ± 137.990 ns
            # Memory estimate: 80 bytes, allocs estimate: 1.
    # after
        @benchmark Velocity(1.0u"m/s", 2.0u"m/s", 3.0u"m/s")[2]
            # Time  (mean ± σ):   1.946 ns ±  1.454 ns
            # Memory estimate: 0 bytes, allocs estimate: 0.
###########################################

### PhysicsVector Algebra optimization ###
    # before
        @benchmark Velocity(1, 2, 3) .+ Velocity(4, 5, 6)
            # Time  (mean ± σ):   74.326 ns ± 136.210 ns
            # Memory estimate: 80 bytes, allocs estimate: 1.
    # after
        @benchmark Velocity(1, 2, 3) + Velocity(4, 5, 6)
            # Time  (mean ± σ):   2.115 ns ±   2.237 ns
            # Memory estimate: 0 bytes, allocs estimate: 0.
###########################################
    # before
        @benchmark Velocity(1, 2, 3) ⋅ Velocity(1, 2, 3)
            # Time  (mean ± σ):   17.133 ns ±  10.645 ns
            # Memory estimate: 0 bytes, allocs estimate: 0.
# after
        @benchmark Velocity(1, 2, 3) * Velocity(1, 2, 3)
            # Time  (mean ± σ):   1.968 ns ±   4.619 ns
            # Memory estimate: 0 bytes, allocs estimate: 0.
###########################################

### PhysicsVector Scalar Algebra optimization ###
    # before
        @benchmark Velocity(1, 2, 3) .* 4
            # Time  (mean ± σ):   47.329 ns ± 151.053 ns
            # Memory estimate: 80 bytes, allocs estimate: 1.
    # after
        @benchmark Velocity(1, 2, 3) * 4
            # Time  (mean ± σ):   1.930 ns ±  1.141 ns
            # Memory estimate: 0 bytes, allocs estimate: 0.
########################################################

### PhysicsVector Multiplication optimization ###

#################################################
        

### Operators benchmark ###
    # before
        @benchmark 1/2 * 10.0u"kg" * [3.0u"m/s", 4.0u"m/s"] ⋅ [3.0u"m/s", 4.0u"m/s"]
            # Time  (mean ± σ):   159.396 ns ± 249.891 ns
            # Memory estimate: 240 bytes, allocs estimate: 3.
    # after
        @benchmark 1/2 * Mass(10) * Velocity(3, 4)^2
            # Time  (mean ± σ):   1.949 ns ±  1.311 ns
            # Memory estimate: 0 bytes, allocs estimate: 0.
    ###############################
    # before
        @benchmark [1/2 * i*u"kg" * [3.0u"m/s", 4.0u"m/s"] ⋅ [3.0u"m/s", 4.0u"m/s"] for i in 1:100000]
            # Time  (mean ± σ):   17.067 ms ±  3.037 ms
            # Memory estimate: 23.65 MiB, allocs estimate: 300002.
    # after
        @benchmark [1/2 * Mass(i) * Velocity(3, 4)^2 for i in 1:100000]
            # Time  (mean ± σ):   283.016 μs ± 349.543 μs
            # Memory estimate: 781.30 KiB, allocs estimate: 2.
    ###############################
    # before
        @benchmark [[1.0u"m", 1.0u"m", 1.0u"m"] + [i*u"m", i*u"m", i*u"m"] for i in 1:100000]
        # Time  (mean ± σ):   17.877 ms ±  4.420 ms
        # Memory estimate: 23.65 MiB, allocs estimate: 300002.
    #after
        @benchmark [Position(1, 1, 1) + Position(i, i, i) for i in 1:100000]
        # Time  (mean ± σ):     1.014 ms ±  1.132 ms
        # Memory estimate: 2.29 MiB, allocs estimate: 2.
    ###############################