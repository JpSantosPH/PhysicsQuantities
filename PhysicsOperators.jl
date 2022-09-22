### PhysicsVector ###

function Base.:+(PV₁::PhysicsVector, PV₂::PhysicsVector)
    return PhysicsVector(PV₁[1]+PV₂[1], PV₁[2]+PV₂[2], PV₁[3]+PV₂[3])
end
function Base.:-(PV₁::PhysicsVector, PV₂::PhysicsVector)
    return PhysicsVector(PV₁[1]-PV₂[1], PV₁[2]-PV₂[2], PV₁[3]-PV₂[3])
end
function Base.:-(PV::PhysicsVector)
    return PhysicsVector(-PV[1], -PV[2], -PV[3])
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
function Base.:^(PV::PhysicsVector, n::Integer)
    if n == 1
        return PV
    end

    return PV * PV^(n-1)
end
function unitvec(PV::PhysicsVector)
    return PV/norm(PV)
end

### PhysicsScalar ###
function Base.:+(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return PhysicsScalar(PS₁[1] + PS₂[1])
end
function Base.:-(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return PhysicsScalar(PS₁[1] - PS₂[1])
end
function Base. -(PS::PhysicsScalar)
    return PhysicsScalar(-PS[1])
end
function Base.:*(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return PhysicsScalar(PS₁[1] * PS₂[1])
end
function Base.:*(q::Quantity, PS::PhysicsScalar)
    return PhysicsScalar(q * PS[1])
end
function Base.:*(PS::PhysicsScalar, q::Quantity)
    return PhysicsScalar(PS[1] * q)
end
function Base.:*(n::Number, PS::PhysicsScalar)
    return PhysicsScalar(n * PS[1])
end
function Base.:*(PS::PhysicsScalar, n::Number)
    return PhysicsScalar(PS[1] * n)
end
function Base.:/(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return PhysicsScalar(PS₁[1] / PS₂[1])
end

function Base.:/(n::Number, PS::PhysicsScalar)
    return PhysicsScalar(n / PS[1])
end
function Base.:/(PS::PhysicsScalar, n::Number)
    return PhysicsScalar(PS[1] / n)
end

function Base.:^(PS::PhysicsScalar, y::Number)
    return PhysicsScalar(PS[1]^y)
end

function Base.rem(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return PhysicsScalar(rem(PS₁[1], PS₂[1]))
end
function Base.rem(PS::PhysicsScalar, n::Number)
    return PhysicsScalar(rem(PS[1], n[1]))
end

function Base.:sqrt(PS::PhysicsScalar)
    return PhysicsScalar(sqrt(PS[1]))
end

function Base.Math.:cbrt(PS::PhysicsScalar)
    return PhysicsScalar(cbrt(PS[1]))
end

function Base.inv(PS::PhysicsScalar)
    return PhysicsScalar(inv(PS[1]))
end
function Base.one(PS::PhysicsScalar)
    return one(PS[1])
end

function Unitful.dimension(PS::PhysicsScalar)
    return dimension(PS[1])
end
function Unitful.dimension(PV::PhysicsVector)
    return dimension(PV[1])
end
function Unitful.uconvert(a::Unitful.Units, PS::PhysicsScalar)
    return PhysicsScalar(uconvert(a, PS[1]))
end