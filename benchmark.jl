using BenchmarkTools


function ElectricField(q::Charge, r::Length)
    return (1/(4π*(8.8541878128e-12u"F*m^-1"))) * (q / (r)^2)
end
function ElectricField(q::Charge, r::Position)
    return (1/(4π*(8.8541878128e-12u"F*m^-1"))) * (q / (r)^2)
end
function ElectricField(q::Charge)
    return f(r::Length) = (1/(4π*(8.8541878128e-12u"F*m^-1"))) * (q / (r)^2)
end

function ElectricField(q::Quantity)
    ϵ₀ =  8.8541878128e-12u"F*m^-1"
    kₑ = 1/(4π*ϵ₀)
    f(r::Quantity) = (1/(4π*(8.8541878128e-12u"F*m^-1"))) * (q / (r)^2)
end

@benchmark begin
    a = Quantity[]
    for i in 1:1000
    @inbounds push!(a, ElectricField(Charge(i*u"nC"), Length(i*u"m"))[1])
    end
    return a
end

@benchmark [(1/(4π*(8.8541878128e-12u"F*m^-1"))) * Charge(4.0u"nC") / Length(i*u"m")^2 for i in 1:1000]
@benchmark [ElectricField(Charge(4u"nC"), Length(2*u"m"))[1] for i in 1:1000]
@benchmark [ElectricField(Charge(4u"nC"))(Length(i*u"m")) for i in 1:1000]
@benchmark [ElectricField(uconvert(u"C",4*u"nC"))(i*u"m") for i in 1:1000]

### all the same ###
@benchmark [(1/(4π * (8.8541878128e-12u"F*m^-1"))) * Charge(4.0u"nC") / Length(2)^2 for i in 1:100]
@benchmark [(1/(4π * (8.8541878128e-12u"F*m^-1"))) * Charge(4.0u"nC") / Length(2) * Length(2) for i in 1:100]
@benchmark [(1/(4π * (8.8541878128e-12u"F*m^-1"))) * 4.0e-9u"C" / (2.0u"m")^2 for i in 1:100]
@benchmark [(1/(4π * (8.8541878128e-12u"F*m^-1"))) * 4.0e-9u"C" / 2.0u"m" * 2.0u"m" for i in 1:100]

@benchmark [Length(i * u"m")^2 for i in 1:100]
@benchmark [Length(i * u"m") * Length(i * u"m") for i in 1:100]
@benchmark [(i * u"m")^2 for i in 1:100]
@benchmark [(i * u"m") * (i * u"m") for i in 1:100]
@benchmark [i*i for i in 1:100]
$
@benchmark [Velocity(i) for i in 1:100]

@benchmark [[(i * u"m/s"),(i * u"m/s"),(i * u"m/s")] for i in 1:100]

@timev [Length(i * u"m")^2 for i in 1:100]
@btime [Length(i * u"m")^2 for i in 1:100]

a = @benchmarkable [Length(i * u"m")^2 for i in 1:100]
run(a)

 @benchmark [PhysicsScalar(i * u"s") for i in 1:1000]
 @benchmark [Time(i * u"s")^3 for i in 1:1000]
 @benchmark [(i * u"s") for i in 1:1000]

 dimension(1.0u"rad")
(5u"s")^-3

@benchmark let 
    for i in 1:4
        
    end
end
Time(1) + Time(1)
@benchmark [Length(x) ./ Time(y) for x in 1:100 for y in 1:100]
@benchmark [(x*u"m") / (y*u"s") for x in 1:100 for y in 1:100]

Time(5)^50
using BenchmarkTools
@benchmark [Position(i,j,k)^2 for i in 1:10 for j in 1:10 for k in 1:10]