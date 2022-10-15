abstract type PhysicsVector <: AbstractVector{Number} end
    Base.size(PV::PhysicsVector) = (3,)
    function Base.getindex(PV::PhysicsVector, i::Int)
        if     i == 1; return PV.x
        elseif i == 2; return PV.y
        elseif i == 3; return PV.z
        end
    end
    Base.similar(PV::PhysicsVector) = PhysicsVector(PV.x, PV.y, PV.z)
    function Base.setindex!(PV::PhysicsVector, val, i::Int)
        val = ps_strip(val)
        if     i == 1; return PhysicsVector(val,  PV.y, PV.z)
        elseif i == 2; return PhysicsVector(PV.x, val,  PV.z)
        elseif i == 3; return PhysicsVector(PV.x, PV.y, val )
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
        Base.showarg(io::IO, V::GeneralVector, toplevel) = print(io, GeneralVector)
        GeneralVector( (x, y, z) ) = GeneralVector(x, y, z)
        GeneralVector() = GeneralVector(0, 0, 0)

    struct CartesianCoordinate{T<:Number} <: PhysicsVector
        x::T
        y::T
        z::T
    end
        function CartesianCoordinate(x::Number=0, y::Number=0, z::Number=0)
            x, y, z = convert.(<:Number, (x, y, z))
            return CartesianCoordinate(x, y, z)
        end
        CartesianCoordinate(args) = CartesianCoordinate(args...)
        Base.showarg(io::IO, V::CartesianCoordinate, toplevel) = print(io, CartesianCoordinate)

    struct Position{A,B,C} <: PhysicsVector where {A,B,C}
        x::Quantity{<:Number, dimension(u"m"), Unitful.FreeUnits{A, dimension(u"m"), nothing}}
        y::Quantity{<:Number, dimension(u"m"), Unitful.FreeUnits{B, dimension(u"m"), nothing}}
        z::Quantity{<:Number, dimension(u"m"), Unitful.FreeUnits{C, dimension(u"m"), nothing}}
    end
        function Position(x::Number=0u"m", y::Number=0u"m", z::Number=0u"m")
            if !(x isa Quantity); x = x*u"m" end
            if !(y isa Quantity); y = y*u"m" end
            if !(z isa Quantity); z = z*u"m" end
            return Position(x, y, z)
        end
        Base.showarg(io::IO, V::Position, toplevel) = print(io, Position)
        Position(args) = Position(args...)

    struct Force{A,B,C} <: PhysicsVector where {A,B,C}
        x::Quantity{<:Number, dimension(u"N"), Unitful.FreeUnits{A, dimension(u"N"), nothing}}
        y::Quantity{<:Number, dimension(u"N"), Unitful.FreeUnits{B, dimension(u"N"), nothing}}
        z::Quantity{<:Number, dimension(u"N"), Unitful.FreeUnits{C, dimension(u"N"), nothing}}
    end
        function Force(x::Number=0u"N", y::Number=0u"N", z::Number=0u"N")
            if !(x isa Quantity); x = x*u"N" end
            if !(y isa Quantity); y = y*u"N" end
            if !(z isa Quantity); z = z*u"N" end
            x, y, z = convert.(Quantity{<:Number, dimension(u"N")}, (x, y, z))
            return Force(x, y, z)
        end
        Base.showarg(io::IO, V::Force, toplevel) = print(io, Force)
        Force(args) = Force(args...)

    struct Velocity{A,B,C}  <: PhysicsVector where {A,B,C}
        x::Quantity{<:Number, dimension(u"m/s"), Unitful.FreeUnits{A, dimension(u"m/s"), nothing}}
        y::Quantity{<:Number, dimension(u"m/s"), Unitful.FreeUnits{B, dimension(u"m/s"), nothing}}
        z::Quantity{<:Number, dimension(u"m/s"), Unitful.FreeUnits{C, dimension(u"m/s"), nothing}}
    end
        function Velocity(x::Number=0u"m/s", y::Number=0u"m/s", z::Number=0u"m/s")
            if !(x isa Quantity); x = x*u"m/s" end
            if !(y isa Quantity); y = y*u"m/s" end
            if !(z isa Quantity); z = z*u"m/s" end
            x, y, z = convert.(Quantity{<:Number, dimension(u"m/s")}, (x, y, z))
            return Velocity(x, y, z)
        end
        Base.showarg(io::IO, V::Velocity, toplevel) = print(io, Velocity)
        Velocity(args) = Velocity(args...)

    struct Acceleration{A,B,C} <: PhysicsVector where {A,B,C}
        x::Quantity{<:Number, dimension(u"m/s^2"), Unitful.FreeUnits{A, dimension(u"m/s^2"), nothing}}
        y::Quantity{<:Number, dimension(u"m/s^2"), Unitful.FreeUnits{B, dimension(u"m/s^2"), nothing}}
        z::Quantity{<:Number, dimension(u"m/s^2"), Unitful.FreeUnits{C, dimension(u"m/s^2"), nothing}}
    end
        function Acceleration(x::Number=0u"m/s^2", y::Number=0u"m/s^2", z::Number=0u"m/s^2")
            if !(x isa Quantity); x = x*u"m/s^2" end
            if !(y isa Quantity); y = y*u"m/s^2" end
            if !(z isa Quantity); z = z*u"m/s^2" end
            x, y, z = convert.(Quantity{<:Number, dimension(u"m/s^2")}, (x, y, z))
            return Acceleration(x, y, z)
        end
        Base.showarg(io::IO, V::Acceleration, toplevel) = print(io, Acceleration)
        Acceleration(args) = Acceleration(args...)
    
    struct Jerk{A,B,C} <: PhysicsVector where {A,B,C}
        x::Quantity{<:Number, dimension(u"m/s^3"), Unitful.FreeUnits{A, dimension(u"m/s^3"), nothing}}
        y::Quantity{<:Number, dimension(u"m/s^3"), Unitful.FreeUnits{B, dimension(u"m/s^3"), nothing}}
        z::Quantity{<:Number, dimension(u"m/s^3"), Unitful.FreeUnits{C, dimension(u"m/s^3"), nothing}}
    end
        function Jerk(x::Number=0u"m/s^3", y::Number=0u"m/s^3", z::Number=0u"m/s^3")
            if !(x isa Quantity); x = x*u"m/s^3" end
            if !(y isa Quantity); y = y*u"m/s^3" end
            if !(z isa Quantity); z = z*u"m/s^3" end
            x, y, z = convert.(Quantity{<:Number, dimension(u"m/s^3")}, (x, y, z))
            return Jerk(x, y, z)
        end
        Base.showarg(io::IO, V::Jerk, toplevel) = print(io, Jerk)
        Jerk(args) = Jerk(args...)

    struct Snap{A,B,C} <: PhysicsVector where {A,B,C}
        x::Quantity{<:Number, dimension(u"m/s^4"), Unitful.FreeUnits{A, dimension(u"m/s^4"), nothing}}
        y::Quantity{<:Number, dimension(u"m/s^4"), Unitful.FreeUnits{B, dimension(u"m/s^4"), nothing}}
        z::Quantity{<:Number, dimension(u"m/s^4"), Unitful.FreeUnits{C, dimension(u"m/s^4"), nothing}}
    end
        function Snap(x::Number=0u"m/s^4", y::Number=0u"m/s^4", z::Number=0u"m/s^4")
            if !(x isa Quantity); x = x*u"m/s^4" end
            if !(y isa Quantity); y = y*u"m/s^4" end
            if !(z isa Quantity); z = z*u"m/s^4" end
            x, y, z = convert.(Quantity{<:Number, dimension(u"m/s^4")}, (x, y, z))
            return Snap(x, y, z)
        end
        Base.showarg(io::IO, V::Snap, toplevel) = print(io, Snap)
        Snap(args) = Snap(args...)

    struct AngularVelocity{A,B,C} <: PhysicsVector where {A,B,C}
        x::Quantity{<:Number, dimension(u"rad/s"), Unitful.FreeUnits{A, dimension(u"rad/s"), nothing}}
        y::Quantity{<:Number, dimension(u"rad/s"), Unitful.FreeUnits{B, dimension(u"rad/s"), nothing}}
        z::Quantity{<:Number, dimension(u"rad/s"), Unitful.FreeUnits{C, dimension(u"rad/s"), nothing}}
    end
        function AngularVelocity(x::Number=0u"rad/s", y::Number=0u"rad/s", z::Number=0u"rad/s")
            if !(x isa Quantity); x = x*u"rad/s" end
            if !(y isa Quantity); y = y*u"rad/s" end
            if !(z isa Quantity); z = z*u"rad/s" end
            x, y, z = convert.(Quantity{<:Number, dimension(u"rad/s")}, (x, y, z))
            return AngularVelocity(x, y, z)
        end
        Base.showarg(io::IO, V::AngularVelocity, toplevel) = print(io, AngularVelocity)
        AngularVelocity(args) = AngularVelocity(args...)

    struct AngularAcceleration{A,B,C} <: PhysicsVector where {A,B,C}
        x::Quantity{<:Number, dimension(u"rad/s^2"), Unitful.FreeUnits{A, dimension(u"rad/s^2"), nothing}}
        y::Quantity{<:Number, dimension(u"rad/s^2"), Unitful.FreeUnits{B, dimension(u"rad/s^2"), nothing}}
        z::Quantity{<:Number, dimension(u"rad/s^2"), Unitful.FreeUnits{C, dimension(u"rad/s^2"), nothing}}
    end
        function AngularAcceleration(x::Number=0u"rad/s^2", y::Number=0u"rad/s^2", z::Number=0u"rad/s^2")
            if !(x isa Quantity); x = x*u"rad/s^2" end
            if !(y isa Quantity); y = y*u"rad/s^2" end
            if !(z isa Quantity); z = z*u"rad/s^2" end
            x, y, z = convert.(Quantity{<:Number, dimension(u"rad/s^2")}, (x, y, z))
            return AngularAcceleration(x, y, z)
        end
        Base.showarg(io::IO, V::AngularAcceleration, toplevel) = print(io, AngularAcceleration)
        AngularAcceleration(args) = AngularAcceleration(args...)

    struct Momentum{A,B,C} <: PhysicsVector where {A,B,C}
        x::Quantity{<:Number, dimension(u"kg*m/s"), Unitful.FreeUnits{A, dimension(u"kg*m/s"), nothing}}
        y::Quantity{<:Number, dimension(u"kg*m/s"), Unitful.FreeUnits{B, dimension(u"kg*m/s"), nothing}}
        z::Quantity{<:Number, dimension(u"kg*m/s"), Unitful.FreeUnits{C, dimension(u"kg*m/s"), nothing}}
    end
        function Momentum(x::Number=0u"kg*m/s", y::Number=0u"kg*m/s", z::Number=0u"kg*m/s")
            if !(x isa Quantity); x = x*u"kg*m/s" end
            if !(y isa Quantity); y = y*u"kg*m/s" end
            if !(z isa Quantity); z = z*u"kg*m/s" end
            x, y, z = convert.(Quantity{<:Number, dimension(u"kg*m/s")}, (x, y, z))
            return Momentum(x, y, z)
        end
        Base.showarg(io::IO, V::Momentum, toplevel) = print(io, Momentum)
        Momentum(args) = Momentum(args...)
        
    struct AngularMomentum{A,B,C} <: PhysicsVector where {A,B,C}
        x::Quantity{<:Number, dimension(u"N*m*s"), Unitful.FreeUnits{A, dimension(u"N*m*s"), nothing}}
        y::Quantity{<:Number, dimension(u"N*m*s"), Unitful.FreeUnits{B, dimension(u"N*m*s"), nothing}}
        z::Quantity{<:Number, dimension(u"N*m*s"), Unitful.FreeUnits{C, dimension(u"N*m*s"), nothing}}
    end
        function AngularMomentum(x::Number=0u"N*m*s", y::Number=0u"N*m*s", z::Number=0u"N*m*s")
            if !(x isa Quantity); x = x*u"N*m*s" end
            if !(y isa Quantity); y = y*u"N*m*s" end
            if !(z isa Quantity); z = z*u"N*m*s" end
            x, y, z = convert.(Quantity{<:Number, dimension(u"N*m*s")}, (x, y, z))
            return AngularMomentum(x, y, z)
        end
        Base.showarg(io::IO, V::AngularMomentum, toplevel) = print(io, AngularMomentum)
        AngularMomentum(args) = AngularMomentum(args...)

    struct Torque{A,B,C} <: PhysicsVector where {A,B,C}
        x::Quantity{<:Number, dimension(u"N*m"), Unitful.FreeUnits{A, dimension(u"N*m"), nothing}}
        y::Quantity{<:Number, dimension(u"N*m"), Unitful.FreeUnits{B, dimension(u"N*m"), nothing}}
        z::Quantity{<:Number, dimension(u"N*m"), Unitful.FreeUnits{C, dimension(u"N*m"), nothing}}
    end
        function Torque(x::Number=0u"N*m", y::Number=0u"N*m", z::Number=0u"N*m")
            if !(x isa Quantity); x = x*u"N*m" end
            if !(y isa Quantity); y = y*u"N*m" end
            if !(z isa Quantity); z = z*u"N*m" end
            x, y, z = convert.(Quantity{<:Number, dimension(u"N*m")}, (x, y, z))
            return Torque(x, y, z)
        end
        Base.showarg(io::IO, V::Torque, toplevel) = print(io, Torque)
        Torque(args) = Torque(args...)

    struct ElectricDisplacementField{A,B,C} <: PhysicsVector where {A,B,C}
        x::Quantity{<:Number, dimension(u"C/m^2"), Unitful.FreeUnits{A, dimension(u"C/m^2"), nothing}}
        y::Quantity{<:Number, dimension(u"C/m^2"), Unitful.FreeUnits{B, dimension(u"C/m^2"), nothing}}
        z::Quantity{<:Number, dimension(u"C/m^2"), Unitful.FreeUnits{C, dimension(u"C/m^2"), nothing}}
    end
        function ElectricDisplacementField(x::Number=0u"C/m^2", y::Number=0u"C/m^2", z::Number=0u"C/m^2")
            if !(x isa Quantity); x = x*u"C/m^2" end
            if !(y isa Quantity); y = y*u"C/m^2" end
            if !(z isa Quantity); z = z*u"C/m^2" end
            x, y, z = convert.(Quantity{<:Number, dimension(u"C/m^2")}, (x, y, z))
            return ElectricDisplacementField(x, y, z)
        end
        Base.showarg(io::IO, V::ElectricDisplacementField, toplevel) = print(io, ElectricDisplacementField)
        ElectricDisplacementField(args) = ElectricDisplacementField(args...)

    struct CurrentDensity{A,B,C} <: PhysicsVector where {A,B,C}
        x::Quantity{<:Number, dimension(u"A/m^2"), Unitful.FreeUnits{A, dimension(u"A/m^2"), nothing}}
        y::Quantity{<:Number, dimension(u"A/m^2"), Unitful.FreeUnits{B, dimension(u"A/m^2"), nothing}}
        z::Quantity{<:Number, dimension(u"A/m^2"), Unitful.FreeUnits{C, dimension(u"A/m^2"), nothing}}
    end
        function CurrentDensity(x::Number=0u"A/m^2", y::Number=0u"A/m^2", z::Number=0u"A/m^2")
            if !(x isa Quantity); x = x*u"A/m^2" end
            if !(y isa Quantity); y = y*u"A/m^2" end
            if !(z isa Quantity); z = z*u"A/m^2" end
            x, y, z = convert.(Quantity{<:Number, dimension(u"A/m^2")}, (x, y, z))
            return CurrentDensity(x, y, z)
        end
        Base.showarg(io::IO, V::CurrentDensity, toplevel) = print(io, CurrentDensity)
        CurrentDensity(args) = CurrentDensity(args...)

    struct ElectricFieldStrength{A,B,C} <: PhysicsVector where {A,B,C}
        x::Quantity{<:Number, dimension(u"N/C"), Unitful.FreeUnits{A, dimension(u"N/C"), nothing}}
        y::Quantity{<:Number, dimension(u"N/C"), Unitful.FreeUnits{B, dimension(u"N/C"), nothing}}
        z::Quantity{<:Number, dimension(u"N/C"), Unitful.FreeUnits{C, dimension(u"N/C"), nothing}}
    end
        function ElectricFieldStrength(x::Number=0u"N/C", y::Number=0u"N/C", z::Number=0u"N/C")
            if !(x isa Quantity); x = x*u"N/C" end
            if !(y isa Quantity); y = y*u"N/C" end
            if !(z isa Quantity); z = z*u"N/C" end
            x, y, z = convert.(Quantity{<:Number, dimension(u"N/C")}, (x, y, z))
            return ElectricFieldStrength(x, y, z)
        end
        Base.showarg(io::IO, V::ElectricFieldStrength, toplevel) = print(io, ElectricFieldStrength)
        ElectricFieldStrength(args) = ElectricFieldStrength(args...)

    struct MagneticFieldStrength{A,B,C} <: PhysicsVector where {A,B,C}
        x::Quantity{<:Number, dimension(u"A/m"), Unitful.FreeUnits{A, dimension(u"A/m"), nothing}}
        y::Quantity{<:Number, dimension(u"A/m"), Unitful.FreeUnits{B, dimension(u"A/m"), nothing}}
        z::Quantity{<:Number, dimension(u"A/m"), Unitful.FreeUnits{C, dimension(u"A/m"), nothing}}
    end
        function MagneticFieldStrength(x::Number=0u"A/m", y::Number=0u"A/m", z::Number=0u"A/m")
            if !(x isa Quantity); x = x*u"A/m" end
            if !(y isa Quantity); y = y*u"A/m" end
            if !(z isa Quantity); z = z*u"A/m" end
            x, y, z = convert.(Quantity{<:Number, dimension(u"A/m")}, (x, y, z))
            return MagneticFieldStrength(x, y, z)
        end
        Base.showarg(io::IO, V::MagneticFieldStrength, toplevel) = print(io, MagneticFieldStrength)
        MagneticFieldStrength(args) = MagneticFieldStrength(args...)

    struct MagneticDipoleMoment{A,B,C} <: PhysicsVector where {A,B,C}
        x::Quantity{<:Number, dimension(u"J/T"), Unitful.FreeUnits{A, dimension(u"J/T"), nothing}}
        y::Quantity{<:Number, dimension(u"J/T"), Unitful.FreeUnits{B, dimension(u"J/T"), nothing}}
        z::Quantity{<:Number, dimension(u"J/T"), Unitful.FreeUnits{C, dimension(u"J/T"), nothing}}
    end
        function MagneticDipoleMoment(x::Number=0u"J/T", y::Number=0u"J/T", z::Number=0u"J/T")
            if !(x isa Quantity); x = x*u"J/T" end
            if !(y isa Quantity); y = y*u"J/T" end
            if !(z isa Quantity); z = z*u"J/T" end
            x, y, z = convert.(Quantity{<:Number, dimension(u"J/T")}, (x, y, z))
            return MagneticDipoleMoment(x, y, z)
        end
        Base.showarg(io::IO, V::MagneticDipoleMoment, toplevel) = print(io, MagneticDipoleMoment)
        MagneticDipoleMoment(args) = MagneticDipoleMoment(args...)

    struct MagneticVectorPotential{A,B,C} <: PhysicsVector where {A,B,C}
        x::Quantity{<:Number, dimension(u"Wb/m"), Unitful.FreeUnits{A, dimension(u"Wb/m"), nothing}}
        y::Quantity{<:Number, dimension(u"Wb/m"), Unitful.FreeUnits{B, dimension(u"Wb/m"), nothing}}
        z::Quantity{<:Number, dimension(u"Wb/m"), Unitful.FreeUnits{C, dimension(u"Wb/m"), nothing}}
    end
        function MagneticVectorPotential(x::Number=0u"Wb/m", y::Number=0u"Wb/m", z::Number=0u"Wb/m")
            if !(x isa Quantity); x = x*u"Wb/m" end
            if !(y isa Quantity); y = y*u"Wb/m" end
            if !(z isa Quantity); z = z*u"Wb/m" end
            x, y, z = convert.(Quantity{<:Number, dimension(u"Wb/m")}, (x, y, z))
            return MagneticVectorPotential(x, y, z)
        end
        Base.showarg(io::IO, V::MagneticVectorPotential, toplevel) = print(io, MagneticVectorPotential)
        MagneticVectorPotential(args) = MagneticVectorPotential(args...)