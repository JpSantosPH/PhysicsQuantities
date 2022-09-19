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

### PhysicsVector unary minus optimization ###
    # before
        @benchmark PhysicsVector(-Velocity(1,2,3))
            # Time  (mean ± σ):   62.632 ns ± 113.802 ns
            # Memory estimate: 80 bytes, allocs estimate: 1.
    #after
        @benchmark  -Velocity(1,2,3)
            # Time  (mean ± σ):   1.921 ns ±  1.249 ns
            # Memory estimate: 0 bytes, allocs estimate: 0.
#############################################

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

### PhysicsVector Scalar multiplication optimization ###
    # before
        @benchmark PhysicsVector(Velocity(1, 2, 3) .* 4)
            # Time  (mean ± σ):   70.272 ns ± 130.850 ns
            # Memory estimate: 80 bytes, allocs estimate: 1.
    # after
        @benchmark Velocity(1, 2, 3) * 4
            # Time  (mean ± σ):   2.027 ns ±   1.964 ns
            # Memory estimate: 0 bytes, allocs estimate: 0.
########################################################

### PhysicsVector Multiplication optimization ###
    # before
        @benchmark Velocity(1, 2, 3) ⋅ Velocity(1, 2, 3)
        # Time  (mean ± σ):   17.133 ns ±  10.645 ns
        # Memory estimate: 0 bytes, allocs estimate: 0.
    # after
        @benchmark Velocity(1, 2, 3) * Velocity(1, 2, 3)
        # Time  (mean ± σ):   1.968 ns ±   4.619 ns
        # Memory estimate: 0 bytes, allocs estimate: 0.
#################################################
        
### PhysicsScalar addition optimization ###
    # before
        @benchmark begin
            a = Length(123).magnitude + Length(456).magnitude
            scalar_dict[typeof(dimension(a))](a)
        end
            # Time  (mean ± σ):   497.334 ns ± 164.156 ns
            # Memory estimate: 16 bytes, allocs estimate: 1.
    # after
        @benchmark Length(123) + Length(456)
            # Time  (mean ± σ):   2.093 ns ±  1.779 ns
            # Memory estimate: 0 bytes, allocs estimate: 0.
###########################################

### PhysicsOperators benchmarks ###
    # before
        @benchmark 1/2 * 10.0u"kg" * [3.0u"m/s", 4.0u"m/s"] ⋅ [3.0u"m/s", 4.0u"m/s"]
            # Time  (mean ± σ):   167.929 ns ± 271.013 ns
            # Memory estimate: 240 bytes, allocs estimate: 3.
    # after
        @benchmark 1/2 * Mass(10) * Velocity(3, 4)^2
            # Time  (mean ± σ):   1.949 ns ±  1.311 ns
            # Memory estimate: 0 bytes, allocs estimate: 0.
###################################