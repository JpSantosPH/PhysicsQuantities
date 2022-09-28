using BenchmarkTools
using Profile
@benchmark [Position(i * u"m",2.0u"m",3.0u"m") .* Position(1.0u"m", i * 2.0u"m",3u"m") for i in 1:10]


Position(1.0u"m",2.0u"m",3.0u"mm")
a = [Position(i * u"mm",2.0u"m",3.0u"m") ./ Position(1.0u"m", i * 2.0u"cm",3u"m") for i in 1:10]

@benchmark [Position(i,2,3) ./ Time(i) for i in 1:10]
Position(1,2,3) ./ Time(1)
Speed(1).m