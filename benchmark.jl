using BenchmarkTools

@benchmark [(1.0u"m/s")^i for i in -10:10]


@benchmark [Speed(1.0)^i for i in -10:10]
@benchmark Speed(1)^0
[Speed(1.0)^i for i in -1:100][3]
@benchmark 

@benchmark Speed(1)^-100
@benchmark 1.0u"m/s"^-100
Speed(1)^-100
Speed(1)^-1000