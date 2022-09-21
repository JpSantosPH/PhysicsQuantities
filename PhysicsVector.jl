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
    function PhysicsVector(x::T, y::T, z::T) where {T<:Quantity}
        return dimension(x)(x, y, z)
    end
    function PhysicsVector(x::Float64, y::Float64, z::Float64)
        return CartesianCoordinate(x, y, z)
    end
    function PhysicsVector( (x, y, z) )
        return PhysicsVector(x, y, z)
    end

    abstract type Coordinate <: PhysicsVector end
        function Coordinate(x, y, z)
            return CartesianCoordinate(x, y, z)
        end
        function Coordinate(args)
            return Coordinate(args...)
        end
            struct CartesianCoordinate <: Coordinate
                x::Float64
                y::Float64
                z::Float64

                function CartesianCoordinate(x::Number=0.0, y::Number=0.0, z::Number=0.0)
                    if !(x isa Float64)
                        x = convert(Float64, x)
                    end
                    if !(y isa Float64)
                        y = convert(Float64, y)
                    end
                    if !(z isa Float64)
                        z = convert(Float64, z)
                    end
                    return new(x, y, z)
                end
            end
                function CartesianCoordinate(args)
                    return CartesianCoordinate(args...)
                end
            
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
        function Position(args)
            return Position(args...)
        end

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
        function Force(args)
            return Force(args...)
        end

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
        function Velocity(args)
            return Velocity(args...)
        end

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
        function Acceleration(args)
            return Acceleration(args...)
        end

    struct ElectricField <: PhysicsVector
        x::typeof(1.0u"N/C")
        y::typeof(1.0u"N/C")
        z::typeof(1.0u"N/C")
    end