using BenchmarkTools

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