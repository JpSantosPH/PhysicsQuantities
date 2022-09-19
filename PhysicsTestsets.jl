using Test

### PhysicsCoordinate ###
    @testset "Coordinate Functionalities" begin
        @test isa(Coordinate(1, 2, 3), CartesianCoordinate)
        @test isa(Coordinate([1, 2, 3]), CartesianCoordinate)
    end

    @testset "CartesianCoordinate Functionalities" begin
        @test isa(CartesianCoordinate(1, 2//1, 3.0), CartesianCoordinate)
        @test CartesianCoordinate( (1, 2) ) == CartesianCoordinate(1, 2, 0)
        @test let
            a = CartesianCoordinate(1, 2, 3)
            b = CartesianCoordinate(4, 4, 4)
            c = a + b
            d = CartesianCoordinate( (5÷1, 6//1, 7/1) )
            c == d
        end
        @test let
            a = normalize(CartesianCoordinate([1, 2, 3]))
            norm(a) ≈ 1 && isa(a, CartesianCoordinate)
        end
    end

### PhysicsScalar ###
    @testset "PhysicsScalar Functionalities" begin
        @test PhysicsScalar(12u"m/s") == Speed(12)
        @test Speed(1) * 23 == Speed(23)
        @test [1, 2, 3] * Speed(4.5) isa Vector{Speed}
        @test Length(123) + Length(456) == Length(579)
        @test Length(12) * Frequency(3) == Speed(36)
    end

    @testset "Unitful added Functionalities" begin
        @test dimension(Speed(12)) == dimension(12u"m/s")
    end

### SI base units ###
    @testset "Time Functionalities" begin
        @test Time(12//1000) == Time(12.0u"ms")
        @test Time() == Time(0)
    end

    @testset "Length Functionalities" begin
        @test Length(12//1000) == Length(12.0u"mm")
        @test Length() == Length(0)
    end

    @testset "Mass Functionalities" begin
        @test Mass(12//1000) == Mass(12.0u"g")
        @test Mass() == Mass(0)
    end

    @testset "Current Functionalities" begin
        @test Current(12//1000) == Current(12.0u"mA")
        @test Current() == Current(0)
    end

    @testset "Temperature Functionalities" begin
        @test Temperature(12//1000) == Temperature(12.0u"mK")
        @test Temperature() == Temperature(273.15)        
    end

### Named units derived from SI base units ###
    @testset "Frequency Functionalities" begin
        @test Frequency(12//1000) == Frequency(12.0u"mHz")
        @test Frequency() == Frequency(0)
    end

    @testset "Angle Functionalities" begin
        @test Angle(12//1000) == Angle(12.0u"mrad")
        @test Angle() == Angle(0)
        @test Angle(180u"°") == Angle(π*u"rad")
    end

    @testset "Energy Functionalities" begin
        @test Energy(12//1000) == Energy(12.0u"mJ")
        @test Energy() == Energy(0)
    end

    @testset "Pressure Functionalities" begin
        @test Pressure(12//1000) == Pressure(12.0u"Pa")
        @test Pressure() == Pressure(100)
    end

### Kinematic SI derived units ###
    @testset "Speed Functionalities" begin
        @test Speed(12//1000) == Speed(12.0u"mm/s")
        @test Speed() == Speed(0)
    end

### PhysicsVector ###
    @testset "BasisVectors Functionalities" begin
        @test let
            a = CartesianCoordinate(1, 2, 3)
            b = CartesianCoordinate(4, 5, 6)
            c = CartesianCoordinate(7, 8, 9)
            d = BasisVectors(a, b, c)
            isa(d, BasisVectors)
        end
        @test let
            BV = BasisVectors()
            a = CartesianCoordinate(1, 0, 0)
            b = CartesianCoordinate(0, 1, 0)
            c = CartesianCoordinate(0, 0, 1)
            BV.e₁ == a && BV.e₂ == b && BV.e₃ == c
        end
    end

    @testset "PhysicsVector Functionalities" begin
        @test PhysicsVector(1u"m/s", 2u"m/s", 3u"m/s") isa Velocity
    end

    @testset "Position Functionalities" begin
        @test Position(1, 2//1000; Basis=BasisVectors()) == Position(1 * u"m", 2//1 * u"mm", 0.0u"m")
        @test let
            a = CartesianCoordinate(1, 2, 3)
            b = CartesianCoordinate(4, 5, 6)
            c = CartesianCoordinate(7, 8, 9)
            d = BasisVectors(a, b, c)
            Position(1, 2, 3; Basis=d) == Position(30, 36, 42)
        end
        @test Position() == Position(0, 0, 0)
    end

    @testset "Velocity Functionalities" begin
        @test Velocity(1, 2//1000; Basis=BasisVectors()) == Velocity(1 * u"m/s", 2//1 * u"mm/s", 0.0u"m/s")
        @test let
            a = CartesianCoordinate(1, 2, 3)
            b = CartesianCoordinate(4, 5, 6)
            c = CartesianCoordinate(7, 8, 9)
            d = BasisVectors(a, b, c)
            Velocity(1, 2, 3; Basis=d) == Velocity(30, 36, 42)
        end
        @test Velocity() == Velocity(0, 0, 0)
    end

    @testset "Acceleration Functionalities" begin
        @test Acceleration(1, 2//1000; Basis=BasisVectors()) == Acceleration(1 * u"m/s^2", 2//1 * u"mm/s^2", 0.0u"m/s^2")
        @test let
            a = CartesianCoordinate(1, 2, 3)
            b = CartesianCoordinate(4, 5, 6)
            c = CartesianCoordinate(7, 8, 9)
            d = BasisVectors(a, b, c)
            Acceleration(1÷1, 2//1, 3/1; Basis=d) == Acceleration(30, 36, 42)
        end
        @test Acceleration() == Acceleration(0, 0, 0)
    end

### PhysicsOperators ###
    @testset "PhysicsVectorOperators" begin
        @test -Velocity(1, 2, 3) == Velocity(-1, -2, -3)
        @test Velocity(1, 2, 3) * 4 == Velocity(4, 8, 12)
        @test Position(1, 2, 3) + Position(4, 5, 6) == Position(5, 7, 9)
        @test Velocity(1, 2, 3) * Velocity(1, 2, 3) == 14u"m^2/s^2"
        @test 1/2 * Mass(10) * Velocity(3, 4)^2 == 1/2 * Mass(10) * Speed(5)^2
    end