### PhysicsVector ###

function Base.:+(PV₁::PhysicsVector, PV₂::PhysicsVector)
    return PhysicsVector(PV₁.x+PV₂.x, PV₁.y+PV₂.y, PV₁.z+PV₂.z)
end
function Base.:-(PV₁::PhysicsVector, PV₂::PhysicsVector)
    return PhysicsVector(PV₁.x-PV₂.x, PV₁.y-PV₂.y, PV₁.z-PV₂.z)
end
function Base.:-(PV::PhysicsVector)
    return PhysicsVector(-PV.x, -PV.y, -PV.z)
end
function Base.:*(PS::PhysicsScalar, PV::PhysicsVector)
    return PhysicsVector(PS.m*PV.x, PS.m*PV.y, PS.m*PV.z)
end
function Base.:*(PV::PhysicsVector, PS::PhysicsScalar)
    return PhysicsVector(PV.x*PS.m, PV.y*PS.m, PV.z*PS.m)
end
function Base.:*(n::Number, PV::PhysicsVector)
    return PhysicsVector(n*PV.x, n*PV.y, n*PV.z)
end
function Base.:*(PV::PhysicsVector, n::Number)
    return PhysicsVector(PV.x*n, PV.y*n, PV.z*n)
end
function Base.:/(PV::PhysicsVector, PS::PhysicsScalar)
    return PhysicsVector(PV.x/PS.m, PV.y/PS.m, PV.z/PS.m)
end
function Base.:/(PV::PhysicsVector, n::Number)
    return PhysicsVector(PV.x/n, PV.y/n, PV.z/n)
end
function Base.:*(PV₁::PhysicsVector, PV₂::PhysicsVector)
    return PhysicsScalar(PV₁.x*PV₂.x + PV₁.y*PV₂.y + PV₁.z*PV₂.z)
end
function Base.:^(PV::PhysicsVector, i::Integer)
    return *((PV for x in 1:i)...)
end
function unitvec(PV::PhysicsVector)
    n = sqrt(PV.x^2 + PV.y^2 + PV.z^2)
    return CartesianCoordinate(PV.x/n, PV.y/n, PV.z/n)
end
function LinearAlgebra.norm(PV::PhysicsVector)
    return PhysicsScalar(sqrt(PV.x^2 + PV.y^2 + PV.z^2))
end

### PhysicsScalar ###
function Base.:+(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return PhysicsScalar(PS₁.m + PS₂.m)
end
function Base.:+(PS::PhysicsScalar, AQ::Unitful.AbstractQuantity)
    return PhysicsScalar(PS.m + AQ)
end
function Base.:+(AQ::Unitful.AbstractQuantity, PS::PhysicsScalar)
    return PhysicsScalar(AQ + PS.m)
end
function Base.:-(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return PhysicsScalar(PS₁.m - PS₂.m)
end
function Base.:-(PS::PhysicsScalar, AQ::Unitful.AbstractQuantity)
    return PhysicsScalar(PS.m - AQ)
end
function Base.:-(AQ::Unitful.AbstractQuantity, PS::PhysicsScalar)
    return PhysicsScalar(AQ - PS.m)
end
function Base.:-(PS::PhysicsScalar)
    return PhysicsScalar(-PS.m)
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
function Base.:*(PS::PhysicsScalar, AQ::Unitful.AbstractQuantity)
    return PhysicsScalar(PS.m * AQ)
end
function Base.:*(AQ::Unitful.AbstractQuantity, PS::PhysicsScalar)
    return PhysicsScalar(AQ * PS.m)
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
function Base.:/(PS::PhysicsScalar, AQ::Unitful.AbstractQuantity)
    return PhysicsScalar(PS.m / AQ)
end
function Base.:/(AQ::Unitful.AbstractQuantity, PS::PhysicsScalar)
    return PhysicsScalar(AQ / PS.m)
end
function Base.:^(PS::PhysicsScalar, i::Integer)
    return *((PS.m for x in 1:i)...)
end
function Base.:^(PS::PhysicsScalar, n::Rational)
    return PS.m^n
end
function Base.inv(PS::PhysicsScalar)
    return PhysicsScalar(inv(PS.m))
end
function Base.rem(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return PhysicsScalar(rem(PS₁.m, PS₂.m))
end
function Base.rem(PS::PhysicsScalar, n::Number)
    return PhysicsScalar(rem(PS.m, n))
end
function Base.:sqrt(PS::PhysicsScalar)
    return PhysicsScalar(sqrt(PS.m))
end
function Base.Math.:cbrt(PS::PhysicsScalar)
    return PhysicsScalar(cbrt(PS.m))
end
function Base.one(PS::PhysicsScalar)
    return one(PS.m)
end

### bolean ###
function Base. ==(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return PS₁.m == PS₂.m
end
function Base. ==(PS::PhysicsScalar, AQ::Unitful.AbstractQuantity)
    return PS.m == AQ
end
function Base. ==(AQ::Unitful.AbstractQuantity, PS::PhysicsScalar)
    return AQ == PS.m
end
function Base.:<(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return PS₁.m < PS₂.m
end
function Base.:<(PS::PhysicsScalar, AQ::Unitful.AbstractQuantity)
    return PS.m < AQ
end
function Base.:<(AQ::Unitful.AbstractQuantity, PS::PhysicsScalar)
    return AQ < PS.m
end
function Base.isequal(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return isequal(PS₁.m, PS₂.m)
end
function Base.isequal(AQ::Unitful.AbstractQuantity, PS::PhysicsScalar)
    return isequal(AQ, PS.m)
end
function Base.isequal(PS::PhysicsScalar, AQ::Unitful.AbstractQuantity)
    return isequal(PS.m, AQ)
end
function Base.isless(PS₁::PhysicsScalar, PS₂::PhysicsScalar)
    return isless(PS₁.m, PS₂.m)
end
function Base.isless(AQ::Unitful.AbstractQuantity, PS::PhysicsScalar)
    return isless(AQ, PS.m)
end
function Base.isless(PS::PhysicsScalar, AQ::Unitful.AbstractQuantity)
    return isless(PS.m, AQ)
end

### broadcasting ###
Base.Broadcast.BroadcastStyle(::Type{<:PhysicsVector}) = Broadcast.ArrayStyle{PhysicsVector}()
function Base.similar(bc::Broadcast.Broadcasted{Broadcast.ArrayStyle{PhysicsVector}}, ::Type{ElType}) where ElType
    PhysicsVector(bc...)
end

### Unitful ###
function Unitful.dimension(PS::PhysicsScalar)
    return dimension(PS.m)
end
function Unitful.dimension(PV::PhysicsVector)
    return dimension(PV.x)
end
function Unitful.uconvert(a::Unitful.Units, PS::PhysicsScalar)
    return uconvert(a, PS.m)
end
function Unitful.uconvert(a::Unitful.Units, PV::PhysicsVector)
    return GeneralVector(uconvert(a, PV.x), uconvert(a, PV.y), uconvert(a, PV.z))
end