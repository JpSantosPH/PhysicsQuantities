### PhysicsVector ###
function Base.:-(PV::PhysicsVector)
    return PhysicsVector(-PV.x, -PV.y, -PV.z)
end
function Base.:+(PV₁::PhysicsVector, PV₂::PhysicsVector)
    return PhysicsVector(PV₁.x+PV₂.x, PV₁.y+PV₂.y, PV₁.z+PV₂.z)
end
function Base.:-(PV₁::PhysicsVector, PV₂::PhysicsVector)
    return PhysicsVector(PV₁.x-PV₂.x, PV₁.y-PV₂.y, PV₁.z-PV₂.z)
end
function Base.:*(n::Number, PV::PhysicsVector)
    return PhysicsVector(n*PV.x, n*PV.y, n*PV.z)
end
function Base.:*(PV::PhysicsVector, n::Number)
    return PhysicsVector(PV.x*n, PV.y*n, PV.z*n)
end
function Base.:/(PV::PhysicsVector, n::Number)
    return PhysicsVector(PV.x/n, PV.y/n, PV.z/n)
end
function Base.:*(PS::PhysicsScalar, PV::PhysicsVector)
    return PhysicsVector(PS.m*PV.x, PS.m*PV.y, PS.m*PV.z)
end
function Base.:*(PV::PhysicsVector, PS::PhysicsScalar)
    return PhysicsVector(PV.x*PS.m, PV.y*PS.m, PV.z*PS.m)
end
function Base.:/(PV::PhysicsVector, PS::PhysicsScalar)
    return PhysicsVector(PV.x/PS.m, PV.y/PS.m, PV.z/PS.m)
end
function Base.:*(PV₁::PhysicsVector, PV₂::PhysicsVector)
    return PV₁.x * PV₂.x + PV₁.y * PV₂.y + PV₁.z * PV₂.z
end
function Base.:^(PV::PhysicsVector, n::Number)
    if n == 2
        return PV * PV
    end
end

### PhysicsScalar ###
function Base.:+(PS₁::T, PS₂::T) where {T<:PhysicsScalar}
    return PhysicsScalar(PS₁.m + PS₂.m)
end
function Base.:-(PS₁::T, PS₂::T) where {T<:PhysicsScalar}
    return PhysicsScalar(PS₁.m - PS₂.m)
end
function Base.:*(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return PhysicsScalar(PS₁.m * PS₂.m)
end
function Base.:*(n::Number, PS::PhysicsScalar)
    return PhysicsScalar(n * PS.m)
end
function Base.:*(PS::PhysicsScalar, n::Number)
    return PhysicsScalar(PS.m * n)
end
function Base.:*(V::Vector, PS::PhysicsScalar)
    return PhysicsScalar.(V .* PS.m)
end
function Base.:*(PS::PhysicsScalar, V::Vector)
    return PhysicsScalar.(PS.m .* V)
end
function Base.:/(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return PhysicsScalar(PS₁.m / PS₂.m)
end
function Base.:/(n::Number, PS::PhysicsScalar)
    return PhysicsScalar(n / PS.m)
end
function Base.:/(PS::PhysicsScalar, n::Number)
    return PhysicsScalar(PS.m / n)
end
function Base.:/(V::Vector, PS::PhysicsScalar)
    return PhysicsScalar.(V ./ PS.m)
end
function Base.:/(PS::PhysicsScalar, V::Vector)
    return PhysicsScalar.(PS.m ./ V)
end
function Base.:^(PS::PhysicsScalar, n::Number)
    return PS.m^n
end