using BenchmarkTools


q = Charge(4u"nC")
r = Position(2)
l = Length(2)


ElectricField(q)

@benchmark let
    v = 
    for i in 1:10000
        Velocity(1) + Velocity(2,3)

Velocity(1) + Velocity(2,3)