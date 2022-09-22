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
    return PhysicsVector(n[1]*PV[1], n[1]*PV[2], n[1]*PV[3])
end
function Base.:*(PV::PhysicsVector, n::Number)
    return PhysicsVector(PV[1]*n[1], PV[2]*n[1], PV[3]*n[1])
end
function Base.:/(PV::PhysicsVector, n::Number)
    return PhysicsVector(PV[1]/n[1], PV[2]/n[1], PV[3]/n[1])
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
    if n == 2
        return PV[1] * PV[1] + PV[2] * PV[2] + PV[3] * PV[3]
    end
end

function unitvec(PV::PhysicsVector)
    n = norm(PV)
    return CartesianCoordinate(PV[1]/n, PV[2]/n, PV[3]/n)
end

function LinearAlgebra.norm(PV::PhysicsVector)
    return sqrt(PV[1]^2 + PV[2]^2 + PV[3]^2)
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
function Base.:*(n::Number, PS::PhysicsScalar)
    return PhysicsScalar(n[1] * PS[1])
end
function Base.:*(PS::PhysicsScalar, n::Number)
    return PhysicsScalar(PS[1] * n[1])
end
function Base.:/(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return PhysicsScalar(PS₁[1] / PS₂[1])
end
function Base.:/(n::Quantity, PS::PhysicsScalar)
    return PhysicsScalar(n / PS[1])
end
function Base.:/(PS::PhysicsScalar, n::Quantity)
    return PhysicsScalar(PS[1] / n)
end
function Base.:/(n::Number, PS::PhysicsScalar)
    return PhysicsScalar(n / PS[1])
end
function Base.:/(PS::PhysicsScalar, n::Number)
    return PhysicsScalar(PS[1] / n)
end
function Base.:^(PS::PhysicsScalar, i::Integer)
    
end
function Base.:^(PS::PhysicsScalar, n::Number)
    return PhysicsScalar(PS[1]^n)
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