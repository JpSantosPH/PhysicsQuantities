using Test
using Unicode

@testset " PhysicsScalar Functionalities" begin
    @test PhysicsScalar(12u"m/s") isa Speed
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
    @test abs(Length(-1)) == Length(1)
    @test abs2(Length(-2)) == 4u"m^2"
    @test inv(Time(1)) isa Frequency
    @test sign(Length(1)) == 1.0
    @test min(Time(2), Time(5), Time(1)) == Time(1)
    @test max(Time(2), Time(5), Time(1)) == Time(5)
    @test minmax(Time(5), Time(2)) == (Time(2), Time(5))
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
    @test unitvec(Position(1,2,3)) isa GeneralVector
    @test Velocity(1, 2, 3) .* 4u"s" isa Position
    @test Velocity(1, 2, 3) ./ Time(4) isa Acceleration
    @test Velocity(1, 2, 3) .+ 4u"m/s" isa Velocity
    @test Velocity(4, 3, 2) .- 1u"m/s" isa Velocity
    @test let 
        PV = Position(1, 2, 3)
        M = [   1 2 3
                4 5 6
                7 8 9   ]
        M * PV == Position(14, 32, 50)
    end
end

@testset "Boolean Functionalities" begin
    @test isequal(Time(1), Time(1))
    @test isequal(Time(1), 1u"s")
    @test isequal(1u"s", Time(1))
    @test Time(1) == Time(1)
    @test Time(1) == 1u"s"
    @test 1u"s" == Time(1)
    @test Time(1) != Time(2)
    @test Time(1) != 2u"s"
    @test 1u"s" != Time(2)
    @test isless(Time(1), Time(2))
    @test isless(Time(1), 2u"s")
    @test isless(1u"s", Time(2))
    @test Time(1) < Time(2)
    @test Time(1) < 2u"s"
    @test 1u"s" < Time(2)
    @test Time(2) > Time(1)
    @test Time(2) > 1u"s"
    @test 2u"s" > Time(1)
    @test Time(1) <= Time(2)
    @test Time(1) <= Time(2)
    @test Time(1) <= 2u"s"
    @test 1u"s" <= Time(2)
    @test Time(2) >= Time(1)
    @test Time(2) >= 1u"s"
    @test 2u"s" >= Time(1)
    @test cmp(Time(1), Time(2)) == -1
    @test cmp(Time(1), 1u"s") == 0
    @test cmp(2u"s", Time(1)) == 1
end
  
@testset "Unitful added Functionalities" begin
    @test dimension(Speed(12)) == dimension(12u"m/s")
    @test dimension(Velocity(1,2)) == dimension(12u"m/s")
    @test uconvert(u"Hz", 1/Time(1)) == 1.0u"Hz"
end

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

@testset "Induction Functionalities" begin
    @test Induction(12//1000) == Induction(12.0u"mT")
    @test Induction() == Induction(0)
end

@testset "Inductance Functionalities" begin
    @test Inductance(12//1000) == Inductance(12.0u"mH")
    @test Inductance() == Inductance(0)
end

@testset "LuminousFlux Functionalities" begin
    @test LuminousFlux(12//1000) == LuminousFlux(12.0u"mlm")
    @test LuminousFlux() == LuminousFlux(0)
end

@testset "Illuminance Functionalities" begin
    @test Illuminance(12//1000) == Illuminance(12.0u"mlx")
    @test Illuminance() == Illuminance(0)
end

@testset "Radioactivity Functionalities" begin
    @test Radioactivity(12//1000) == Radioactivity(12.0u"mBq")
    @test Radioactivity() == Radioactivity(0)
end

@testset "AbsorbedDose Functionalities" begin
    @test AbsorbedDose(12//1000) == AbsorbedDose(12.0u"mGy")
    @test AbsorbedDose() == AbsorbedDose(0)
end

@testset "EquivalentDose Functionalities" begin
    @test EquivalentDose(12//1000) == EquivalentDose(12.0u"mSv")
    @test EquivalentDose() == EquivalentDose(0)
end

@testset "CatalyticActivity Functionalities" begin
    @test CatalyticActivity(12//1000) == CatalyticActivity(12.0u"mkat")
    @test CatalyticActivity() == CatalyticActivity(0)
end

@testset "Speed Functionalities" begin
    @test Speed(12//1000) == Speed(12.0u"mm/s")
    @test Speed() == Speed(0)
end

@testset "FrequencyDrift Functionalities" begin
    @test FrequencyDrift(12//1000) == FrequencyDrift(12u"mHz/s")
    @test FrequencyDrift() == FrequencyDrift(0)
end

@testset "VolumetricFlow Functionalities" begin
    @test VolumetricFlow(12//1000) == VolumetricFlow(0.012u"m^3/s")
    @test VolumetricFlow() == VolumetricFlow(0)
end

@testset "Area Functionalities" begin
    @test Area(12//1000000) == Area(12.0u"mm^2")
    @test Area() == Area(0)
end

@testset "Volume Functionalities" begin
    @test Volume(12//1000000) == Volume(12.0u"cm^3")
    @test Volume() == Volume(0)
end

@testset "Wavenumber Functionalities" begin
    @test Wavenumber(12//1000) == Wavenumber(12.0u"km^-1")
    @test Wavenumber() == Wavenumber(0)
end

@testset "LinearDensity Functionalities" begin
    @test LinearDensity(12//1000) == LinearDensity(12.0u"g/m")
    @test LinearDensity() == LinearDensity(0)
end

@testset "AreaDensity Functionalities" begin
    @test AreaDensity(12//1000) == AreaDensity(12.0u"g/m^2")
    @test AreaDensity() == AreaDensity(0)
end

@testset "Density Functionalities" begin
    @test Density(12//1000) == Density(12.0u"g/m^3")
    @test Density() == Density(0)
end

@testset "SpecificVolume Functionalities" begin
    @test SpecificVolume(12//1000) == SpecificVolume(12.0u"cm^3/g")
    @test SpecificVolume() == SpecificVolume(0)
end

@testset "Action Functionalities" begin
    @test Action(12//1000) == Action(12.0u"mJ*s")
    @test Action() == Action(0)
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

@testset "Jerk Functionalities" begin
    @test Jerk(1, 2//1000) == Jerk(1 * u"m/s^3", 2//1 * u"mm/s^3", 0.0u"m/s^3")
    @test Jerk() == Jerk(0, 0, 0)
end

@testset "Snap Functionalities" begin
    @test Snap(1, 2//1000) == Snap(1 * u"m/s^4", 2//1 * u"mm/s^4", 0.0u"m/s^4")
    @test Snap() == Snap(0, 0, 0)
end

@testset "AngularVelocity Functionalities" begin
    @test AngularVelocity(1, 2//1000) == AngularVelocity(1 * u"rad/s", 2//1 * u"mrad/s", 0.0u"rad/s")
    @test AngularVelocity() == AngularVelocity(0, 0, 0)
end

@testset "AngularAcceleration Functionalities" begin
    @test AngularAcceleration(1, 2//1000) == AngularAcceleration(1 * u"rad/s^2", 2//1 * u"mrad/s^2", 0.0u"rad/s^2")
    @test AngularAcceleration() == AngularAcceleration(0, 0, 0)
end

@testset "Momentum Functionalities" begin
    @test Momentum(1, 2//1000) == Momentum(1 * u"kg*m/s", 2//1 * u"g*m/s", 0.0u"kg*m/s")
    @test Momentum() == Momentum(0, 0, 0)
end

@testset "AngularMomentum Functionalities" begin
    @test AngularMomentum(1, 2//1000) == AngularMomentum(1 * u"N*m*s", 2//1 * u"mN*m*s", 0.0u"N*m*s")
    @test AngularMomentum() == AngularMomentum(0, 0, 0)
end

@testset "Torque Functionalities" begin
    @test Torque(1, 2//1000) == Torque(1 * u"N*m", 2//1 * u"mN*m", 0.0u"N*m")
    @test Torque() == Torque(0, 0, 0)
end

@testset "ElectricFieldStrength Functionalities" begin
    @test ElectricFieldStrength(4u"nC")(Position(2)) isa ElectricFieldStrength
    @test dimension(ElectricFieldStrength(4u"nC")(Length(2))) == dimension(u"N/C")
end