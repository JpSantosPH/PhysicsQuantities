
using BenchmarkTools

@benchmark [Physics(Acceleration(1,2,3) * Time(i)) for i in 1:1000]
@benchmark [Acceleration(1,2,3) * Time(i) for i in 1:1000]
@benchmark [[1u"m/s^2", 2u"m/s^2", 3u"m/s^2"] .* i*u"s" for i in 1:1000]

@benchmark [Physics(Length(1)/Time(i)^2) for i in 1:10000]
@benchmark [(1u"m")/((i*u"s")^2) for i in 1:10000]

