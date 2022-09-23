### PhysicsVector ###

function Base.:+(PV₁::PhysicsVector, PV₂::PhysicsVector)
    return dimension(PV₁)(PV₁.x+PV₂.x, PV₁.y+PV₂.y, PV₁.z+PV₂.z)
end
function Base.:-(PV₁::PhysicsVector, PV₂::PhysicsVector)
    return dimension(PV₁.x)(PV₁.x-PV₂.x, PV₁.y-PV₂.y, PV₁.z-PV₂.z)
end
function Base.:-(PV::PhysicsVector)
    return dimension(PV.x)(-PV.x, -PV.y, -PV.z)
end
function Base.:*(n::Number, PV::PhysicsVector)
    return GeneralScalar(n*PV.x, n*PV.y, n*PV.z)
end
function Base.:*(PV::PhysicsVector, n::Number)
    return GeneralScalar(PV.x*n, PV.y*n, PV.z*n)
end
function Base.:/(PV::PhysicsVector, n::Number)
    return GeneralScalar(PV.x/n, PV.y/n, PV.z/n)
end
function Base.:*(PS::PhysicsScalar, PV::PhysicsVector)
    return GeneralScalar(PS.m*PV.x, PS.m*PV.y, PS.m*PV.z)
end
function Base.:*(PV::PhysicsVector, PS::PhysicsScalar)
    return GeneralScalar(PV.x*PS.m, PV.y*PS.m, PV.z*PS.m)
end
function Base.:/(PV::PhysicsVector, PS::PhysicsScalar)
    return GeneralScalar(PV.x/PS.m, PV.y/PS.m, PV.z/PS.m)
end
function Base.:*(PV₁::PhysicsVector, PV₂::PhysicsVector)
    return PV₁.x*PV₂.x + PV₁.y*PV₂.y + PV₁.z*PV₂.z
end
function Base.:^(PV::PhysicsVector, i::Integer)
    if i == 1
        return PV
    else
        return PV * PV^(i-1)
    end
end

function unitvec(PV::PhysicsVector)
    n = sqrt(PV.x^2 + PV.y^2 + PV.z^2)
    return CartesianCoordinate(PV.x/n, PV.y/n, PV.z/n)
end

function LinearAlgebra.norm(PV::PhysicsVector)
    return sqrt(PV.x^2 + PV.y^2 + PV.z^2)
end

### PhysicsScalar ###
function Base.:+(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return PS₁.m + PS₂.m
end
function Base.:-(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return PS₁.m - PS₂.m
end
function Base. -(PS::PhysicsScalar)
    return -PS.m
end
function Base.:*(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return PS₁.m * PS₂.m
end
function Base.:*(n::Number, PS::PhysicsScalar)
    return n * PS.m
end
function Base.:*(PS::PhysicsScalar, n::Number)
    return PS.m * n
end
function Base.:/(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return PS₁.m / PS₂.m
end
function Base.:/(n::Quantity, PS::PhysicsScalar)
    return n / PS.m
end
function Base.:/(PS::PhysicsScalar, n::Quantity)
    return PS.m / n
end
function Base.:/(n::Number, PS::PhysicsScalar)
    return n / PS.m
end
function Base.:/(PS::PhysicsScalar, n::Number)
    return PS.m / n
end
function Base.:^(PS::PhysicsScalar, n::Number)
    return PS.m^n
end

function Base.rem(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return rem(PS₁.m, PS₂.m)
end
function Base.rem(PS::PhysicsScalar, n::Number)
    return rem(PS.m, n)
end

function Base.:sqrt(PS::PhysicsScalar)
    return sqrt(PS.m)
end

function Base.Math.:cbrt(PS::PhysicsScalar)
    return cbrt(PS.m)
end

function Base.inv(PS::PhysicsScalar)
    return inv(PS.m)
end
function Base.one(PS::PhysicsScalar)
    return one(PS.m)
end

function Unitful.dimension(PS::PhysicsScalar)
    return dimension(PS.m)
end
function Unitful.dimension(PV::PhysicsVector)
    return dimension(PV.x)
end
function Unitful.uconvert(a::Unitful.Units, PS::PhysicsScalar)
    return uconvert(a, PS.m)
end
function Unitful.uconvert(a::Unitful.Units, PV::PhysicsScalar)
    return GeneralScalar(uconvert(a, PV.x), uconvert(a, PV.y), uconvert(a, PV.z))
end