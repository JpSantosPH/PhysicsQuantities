using BenchmarkTools

@benchmark begin
    for i in 1:10
        norm(Position(i))
    end
end

@benchmark begin
    for i in 1:10
        unitvec(Position(i^2,i,1))
    end
end

@benchmark begin
    for i in 1:10
        ElectricField(Charge(4u"nC"))(Length(i))
    end
end
@benchmark begin
    for i in 1:10
        uconvert(u"N/C",(1/(4π*(8.8541878128e-12u"F*m^-1"))) * ((Charge(4u"nC")/(Length(i))^2)))
    end
end

@benchmark begin
    for i in 1:10
        Length(i)^2
    end
end
@benchmark [Length(i)^2 for i in 1:10]
Length(1)^2
@benchmark begin
    for i in 1:10
        (i * u"m")^2
    end
end
Length(1)^2
@benchmark [(i * u"m")^2 for i in 1:10]