using Test

### PhysicsCoordinate ###
    @testset "Coordinate Functionalities" begin
        @test isa(Coordinate(1÷1, 2//1, 3/1), CartesianCoordinate)
        @test isa(Coordinate([1÷1, 2//1, 3/1]), CartesianCoordinate)
    end

    @testset "CartesianCoordinate Functionalities" begin
        @test isa(CartesianCoordinate(1.0, 2.0, 3.0), CartesianCoordinate)
        @test isa(CartesianCoordinate(1÷1, 2//1, 3/1), CartesianCoordinate)
        @test isa(CartesianCoordinate([1÷1, 2//1, 3/1]), CartesianCoordinate)
        @test isa(CartesianCoordinate( (1÷1, 2//1, 3/1) ), CartesianCoordinate)
        @test let
            a = CartesianCoordinate( (1÷1, 2//1, 3/1) )
            b = CartesianCoordinate( [4÷1, 4//1, 4/1] )
            c = a + b
            d = CartesianCoordinate( (5÷1, 6//1, 7/1) )
            c == d
        end
        @test let
            a = normalize(CartesianCoordinate( (1÷1, 2//1, 3/1) ))
            norm(a) ≈ 1 && isa(a, CartesianCoordinate)
        end
        @test CartesianCoordinate() == CartesianCoordinate(0.0, 0.0, 0.0)
        @test CartesianCoordinate(1) == CartesianCoordinate(1.0, 0.0, 0.0)
        @test CartesianCoordinate(1, 2) == CartesianCoordinate(1.0, 2.0, 0.0)
    end
#########################

### PhysicsScalar ###
    @testset "PhysicsScalar Functionalities" begin
        @test isa(PhysicsScalar(12u"m/s"), Speed)
        @test isa(Speed(1) * 23, Speed)
        @test isa(12 * Speed(3), Speed)
        @test isa(Speed(12) * [3, 4, 5], Vector{typeof(1.0u"m/s")})
        @test isa([1, 2, 3] * Speed(4.5), Vector{typeof(1.0u"m/s")})
    end

    @testset "Unitful added Functionalities" begin
        @test dimension(Speed(12)) == dimension(12u"m/s")
    end

    @testset "Time Functionalities" begin
        @test isa(Time(12u"s"), Time)
        @test Time(12u"ms") == Time(0.012u"s")
        @test Time(12) == Time(12.0u"s")
    end

    @testset "Length Functionalities" begin
        @test isa(Length(12u"m"), Length)
        @test Length(12u"mm") == Length(0.012u"m")
        @test Length(12) == Length(12.0u"m")
    end

    @testset "Mass Functionalities" begin
        @test isa(Mass(12u"kg"), Mass)
        @test  Mass(12000u"g") == Mass(12.0u"kg")
        @test Mass(12) == Mass(12u"kg")
    end

    @testset "Current Functionalities" begin
        @test isa(Current(12u"A"), Current)
        @test  Current(12000u"mA") == Current(12.0u"A")
        @test Current(12) == Current(12u"A")
    end

    @testset "Temperature Functionalities" begin
        @test isa(Temperature(12u"K"), Temperature)
        @test  Temperature(12000u"mK") == Temperature(12.0u"K")
        @test Temperature(12) == Temperature(12u"K")
        @test Temperature() == Temperature(273.15)
    end

    @testset "Speed Functionalities" begin
        @test isa(Speed(12.0u"m/s"), Speed)
        @test Speed(12u"mm/s") == Speed(12.0u"m/ks")
        @test Speed(12.3) == Speed(12.3u"m/s")
    end

    @testset "Frequency Functionalities" begin
        @test isa(Frequency(3u"Hz"), Frequency)
        @test Frequency(12.0u"kHz") == Frequency(12000.0u"Hz")
        @test Frequency(12.3) == Frequency(12.3u"Hz")
    end
#####################

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
        @test size(Position(1, 2, 3)) == (3,)
        @test Velocity(1, 2)[3] == 0.0u"m/s"
        @test isa(PhysicsVector([1u"m/s",1u"m/s",1u"m/s"]), Velocity)
        @test isa(4 * Velocity(3,2,1), Velocity)
        @test isa(Velocity(1, 2, 3) * 4, Velocity)
    end

    @testset "Position Functionalities" begin
        @test Position(1÷1 * u"mm", 2//1 * u"m", 3/1 * u"km"; Basis=BasisVectors()) isa Position
        @test Position(1÷1 * u"m", 2//1 * u"m", 3/1 * u"m") isa Position
        @test Position(1÷1, 2//1, 3/1) == Position(1÷1 * u"m", 2//1 * u"m", 3/1 * u"m")
        @test Position([1, 2, 3]) == Position( (1, 2, 3) )
        @test let
            a = CartesianCoordinate(1, 2, 3)
            b = CartesianCoordinate(4, 5, 6)
            c = CartesianCoordinate(7, 8, 9)
            d = BasisVectors(a, b, c)
            Position(1÷1, 2//1, 3/1; Basis=d) == Position(30, 36, 42)
        end
        @test Position() == Position(0, 0, 0)
        @test Position(1u"m", 2u"m") == Position(1, 2)
        @test Position([1u"m"]) == Position( (1, 0) )
    end

    @testset "Velocity Functionalities" begin
        @test Velocity(1÷1 * u"mm/s", 2//1 * u"m/ms", 3/1 * u"m/s"; Basis=BasisVectors()) isa Velocity
        @test Velocity(1÷1 * u"m/s", 2//1 * u"m/s", 3/1 * u"m/s") isa Velocity
        @test Velocity(1÷1, 2//1, 3/1) == Velocity(1÷1 * u"m/s", 2//1 * u"m/s", 3/1 * u"m/s")
        @test Velocity([1, 2, 3]) == Velocity( (1, 2, 3) )
        @test let
            a = CartesianCoordinate(1, 2, 3)
            b = CartesianCoordinate(4, 5, 6)
            c = CartesianCoordinate(7, 8, 9)
            d = BasisVectors(a, b, c)
            Velocity(1÷1, 2//1, 3/1; Basis=d) == Velocity(30, 36, 42)
        end
        @test Velocity() == Velocity(0, 0, 0)
        @test Velocity(1u"m/s", 2u"m/s") == Velocity(1, 2)
        @test Velocity([1u"m/s"]) == Velocity( (1, 0) )
    end

    @testset "Acceleration Functionalities" begin
        @test Acceleration(1÷1 * u"mm/s^2", 2//1 * u"m/ms^2", 3/1 * u"m/s^2"; Basis=BasisVectors()) isa Acceleration
        @test Acceleration(1÷1 * u"m/s^2", 2//1 * u"m/s^2", 3/1 * u"m/s^2") isa Acceleration
        @test Acceleration(1÷1, 2//1, 3/1) == Acceleration(1÷1 * u"m/s^2", 2//1 * u"m/s^2", 3/1 * u"m/s^2")
        @test Acceleration([1, 2, 3]) == Acceleration( (1, 2, 3) )
        @test let
            a = CartesianCoordinate(1, 2, 3)
            b = CartesianCoordinate(4, 5, 6)
            c = CartesianCoordinate(7, 8, 9)
            d = BasisVectors(a, b, c)
            Acceleration(1÷1, 2//1, 3/1; Basis=d) == Acceleration(30, 36, 42)
        end
        @test Acceleration() == Acceleration(0, 0, 0)
        @test Acceleration(1u"m/s^2", 2u"m/s^2") == Acceleration(1, 2)
        @test Acceleration([1u"m/s^2"]) == Acceleration( (1, 0) )
    end
#####################