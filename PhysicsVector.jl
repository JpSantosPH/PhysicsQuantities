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

    struct GeneralVector{T<:Number} <: PhysicsVector
        x::T
        y::T
        z::T
    end
        Base.showarg(io::IO, GV::GeneralVector, toplevel) = print(io, :GeneralVector)
        GeneralVector( (x, y, z) ) = GeneralVector(x, y, z)
        GeneralVector() = GeneralVector(0.0, 0.0, 0.0)
    
### Named units derived from SI base units ###
    struct Position <: PhysicsVector
        x::typeof(1.0u"m")
        y::typeof(1.0u"m")
        z::typeof(1.0u"m")

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
        x::typeof(1.0u"N")
        y::typeof(1.0u"N")
        z::typeof(1.0u"N")

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
        x::typeof(1.0u"m/s")
        y::typeof(1.0u"m/s")
        z::typeof(1.0u"m/s")

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
        x::typeof(1.0u"m/s^2")
        y::typeof(1.0u"m/s^2")
        z::typeof(1.0u"m/s^2")

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

    struct ElectricField <: PhysicsVector
        x::typeof(1.0u"N/C")
        y::typeof(1.0u"N/C")
        z::typeof(1.0u"N/C")
    end
        ElectricField( (x, y, z) ) = ElectricField(x, y, z)