using Test

@testset " PhysicsScalar Functionalities" begin
    @test PhysicsScalar(12u"m/s") == Speed(12)
    @test Time(1) + Time(2) isa Time
    @test Time(1) + 2u"s" isa Time
    @test Length(1) - Length(2) isa Length
    @test Length(1) - 2u"m" isa Length
    @test -Length(1) isa Length
    @test Length(1) * Frequency(2) isa Speed
    @test Speed(1) * 2 isa Speed
    @test Length(1) / Time(2) isa Speed
    @test Length(1) / 2u"s" isa Speed
    @test 1/2 * Mass(10) * Speed(5)^2 isa Energy
    @test dimension(Speed(12)^5) == dimension(1u"m^5/s^5") 
    @test sqrt(Length(12)) isa Quantity
    @test cbrt(Time(12)) isa Quantity
    @test inv(Time(12)) isa Frequency
    @test one(Length(3)) == 1
end

@testset "PhysicsVector Functionalities" begin
    @test PhysicsVector([1u"m/s", 2u"m/s", 3u"m/s"]) isa Velocity
    @test Position(1, 2, 3) + Position(4, 5, 6) isa Position
    @test Position(1, 2, 3) - Position(4, 5, 6) isa Position
    @test -Velocity(1, 2, 3) isa Velocity
    @test Velocity(1, 2, 3) * 4 isa Velocity
    @test Velocity(8, 6, 4) / 2 isa Velocity
    @test Acceleration(1,2,3) * Time(4) isa Velocity
    @test Velocity(1, 2, 3) * 4u"s" isa Position
    @test Velocity(8, 6, 4) / Time(2) isa Acceleration
    @test Position(8, 6, 4) / u"s" isa Velocity
    @test Acceleration(1, 2, 3) * 2u"s" isa Velocity
    @test Position(1, 2, 3) * Position(4, 5, 6) == 32.0u"m^2"
    @test Velocity(1, 2, 3)^2 == 14.0u"m^2/s^2"
    @test unitvec(Position(1,2,3)) isa CartesianCoordinate
    @test Velocity(1, 2, 3) .* 4u"s" isa Position
    @test Velocity(1, 2, 3) ./ Time(4) isa Acceleration
    @test Velocity(1, 2, 3) .+ 4u"m/s" isa Velocity
    @test Velocity(4, 3, 2) .- 1u"m/s" isa Velocity
end
  
@testset "Unitful added Functionalities" begin
    @test dimension(Speed(12)) == dimension(12u"m/s")
    @test dimension(Velocity(1,2)) == dimension(12u"m/s")
    @test uconvert(u"Hz", 1/Time(1)) == 1.0u"Hz"
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

@testset "Substance Functionalities" begin
    @test Substance(12//1000) == Substance(12.0u"mmol")
    @test Substance() == Substance(0)
end

@testset "Luminous Functionalities" begin
    @test Luminous(12//1000) == Luminous(12.0u"mcd")
    @test Luminous() == Luminous(0)
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

@testset "Pressure Functionalities" begin
    @test Pressure(12//1000) == Pressure(12.0u"Pa")
    @test Pressure() == Pressure(100)
end

@testset "Energy Functionalities" begin
    @test Energy(12//1000) == Energy(12.0u"mJ")
    @test Energy() == Energy(0)
end

@testset "Power Functionalities" begin
    @test Power(12//1000) == Power(12.0u"mW")
    @test Power() == Power(0)
end

@testset "Charge Functionalities" begin
    @test Charge(12//1000) == Charge(12.0u"mC")
    @test Charge() == Charge(0)
end

@testset "Voltage Functionalities" begin
    @test Voltage(12//1000) == Voltage(12.0u"mV")
    @test Voltage() == Voltage(0)
end

@testset "Capacitance Functionalities" begin
    @test Capacitance(12//1000) == Capacitance(12.0u"mF")
    @test Capacitance() == Capacitance(0)
end

@testset "Resistance Functionalities" begin
    @test Resistance(12//1000) == Resistance(12.0u"mΩ")
    @test Resistance() == Resistance(0)
end

@testset "Conductance Functionalities" begin
    @test Conductance(12//1000) == Conductance(12.0u"mS")
    @test Conductance() == Conductance(0)
end

@testset "MagneticFlux Functionalities" begin
    @test MagneticFlux(12//1000) == MagneticFlux(12.0u"mWb")
    @test MagneticFlux() == MagneticFlux(0)
end

@testset "Inductance Functionalities" begin
    @test Inductance(12//1000) == Inductance(12.0u"mH")
    @test Inductance() == Inductance(0)
end

### Kinematic SI derived units ###
@testset "Speed Functionalities" begin
    @test Speed(12//1000) == Speed(12.0u"mm/s")
    @test Speed() == Speed(0)
end

@testset "CartesianCoordinate Functionalities" begin
    @test CartesianCoordinate(1, 2, 3) isa CartesianCoordinate
    @test CartesianCoordinate( (1, 2) ) == CartesianCoordinate(1, 2, 0)
end

@testset "Position Functionalities" begin
    @test Position(1, 2//1000) == Position(1 * u"m", 2//1 * u"mm", 0.0u"m")
    @test Position() == Position(0, 0, 0)
end

@testset "Force Functionalities" begin
    @test Force(1, 2//1000) == Force(1 * u"N", 2//1 * u"mN", 0.0u"N")
    @test Force() == Force(0, 0, 0)
end

@testset "Velocity Functionalities" begin
    @test Velocity(1, 2//1000) == Velocity(1 * u"m/s", 2//1 * u"mm/s", 0.0u"m/s")
    @test Velocity() == Velocity(0, 0, 0)
end

@testset "Acceleration Functionalities" begin
    @test Acceleration(1, 2//1000) == Acceleration(1 * u"m/s^2", 2//1 * u"mm/s^2", 0.0u"m/s^2")
    @test Acceleration() == Acceleration(0, 0, 0)
end

@testset "ElectricField Functionalities" begin
    @test ElectricField(4u"nC")(Position(2)) isa ElectricField
    @test dimension(ElectricField(4u"nC")(Length(2))) == dimension(u"N/C")
end