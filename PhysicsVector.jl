abstract type PhysicsVector <: AbstractVector{Number} end
    Base.size(PV::PhysicsVector) = (3,)
    function Base.getindex(PV::PhysicsVector, i::Integer)
        if     i == 1; return PV.x
        elseif i == 2; return PV.y
        elseif i == 3; return PV.z
        end
    end
    Base.showarg(io::IO, PV::PhysicsVector, toplevel) = print(io, physicstype(PV))
    Base.similar(PV::PhysicsVector) = physics(PV.x, PV.y, PV.z)
    Base.collect(PV::PhysicsVector) = [PV.x, PV.y, PV.z]
    function Base.setindex!(PV::PhysicsVector, val, i::Integer)
        val = ps_strip(val)
        if     i == 1; return physics(val,  PV.y, PV.z)
        elseif i == 2; return physics(PV.x, val,  PV.z)
        elseif i == 3; return physics(PV.x, PV.y, val )
        end
    end

    struct GeneralVector{T<:Number} <: PhysicsVector
        x::T
        y::T
        z::T
    end
        function GeneralVector(x::Number, y::Number, z::Number)
            x, y, z = promote(x, y, z)
            return GeneralVector(x, y, z)
        end
        GeneralVector( (x, y, z) ) = GeneralVector(x, y, z)
        GeneralVector() = GeneralVector(0.0, 0.0, 0.0)

    struct CartesianCoordinate{T<:Float64} <: PhysicsVector
        x::T
        y::T
        z::T
    end
        Base.showarg(io::IO, CC::CartesianCoordinate, toplevel) = print(io, CartesianCoordinate)
        function CartesianCoordinate(x::Number=0, y::Number=0, z::Number=0)
            x, y, z = convert.(Float64, (x, y, z))
            return CartesianCoordinate(x, y, z)
        end
        CartesianCoordinate((x, y, z)) = CartesianCoordinate(x, y, z)
        CartesianCoordinate(args) = CartesianCoordinate(args...)

    struct Position{A,B,C,D,E,F} <: PhysicsVector where {A,B,C,D,E,F}
        x::Quantity{A, dimension(u"m"), Unitful.FreeUnits{D, dimension(u"m"), nothing}}
        y::Quantity{B, dimension(u"m"), Unitful.FreeUnits{E, dimension(u"m"), nothing}}
        z::Quantity{C, dimension(u"m"), Unitful.FreeUnits{F, dimension(u"m"), nothing}}
    end
        function Position(x::Number=0u"m", y::Number=0u"m", z::Number=0u"m")
            x, y, z = correct_units(x, y, z, u"m")
            return Position(x, y, z)
        end
        Position(args) = Position(args...)

    struct Force{A,B,C,D,E,F} <: PhysicsVector where {A,B,C,D,E,F}
        x::Quantity{A, dimension(u"N"), Unitful.FreeUnits{D, dimension(u"N"), nothing}}
        y::Quantity{B, dimension(u"N"), Unitful.FreeUnits{E, dimension(u"N"), nothing}}
        z::Quantity{C, dimension(u"N"), Unitful.FreeUnits{F, dimension(u"N"), nothing}}
    end
        function Force(x::Number=0u"N", y::Number=0u"N", z::Number=0u"N")
            x, y, z = correct_units(x, y, z, u"N")
            return Force(x, y, z)
        end
        Force(args) = Force(args...)

    struct Velocity{A,B,C,D,E,F}  <: PhysicsVector where {A,B,C,D,E,F}
        x::Quantity{A, dimension(u"m/s"), Unitful.FreeUnits{D, dimension(u"m/s"), nothing}}
        y::Quantity{B, dimension(u"m/s"), Unitful.FreeUnits{E, dimension(u"m/s"), nothing}}
        z::Quantity{C, dimension(u"m/s"), Unitful.FreeUnits{F, dimension(u"m/s"), nothing}}
    end
        function Velocity(x::Number=0u"m/s", y::Number=0u"m/s", z::Number=0u"m/s")
            x, y, z = correct_units(x, y, z, u"m/s")
            return Velocity(x, y, z)
        end
        Velocity(args) = Velocity(args...)

    struct Acceleration{A,B,C,D,E,F} <: PhysicsVector where {A,B,C,D,E,F}
        x::Quantity{A, dimension(u"m/s^2"), Unitful.FreeUnits{D, dimension(u"m/s^2"), nothing}}
        y::Quantity{B, dimension(u"m/s^2"), Unitful.FreeUnits{E, dimension(u"m/s^2"), nothing}}
        z::Quantity{C, dimension(u"m/s^2"), Unitful.FreeUnits{F, dimension(u"m/s^2"), nothing}}
    end
        function Acceleration(x::Number=0u"m/s^2", y::Number=0u"m/s^2", z::Number=0u"m/s^2")
            x, y, z = correct_units(x, y, z, u"m/s^2")
            return Acceleration(x, y, z)
        end
        Acceleration(args) = Acceleration(args...)

    struct Jerk{A,B,C,D,E,F} <: PhysicsVector where {A,B,C,D,E,F}
        x::Quantity{A, dimension(u"m/s^3"), Unitful.FreeUnits{D, dimension(u"m/s^3"), nothing}}
        y::Quantity{B, dimension(u"m/s^3"), Unitful.FreeUnits{E, dimension(u"m/s^3"), nothing}}
        z::Quantity{C, dimension(u"m/s^3"), Unitful.FreeUnits{F, dimension(u"m/s^3"), nothing}}
    end
        function Jerk(x::Number=0u"m/s^3", y::Number=0u"m/s^3", z::Number=0u"m/s^3")
            x, y, z = correct_units(x, y, z, u"m/s^3")
            return Jerk(x, y, z)
        end
        Jerk(args) = Jerk(args...)

    struct Snap{A,B,C,D,E,F} <: PhysicsVector where {A,B,C,D,E,F}
        x::Quantity{A, dimension(u"m/s^4"), Unitful.FreeUnits{D, dimension(u"m/s^4"), nothing}}
        y::Quantity{B, dimension(u"m/s^4"), Unitful.FreeUnits{E, dimension(u"m/s^4"), nothing}}
        z::Quantity{C, dimension(u"m/s^4"), Unitful.FreeUnits{F, dimension(u"m/s^4"), nothing}}
    end
        function Snap(x::Number=0u"m/s^4", y::Number=0u"m/s^4", z::Number=0u"m/s^4")
            x, y, z = correct_units(x, y, z, u"m/s^4")
            return Snap(x, y, z)
        end
        Snap(args) = Snap(args...)

    struct AngularVelocity{A,B,C,D,E,F} <: PhysicsVector where {A,B,C,D,E,F}
        x::Quantity{A, dimension(u"rad/s"), Unitful.FreeUnits{D, dimension(u"rad/s"), nothing}}
        y::Quantity{B, dimension(u"rad/s"), Unitful.FreeUnits{E, dimension(u"rad/s"), nothing}}
        z::Quantity{C, dimension(u"rad/s"), Unitful.FreeUnits{F, dimension(u"rad/s"), nothing}}
    end
        function AngularVelocity(x::Number=0u"rad/s", y::Number=0u"rad/s", z::Number=0u"rad/s")
            x, y, z = correct_units(x, y, z, u"rad/s")
            return AngularVelocity(x, y, z)
        end
        AngularVelocity(args) = AngularVelocity(args...)

    struct AngularAcceleration{A,B,C,D,E,F} <: PhysicsVector where {A,B,C,D,E,F}
        x::Quantity{A, dimension(u"rad/s^2"), Unitful.FreeUnits{D, dimension(u"rad/s^2"), nothing}}
        y::Quantity{B, dimension(u"rad/s^2"), Unitful.FreeUnits{E, dimension(u"rad/s^2"), nothing}}
        z::Quantity{C, dimension(u"rad/s^2"), Unitful.FreeUnits{F, dimension(u"rad/s^2"), nothing}}
    end
        function AngularAcceleration(x::Number=0u"rad/s^2", y::Number=0u"rad/s^2", z::Number=0u"rad/s^2")
            x, y, z = correct_units(x, y, z, u"rad/s^2")
            return AngularAcceleration(x, y, z)
        end
        AngularAcceleration(args) = AngularAcceleration(args...)

    struct Momentum{A,B,C,D,E,F} <: PhysicsVector where {A,B,C,D,E,F}
        x::Quantity{A, dimension(u"kg*m/s"), Unitful.FreeUnits{D, dimension(u"kg*m/s"), nothing}}
        y::Quantity{B, dimension(u"kg*m/s"), Unitful.FreeUnits{E, dimension(u"kg*m/s"), nothing}}
        z::Quantity{C, dimension(u"kg*m/s"), Unitful.FreeUnits{F, dimension(u"kg*m/s"), nothing}}
    end
        function Momentum(x::Number=0u"kg*m/s", y::Number=0u"kg*m/s", z::Number=0u"kg*m/s")
            x, y, z = correct_units(x, y, z, u"kg*m/s")
            return Momentum(x, y, z)
        end
        Momentum(args) = Momentum(args...)

    struct AngularMomentum{A,B,C,D,E,F} <: PhysicsVector where {A,B,C,D,E,F}
        x::Quantity{A, dimension(u"N*m*s"), Unitful.FreeUnits{D, dimension(u"N*m*s"), nothing}}
        y::Quantity{B, dimension(u"N*m*s"), Unitful.FreeUnits{E, dimension(u"N*m*s"), nothing}}
        z::Quantity{C, dimension(u"N*m*s"), Unitful.FreeUnits{F, dimension(u"N*m*s"), nothing}}
    end
        function AngularMomentum(x::Number=0u"N*m*s", y::Number=0u"N*m*s", z::Number=0u"N*m*s")
            x, y, z = correct_units(x, y, z, u"N*m*s")
            return AngularMomentum(x, y, z)
        end
        AngularMomentum(args) = AngularMomentum(args...)

    struct Torque{A,B,C,D,E,F} <: PhysicsVector where {A,B,C,D,E,F}
        x::Quantity{A, dimension(u"N*m"), Unitful.FreeUnits{D, dimension(u"N*m"), nothing}}
        y::Quantity{B, dimension(u"N*m"), Unitful.FreeUnits{E, dimension(u"N*m"), nothing}}
        z::Quantity{C, dimension(u"N*m"), Unitful.FreeUnits{F, dimension(u"N*m"), nothing}}
    end
        function Torque(x::Number=0u"N*m", y::Number=0u"N*m", z::Number=0u"N*m")
            x, y, z = correct_units(x, y, z, u"N*m")
            return Torque(x, y, z)
        end
        Torque(args) = Torque(args...)

    struct ElectricDisplacementField{A,B,C,D,E,F} <: PhysicsVector where {A,B,C,D,E,F}
        x::Quantity{A, dimension(u"C/m^2"), Unitful.FreeUnits{D, dimension(u"C/m^2"), nothing}}
        y::Quantity{B, dimension(u"C/m^2"), Unitful.FreeUnits{E, dimension(u"C/m^2"), nothing}}
        z::Quantity{C, dimension(u"C/m^2"), Unitful.FreeUnits{F, dimension(u"C/m^2"), nothing}}
    end
        function ElectricDisplacementField(x::Number=0u"C/m^2", y::Number=0u"C/m^2", z::Number=0u"C/m^2")
            x, y, z = correct_units(x, y, z, u"C/m^2")
            return ElectricDisplacementField(x, y, z)
        end
        ElectricDisplacementField(args) = ElectricDisplacementField(args...)

    struct CurrentDensity{A,B,C,D,E,F} <: PhysicsVector where {A,B,C,D,E,F}
        x::Quantity{A, dimension(u"A/m^2"), Unitful.FreeUnits{D, dimension(u"A/m^2"), nothing}}
        y::Quantity{B, dimension(u"A/m^2"), Unitful.FreeUnits{E, dimension(u"A/m^2"), nothing}}
        z::Quantity{C, dimension(u"A/m^2"), Unitful.FreeUnits{F, dimension(u"A/m^2"), nothing}}
    end
        function CurrentDensity(x::Number=0u"A/m^2", y::Number=0u"A/m^2", z::Number=0u"A/m^2")
            x, y, z = correct_units(x, y, z, u"A/m^2")
            return CurrentDensity(x, y, z)
        end
        CurrentDensity(args) = CurrentDensity(args...)

    struct ElectricFieldStrength{A,B,C,D,E,F} <: PhysicsVector where {A,B,C,D,E,F}
        x::Quantity{A, dimension(u"N/C"), Unitful.FreeUnits{D, dimension(u"N/C"), nothing}}
        y::Quantity{B, dimension(u"N/C"), Unitful.FreeUnits{E, dimension(u"N/C"), nothing}}
        z::Quantity{C, dimension(u"N/C"), Unitful.FreeUnits{F, dimension(u"N/C"), nothing}}
    end
        function ElectricFieldStrength(x::Number=0u"N/C", y::Number=0u"N/C", z::Number=0u"N/C")
            x, y, z = correct_units(x, y, z, u"N/C")
            return ElectricFieldStrength(x, y, z)
        end
        ElectricFieldStrength(args) = ElectricFieldStrength(args...)

    struct MagneticFieldStrength{A,B,C,D,E,F} <: PhysicsVector where {A,B,C,D,E,F}
        x::Quantity{A, dimension(u"A/m"), Unitful.FreeUnits{D, dimension(u"A/m"), nothing}}
        y::Quantity{B, dimension(u"A/m"), Unitful.FreeUnits{E, dimension(u"A/m"), nothing}}
        z::Quantity{C, dimension(u"A/m"), Unitful.FreeUnits{F, dimension(u"A/m"), nothing}}
    end
        function MagneticFieldStrength(x::Number=0u"A/m", y::Number=0u"A/m", z::Number=0u"A/m")
            x, y, z = correct_units(x, y, z, u"A/m")
            return MagneticFieldStrength(x, y, z)
        end
        MagneticFieldStrength(args) = MagneticFieldStrength(args...)

    struct MagneticDipoleMoment{A,B,C,D,E,F} <: PhysicsVector where {A,B,C,D,E,F}
        x::Quantity{A, dimension(u"J/T"), Unitful.FreeUnits{D, dimension(u"J/T"), nothing}}
        y::Quantity{B, dimension(u"J/T"), Unitful.FreeUnits{E, dimension(u"J/T"), nothing}}
        z::Quantity{C, dimension(u"J/T"), Unitful.FreeUnits{F, dimension(u"J/T"), nothing}}
    end
        function MagneticDipoleMoment(x::Number=0u"J/T", y::Number=0u"J/T", z::Number=0u"J/T")
            x, y, z = correct_units(x, y, z, u"J/T")
            return MagneticDipoleMoment(x, y, z)
        end
        MagneticDipoleMoment(args) = MagneticDipoleMoment(args...)

    struct MagneticVectorPotential{A,B,C,D,E,F} <: PhysicsVector where {A,B,C,D,E,F}
        x::Quantity{A, dimension(u"Wb/m"), Unitful.FreeUnits{D, dimension(u"Wb/m"), nothing}}
        y::Quantity{B, dimension(u"Wb/m"), Unitful.FreeUnits{E, dimension(u"Wb/m"), nothing}}
        z::Quantity{C, dimension(u"Wb/m"), Unitful.FreeUnits{F, dimension(u"Wb/m"), nothing}}
    end
        function MagneticVectorPotential(x::Number=0u"Wb/m", y::Number=0u"Wb/m", z::Number=0u"Wb/m")
            x, y, z = correct_units(x, y, z, u"Wb/m")
            return MagneticVectorPotential(x, y, z)
        end
        MagneticVectorPotential(args) = MagneticVectorPotential(args...)
