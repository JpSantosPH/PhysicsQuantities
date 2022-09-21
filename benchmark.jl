using BenchmarkTools


q = Charge(4u"nC")
r = Position(2)
l = Length(2)


ElectricField(q)(l)
ElectricField(q)