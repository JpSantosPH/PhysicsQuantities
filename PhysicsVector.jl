using LinearAlgebra
using Unitful

abstract type PhysicsVector <: AbstractVector{Number} end
    Base.size(PV::PhysicsVector) = (3,)
    function Base.getindex(PV::PhysicsVector, i::Int)
        if i == 1
            return PV.x
        elseif i == 2
            return PV.y
        elseif i == 3
            return PV.z
        end
    end
    Base.similar(PV::PhysicsVector) = PhysicsVector(PV.x, PV.y, PV.z)
    function Base.setindex!(PV::PhysicsVector, val, i::Int)
        if i == 1
            return PhysicsVector(val, PV.y, PV.x)
        elseif i == 2
            return PhysicsVector(PV.x, val, PV.z)
        elseif i == 3
            return PhysicsVector(PV.x, PV.y, val)
        end
    end

    struct CartesianCoordinate <: PhysicsVector
        x::AbstractFloat
        y::AbstractFloat
        z::AbstractFloat

        function CartesianCoordinate(x::Number=0.0, y::Number=0.0, z::Number=0.0)
            if !(x isa AbstractFloat)
                x = convert(Float64, x)
            end
            if !(y isa AbstractFloat)
                y = convert(Float64, y)
            end
            if !(z isa AbstractFloat)
                z = convert(Float64, z)
            end
            return new(x, y, z)
        end
    end
        CartesianCoordinate(args) = CartesianCoordinate(args...)

    struct GeneralVector{T<:AbstractFloat} <: PhysicsVector
        x::T
        y::T
        z::T
    end
        Base.showarg(io::IO, GV::GeneralVector, toplevel) = print(io, :GeneralVector)
        GeneralVector( (x, y, z) ) = GeneralVector(x, y, z)
        GeneralVector() = GeneralVector(0.0, 0.0, 0.0)
    
### Named units derived from SI base units ###
    struct Position <: PhysicsVector
        x::Quantity{AbstractFloat, dimension(u"m")}
        y::Quantity{AbstractFloat, dimension(u"m")}
        z::Quantity{AbstractFloat, dimension(u"m")}

        function Position(x::Number=0.0u"m", y::Number=0.0u"m", z::Number=0.0u"m")
            if !(x isa Quantity)
                x = x * u"m"
            end
            if !(y isa Quantity)
                y = y * u"m"
            end
            if !(z isa Quantity)
                z = z * u"m"
            end
            return new(x, y, z)
        end
    end
        Position(args) = Position(args...)

    struct Force <: PhysicsVector
        x::Quantity{AbstractFloat, dimension(u"N")}
        y::Quantity{AbstractFloat, dimension(u"N")}
        z::Quantity{AbstractFloat, dimension(u"N")}

        function Force(x::Number=0.0u"N", y::Number=0.0u"N", z::Number=0.0u"N")
            if !(x isa Quantity)
                x = x * u"N"
            end
            if !(y isa Quantity)
                y = y * u"N"
            end
            if !(z isa Quantity)
                z = z * u"N"
            end
            return new(x, y, z)
        end
    end
        Force(args) = Force(args...)

### Kinematic SI derived units ###
    struct Velocity <: PhysicsVector
        x::Quantity{AbstractFloat, dimension(u"m/s")}
        y::Quantity{AbstractFloat, dimension(u"m/s")}
        z::Quantity{AbstractFloat, dimension(u"m/s")}

        function Velocity(x::Number=0.0u"m/s", y::Number=0.0u"m/s", z::Number=0.0u"m/s")
            if !isa(x, Quantity)
                x = x * u"m/s"
            end
            if !isa(y, Quantity)
                y = y * u"m/s"
            end
            if !isa(z, Quantity)
                z = z * u"m/s"
            end
            return new(x, y, z)
        end
    end
        Velocity(args) = Velocity(args...)

    struct Acceleration <: PhysicsVector
        x::Quantity{AbstractFloat, dimension(u"m/s^2")}
        y::Quantity{AbstractFloat, dimension(u"m/s^2")}
        z::Quantity{AbstractFloat, dimension(u"m/s^2")}

        function Acceleration(x::Number=0.0u"m/s^2", y::Number=0.0u"m/s^2", z::Number=0.0u"m/s^2")
            if !isa(x, Quantity)
                x = x * u"m/s^2"
            end
            if !isa(y, Quantity)
                y = y * u"m/s^2"
            end
            if !isa(z, Quantity)
                z = z * u"m/s^2"
            end
            return new(x, y, z)
        end
    end
        Acceleration(args) = Acceleration(args...)
    
    struct Jerk <: PhysicsVector
    x::Quantity{AbstractFloat, dimension(u"m/s^3")}
    y::Quantity{AbstractFloat, dimension(u"m/s^3")}
    z::Quantity{AbstractFloat, dimension(u"m/s^3")}

    function Jerk(x::Number=0.0u"m/s^3", y::Number=0.0u"m/s^3", z::Number=0.0u"m/s^3")
        if !isa(x, Quantity)
            x = x * u"m/s^3"
        end
        if !isa(y, Quantity)
            y = y * u"m/s^3"
        end
        if !isa(z, Quantity)
            z = z * u"m/s^3"
        end
        return new(x, y, z)
    end
end
    Jerk(args) = Jerk(args...)

    struct Snap <: PhysicsVector
        x::Quantity{AbstractFloat, dimension(u"m/s^4")}
        y::Quantity{AbstractFloat, dimension(u"m/s^4")}
        z::Quantity{AbstractFloat, dimension(u"m/s^4")}
    
        function Snap(x::Number=0.0u"m/s^4", y::Number=0.0u"m/s^4", z::Number=0.0u"m/s^4")
            if !isa(x, Quantity)
                x = x * u"m/s^4"
            end
            if !isa(y, Quantity)
                y = y * u"m/s^4"
            end
            if !isa(z, Quantity)
                z = z * u"m/s^4"
            end
            return new(x, y, z)
        end
    end
        Snap(args) = Snap(args...)

    struct AngularVelocity <: PhysicsVector
        x::Quantity{AbstractFloat, dimension(u"rad/s")}
        y::Quantity{AbstractFloat, dimension(u"rad/s")}
        z::Quantity{AbstractFloat, dimension(u"rad/s")}

        function AngularVelocity(x::Number=0.0u"rad/s", y::Number=0.0u"rad/s", z::Number=0.0u"rad/s")
            if !isa(x, Quantity)
                x = x * u"rad/s"
            end
            if !isa(y, Quantity)
                y = y * u"rad/s"
            end
            if !isa(z, Quantity)
                z = z * u"rad/s"
            end
            return new(x, y, z)
        end
    end
        AngularVelocity(args) = AngularVelocity(args...)

    struct AngularAcceleration <: PhysicsVector
        x::Quantity{AbstractFloat, dimension(u"rad/s^2")}
        y::Quantity{AbstractFloat, dimension(u"rad/s^2")}
        z::Quantity{AbstractFloat, dimension(u"rad/s^2")}

        function AngularAcceleration(x::Number=0.0u"rad/s^2", y::Number=0.0u"rad/s^2", z::Number=0.0u"rad/s^2")
            if !isa(x, Quantity)
                x = x * u"rad/s^2"
            end
            if !isa(y, Quantity)
                y = y * u"rad/s^2"
            end
            if !isa(z, Quantity)
                z = z * u"rad/s^2"
            end
            return new(x, y, z)
        end
    end
        AngularAcceleration(args) = AngularAcceleration(args...)

    struct Momentum <: PhysicsVector
        x::Quantity{AbstractFloat, dimension(u"kg*m/s")}
        y::Quantity{AbstractFloat, dimension(u"kg*m/s")}
        z::Quantity{AbstractFloat, dimension(u"kg*m/s")}

        function Momentum(x::Number=0.0u"kg*m/s", y::Number=0.0u"kg*m/s", z::Number=0.0u"kg*m/s")
            if !isa(x, Quantity)
                x = x * u"kg*m/s"
            end
            if !isa(y, Quantity)
                y = y * u"kg*m/s"
            end
            if !isa(z, Quantity)
                z = z * u"kg*m/s"
            end
            return new(x, y, z)
        end
    end
        Momentum(args) = Momentum(args...)
        
    struct AngularMomentum <: PhysicsVector
        x::Quantity{AbstractFloat, dimension(u"N*m*s")}
        y::Quantity{AbstractFloat, dimension(u"N*m*s")}
        z::Quantity{AbstractFloat, dimension(u"N*m*s")}

        function AngularMomentum(x::Number=0.0u"N*m*s", y::Number=0.0u"N*m*s", z::Number=0.0u"N*m*s")
            if !isa(x, Quantity)
                x = x * u"N*m*s"
            end
            if !isa(y, Quantity)
                y = y * u"N*m*s"
            end
            if !isa(z, Quantity)
                z = z * u"N*m*s"
            end
            return new(x, y, z)
        end
    end
        AngularMomentum(args) = AngularMomentum(args...)

    struct Torque <: PhysicsVector
        x::Quantity{AbstractFloat, dimension(u"N*m")}
        y::Quantity{AbstractFloat, dimension(u"N*m")}
        z::Quantity{AbstractFloat, dimension(u"N*m")}

        function Torque(x::Number=0.0u"N*m", y::Number=0.0u"N*m", z::Number=0.0u"N*m")
            if !isa(x, Quantity)
                x = x * u"N*m"
            end
            if !isa(y, Quantity)
                y = y * u"N*m"
            end
            if !isa(z, Quantity)
                z = z * u"N*m"
            end
            return new(x, y, z)
        end
    end
        Torque(args) = Torque(args...)

    struct ElectricFieldStrength <: PhysicsVector
        x::Quantity{AbstractFloat, dimension(u"N/C")}
        y::Quantity{AbstractFloat, dimension(u"N/C")}
        z::Quantity{AbstractFloat, dimension(u"N/C")}
    end
        ElectricFieldStrength( (x, y, z) ) = ElectricFieldStrength(x, y, z)