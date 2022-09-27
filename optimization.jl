using BenchmarkTools

@benchmark [Position(1i, 2i, 3i) × Force(4i, 5i, 6i) for i in 1:10]     