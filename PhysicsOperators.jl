### PhysicsVector ###
function Base.:-(PV::PhysicsVector)
    return PhysicsVector(-PV[1], -PV[2], -PV[3])
end
function Base.:*(n::Number, PV::PhysicsVector)
    return PhysicsVector(n*PV[1], n*PV[2], n*PV[3])
end
function Base.:*(PV::PhysicsVector, n::Number)
    return PhysicsVector(PV[1]*n, PV[2]*n, PV[3]*n)
end
function Base.:+(PV₁::PhysicsVector, PV₂::PhysicsVector)
    return PhysicsVector(PV₁[1]+PV₂[1], PV₁[2]+PV₂[2], PV₁[3]+PV₂[3])
end
function Base.:*(PV₁::PhysicsVector, PV₂::PhysicsVector)
    return PV₁[1] * PV₂[1] + PV₁[2] * PV₂[2] + PV₁[3] * PV₂[3]
end
function Base.:^(PV::PhysicsVector, n::Number)
    if n == 2
        return PV * PV
    end
end
function Base.:^(PS::PhysicsScalar, n::Number)
    return PS.magnitude^n
end

### PhysicsScalar ###
function Base.:+(PS₁::T, PS₂::T) where {T<:PhysicsScalar}
    return PhysicsScalar(PS₁[1] + PS₂[1])
end
function Base.:*(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return PhysicsScalar(PS₁[1] * PS₂[1])
end
function Base.:*(n::Number, PS::PhysicsScalar)
    return PhysicsScalar(n * PS.magnitude)
end
function Base.:*(PS::PhysicsScalar, n::Number)
    return PhysicsScalar(PS.magnitude * n)
end
function Base.:*(V::Vector, PS::PhysicsScalar)
    return PhysicsScalar.(V .* PS.magnitude)
end
function Base.:*(PS::PhysicsScalar, V::Vector)
    return PhysicsScalar.(PS.magnitude .* V)
end