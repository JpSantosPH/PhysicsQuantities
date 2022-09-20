using BenchmarkTools
using Unitful


a = Position(1, 2, 3)
norm(a)
@benchmark Position(1, 2, 3)/norm(Position(1, 2, 3))


function f(P::Position)
    kₑ * q / P^2
end
function ElectricField(q::Charge, r::Length)
    return kₑ * q / r^2 
end

function ElectricField(q::Charge)
    return f(r::Length) = kₑ * q / r^2
end

function ElectricField(q::Quantity)
    f(r::Quantity) = kₑ * (q/r^2)
end
@benchmark ((ElectricField(Charge(4u"nC"), Length(i))) for i in 1:1000)
@benchmark[ElectricField(Charge(4u"nC"))(Length(i)) for i in 1:1000]
@benchmark [ElectricField(uconvert(u"C",4u"nC"))(2u"m") for i in 1:1000]

@benchmark (ElectricField(Charge(4u"nC"), Length(i)) for i in 1:1000)
collect(a)

b = 
a = (ElectricField(Charge(4u"nC"), Length(i)).m for i in 1:1000)
@benchmark [(ElectricField(Charge(4u"nC"))(Length(i)).m for i in 1:1000)...]
@benchmark (Length(1) / Time(1) / Time(1)/ Time(1))
(Length(1) / Time(1) / Time(1))
1 / 1u"s"