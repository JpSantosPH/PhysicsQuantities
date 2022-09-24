using BenchmarkTools

@benchmark [Velocity(1*i,2*i,3*i) + Velocity(1/4 *i,1/5 *i,1/6 *i) for i in 1:100]
    # w/ dimension constructor
        # Time  (mean ± σ):   737.034 ns ±  1.767 μs
        # Memory estimate: 2.50 KiB, allocs estimate: 1.
    
    # w/o dimension constructor
        # Time  (mean ± σ):   735.818 ns ±  1.727 μs
        # # Memory estimate: 2.50 KiB, allocs estimate: 1.

@benchmark [Velocity(1*i,2*i,3*i) + Velocity(1/4 *i,1/5 *i,1/6 *i) for i in 1:10000]
    # w/ dimension constructor
        # Time  (mean ± σ):   35.935 μs ± 81.979 μs
        # Memory estimate: 234.42 KiB, allocs estimate: 2.       

    # w/o dimension constructor
        # Time  (mean ± σ):   55.638 μs ± 126.895 μs
        # Memory estimate: 234.42 KiB, allocs estimate: 2.