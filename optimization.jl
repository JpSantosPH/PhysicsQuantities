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
        # Time  (mean ± σ):   2.031 ns ±   1.869 ns
        # Memory estimate: 0 bytes, allocs estimate: 0.
###########################################

### PhysicsVector addition optimization ###
    # before
        @benchmark Velocity(1, 2, 3) .+ Velocity(4, 5, 6)
        # Time  (mean ± σ):   74.326 ns ± 136.210 ns
        # Memory estimate: 80 bytes, allocs estimate: 1.
    # after
        @benchmark Velocity(1, 2, 3) + Velocity(4, 5, 6)
        # Time  (mean ± σ):   2.115 ns ±   2.237 ns
        # Memory estimate: 0 bytes, allocs estimate: 0.
###########################################