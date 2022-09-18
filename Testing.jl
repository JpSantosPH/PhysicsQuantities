using MethodAnalysis
using BenchmarkTools

@benchmark CartesianCoordinate(1, 2.0, 3)
!(1.0 isa Float64)

methods(PhysicsVector)

a = (1,2 ,3)

typeof(a)

methods(Frequency)


f(x) = x^2
t = ntuple(identity, 15)
tstart = time(); map(Frequency, t); time() - tstart
tstart = time(); map(Speed, t); time() - tstart

@benchmark Frequency()

methods(Frequency)
methods(Speed)