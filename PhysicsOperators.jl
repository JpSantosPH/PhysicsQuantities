### PhysicsVector ###
function Base.:-(PV::PhysicsVector)
    return PhysicsVector(-PV[1], -PV[2], -PV[3])
end
function Base.:+(PV₁::PhysicsVector, PV₂::PhysicsVector)
    return PhysicsVector(PV₁[1]+PV₂[1], PV₁[2]+PV₂[2], PV₁[3]+PV₂[3])
end
function Base.:-(PV₁::PhysicsVector, PV₂::PhysicsVector)
    return PhysicsVector(PV₁[1]-PV₂[1], PV₁[2]-PV₂[2], PV₁[3]-PV₂[3])
end
function Base.:*(n::Number, PV::PhysicsVector)
    return PhysicsVector(n*PV[1], n*PV[2], n*PV[3])
end
function Base.:*(PV::PhysicsVector, n::Number)
    return PhysicsVector(PV[1]*n, PV[2]*n, PV[3]*n)
end
function Base.:/(PV::PhysicsVector, n::Number)
    return PhysicsVector(PV[1]/n, PV[2]/n, PV[3]/n)
end
function Base.:*(PS::PhysicsScalar, PV::PhysicsVector)
    return PhysicsVector(PS[1]*PV[1], PS[1]*PV[2], PS[1]*PV[3])
end
function Base.:*(PV::PhysicsVector, PS::PhysicsScalar)
    return PhysicsVector(PV[1]*PS[1], PV[2]*PS[1], PV[3]*PS[1])
end
function Base.:/(PV::PhysicsVector, PS::PhysicsScalar)
    return PhysicsVector(PV[1]/PS[1], PV[2]/PS[1], PV[3]/PS[1])
end
function Base.:*(PV₁::PhysicsVector, PV₂::PhysicsVector)
    return PV₁[1] * PV₂[1] + PV₁[2] * PV₂[2] + PV₁[3] * PV₂[3]
end
function Base.:^(PV::PhysicsVector, n::Number)
    if n == 2
        return PV * PV
    end
end

### PhysicsScalar ###
function Base.:+(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return PhysicsScalar(PS₁.m + PS₂.m)
end
function Base.:-(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return PhysicsScalar(PS₁.m - PS₂.m)
end
function Base.:*(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return ScalarProduct(PS₁.m * PS₂.m)
end
function Base.:*(q::Quantity, PS::PhysicsScalar)
    return ScalarProduct(q * PS.m)
end
function Base.:*(PS::PhysicsScalar, q::Quantity)
    return ScalarProduct(PS.m * q)
end
function Base.:*(n::Number, PS::PhysicsScalar)
    return n * PS.m
end
function Base.:*(PS::PhysicsScalar, n::Number)
    return PS.m * n
end
function Base.:*(V::Vector, PS::PhysicsScalar)
    return PhysicsScalar.(V .* PS.m)
end
function Base.:*(PS::PhysicsScalar, V::Vector)
    return PhysicsScalar.(PS.m .* V)
end
function Base.:/(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return ScalarQuotient(PS₁.m / PS₂.m)
end
function Base.:/(q::Quantity, PS::PhysicsScalar)
    return ScalarQuotient(q / PS.m)
end
function Base.:/(PS::PhysicsScalar, q::Quantity)
    return ScalarQuotient(PS.m / q)
end
function Base.:/(n::Number, PS::PhysicsScalar)
    return n / PS.m
end
function Base.:/(PS::PhysicsScalar, n::Number)
    return PS.m / n
end
function Base.:/(V::Vector, PS::PhysicsScalar)
    return PhysicsScalar.(V ./ PS.m)
end
function Base.:/(PS::PhysicsScalar, V::Vector)
    return PhysicsScalar.(PS.m ./ V)
end
function unit(PV::PhysicsVector)
    return PV/norm(PV)
end