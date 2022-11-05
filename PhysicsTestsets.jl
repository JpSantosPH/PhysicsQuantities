using Test

@testset " PhysicsScalar Functionalities" begin
@test correct_units(1.0, u"m") == 1.0u"m"
@test physics(12u"m/s") isa Speed
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
@test sqrt(Length(12)) isa GeneralScalar
@test cbrt(Time(12)) isa GeneralScalar
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
@test correct_units(1, 2.0, 3//1, u"s") == (1*u"s", 2.0*u"s", 3//1*u"s")
@test physics([1u"m/s", 2u"m/s", 3u"m/s"]) isa Velocity
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
@test Position(1, 2, 3) × Force(4, 5, 6) isa Torque
@test Velocity(1, 2, 3)^2 == 14.0u"m^2/s^2"
@test unitvec(Position(1,2,3)) isa GeneralVector
@test Velocity(1, 2, 3) .* 4u"s" isa Position
@test Position(1, 2, 3) ./ 4u"s" isa Velocity
@test Velocity(1, 2, 3) .+ 4u"m/s" isa Velocity
@test Velocity(4, 3, 2) .- 1u"m/s" isa Velocity
@test Velocity(1, 2, 3) .* Time(4) isa Position
@test Position(1, 2, 3) ./ Time(4) isa Velocity
@test Velocity(1, 2, 3) .+ Speed(4) isa Velocity
@test Velocity(4, 3, 2) .- Speed(1) isa Velocity
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

@testset "ScalarCases Functionalities" begin
m = 4
@test physics(Luminance(m)) isa Luminance
@test physics(LuminousFlux(m)) isa LuminousFlux
@test physics(Radioactivity(m)) isa Radioactivity
@test physics(AbsorbedDose(m)) isa AbsorbedDose
@test physics(EquivalentDose(m)) isa EquivalentDose
@test physics(MagnetomotiveForce(m)) isa MagnetomotiveForce
@test physics(RadiantExposure(m)) isa RadiantExposure
@test physics(SpectralRadiance(m)) isa SpectralRadiance
@test physics(EnergyDensity(m)) isa EnergyDensity
@test physics(Radiance(m)) isa Radiance
@test physics(Irradiance(m)) isa Irradiance
@test physics(SpectralIntensity(m)) isa SpectralIntensity
@test physics(RadiantIntensity(m)) isa RadiantIntensity
@test physics(KinematicViscosity(m)) isa KinematicViscosity
@test physics(Angle(m)) isa Angle
@test physics(Time(m)) isa Time
@test physics(Length(m)) isa Length
@test physics(Mass(m)) isa Mass
@test physics(Current(m)) isa Current
@test physics(Temperature(m)) isa Temperature
@test physics(Substance(m)) isa Substance
@test physics(Luminous(m)) isa Luminous
@test physics(Pressure(m)) isa Pressure
@test physics(Energy(m)) isa Energy
@test physics(Power(m)) isa Power
@test physics(Charge(m)) isa Charge
@test physics(Voltage(m)) isa Voltage
@test physics(Capacitance(m)) isa Capacitance
@test physics(Resistance(m)) isa Resistance
@test physics(Conductance(m)) isa Conductance
@test physics(MagneticFlux(m)) isa MagneticFlux
@test physics(Induction(m)) isa Induction
@test physics(Inductance(m)) isa Inductance
@test physics(Illuminance(m)) isa Illuminance
@test physics(CatalyticActivity(m)) isa CatalyticActivity
@test physics(Speed(m)) isa Speed
@test physics(VolumetricFlow(m)) isa VolumetricFlow
@test physics(FrequencyDrift(m)) isa FrequencyDrift
@test physics(Area(m)) isa Area
@test physics(Volume(m)) isa Volume
@test physics(Wavenumber(m)) isa Wavenumber
@test physics(LinearDensity(m)) isa LinearDensity
@test physics(AreaDensity(m)) isa AreaDensity
@test physics(Density(m)) isa Density
@test physics(SpecificVolume(m)) isa SpecificVolume
@test physics(Action(m)) isa Action
@test physics(SpecificEnergy(m)) isa SpecificEnergy
@test physics(SurfaceTension(m)) isa SurfaceTension
@test physics(DynamicViscosity(m)) isa DynamicViscosity
@test physics(MassFLowRate(m)) isa MassFLowRate
@test physics(AbsorbedDoseRate(m)) isa AbsorbedDoseRate
@test physics(FuelEfficiency(m)) isa FuelEfficiency
@test physics(EnergyFluxDensity(m)) isa EnergyFluxDensity
@test physics(Compressibility(m)) isa Compressibility
@test physics(MomentOfInertia(m)) isa MomentOfInertia
@test physics(SpecificAngularMomentum(m)) isa SpecificAngularMomentum
@test physics(SpectralPower(m)) isa SpectralPower
@test physics(SpectralIrradiance(m)) isa SpectralIrradiance
@test physics(Molarity(m)) isa Molarity
@test physics(MolarVolume(m)) isa MolarVolume
@test physics(MolarHeatCapacity(m)) isa MolarHeatCapacity
@test physics(MolarEnergy(m)) isa MolarEnergy
@test physics(MolarConductivity(m)) isa MolarConductivity
@test physics(Molality(m)) isa Molality
@test physics(MolarMass(m)) isa MolarMass
@test physics(CatalyticEfficiency(m)) isa CatalyticEfficiency
@test physics(VolumeChargeDensity(m)) isa VolumeChargeDensity
@test physics(AreaChargeDensity(m)) isa AreaChargeDensity
@test physics(LinearChargeDensity(m)) isa LinearChargeDensity
@test physics(Conductivity(m)) isa Conductivity
@test physics(Permittivity(m)) isa Permittivity
@test physics(MagneticPermittivity(m)) isa MagneticPermittivity
@test physics(Exposure(m)) isa Exposure
@test physics(Resistivity(m)) isa Resistivity
@test physics(ElectronMobility(m)) isa ElectronMobility
@test physics(MagneticReluctance(m)) isa MagneticReluctance
@test physics(MagneticRrigidity(m)) isa MagneticRrigidity
@test physics(MagneticSusceptibility(m)) isa MagneticSusceptibility
@test physics(LuminousEnergy(m)) isa LuminousEnergy
@test physics(LuminousExposure(m)) isa LuminousExposure
@test physics(LuminousEfficacy(m)) isa LuminousEfficacy
@test physics(HeatCapacity(m)) isa HeatCapacity
@test physics(SpecificHeatCapacity(m)) isa SpecificHeatCapacity
@test physics(ThermalConductivity(m)) isa ThermalConductivity
@test physics(ThermalResistance(m)) isa ThermalResistance
@test physics(ThermalExpansionCoefficient(m)) isa ThermalExpansionCoefficient
@test physics(TemperatureGradient(m)) isa TemperatureGradient
@test physics(Frequency(m)) isa Frequency
@test physics(GeneralScalar(m)) isa GeneralScalar
end

@testset "VectorCases Functionalities" begin
x = 1
y = 2
z = 3
@test physics(Position(x, y, z)) isa Position
@test physics(Force(x, y, z)) isa Force
@test physics(Velocity(x, y, z)) isa Velocity
@test physics(Acceleration(x, y, z)) isa Acceleration
@test physics(Jerk(x, y, z)) isa Jerk
@test physics(Snap(x, y, z)) isa Snap
@test physics(AngularVelocity(x, y, z)) isa AngularVelocity
@test physics(AngularAcceleration(x, y, z)) isa AngularAcceleration
@test physics(Momentum(x, y, z)) isa Momentum
@test physics(AngularMomentum(x, y, z)) isa AngularMomentum
@test physics(Torque(x, y, z)) isa Torque
@test physics(ElectricDisplacementField(x, y, z)) isa ElectricDisplacementField
@test physics(CurrentDensity(x, y, z)) isa CurrentDensity
@test physics(ElectricFieldStrength(x, y, z)) isa ElectricFieldStrength
@test physics(MagneticFieldStrength(x, y, z)) isa MagneticFieldStrength
@test physics(MagneticDipoleMoment(x, y, z)) isa MagneticDipoleMoment
@test physics(MagneticVectorPotential(x, y, z)) isa MagneticVectorPotential
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
@test VolumetricFlow(12/1000) == VolumetricFlow(0.012u"m^3/s")
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

@testset "SpecificEnergy Functionalities" begin
@test SpecificEnergy(12//1000) == SpecificEnergy(12.0u"mJ/kg")
@test SpecificEnergy() == SpecificEnergy(0)
end

@testset "EnergyDensity Functionalities" begin
@test EnergyDensity(12//1000) == EnergyDensity(12.0u"mJ/m^3")
@test EnergyDensity() == EnergyDensity(0)
end

@testset "SurfaceTension Functionalities" begin
@test SurfaceTension(12//1000) == SurfaceTension(12.0u"mN/m")
@test SurfaceTension() == SurfaceTension(0)
end

@testset "KinematicViscosity Functionalities" begin
@test KinematicViscosity(12//1000000) == KinematicViscosity(12.0u"mm^2/s")
@test KinematicViscosity() == KinematicViscosity(0)
end

@testset "MassFLowRate Functionalities" begin
@test MassFLowRate(12//1000) == MassFLowRate(12.0u"g/s")
@test MassFLowRate() == MassFLowRate(0)
end

@testset "AbsorbedDoseRate Functionalities" begin
@test AbsorbedDoseRate(12//1000) == AbsorbedDoseRate(12.0u"mGy/s")
@test AbsorbedDoseRate() == AbsorbedDoseRate(0)
end

@testset "FuelEfficiency Functionalities" begin
@test FuelEfficiency(12//1000) == FuelEfficiency(12.0u"mm/m^3")
@test FuelEfficiency() == FuelEfficiency(0)
end

@testset "EnergyFluxDensity Functionalities" begin
@test EnergyFluxDensity(12//1000) == EnergyFluxDensity(12.0u"mJ/(m^2*s)")
@test EnergyFluxDensity() == EnergyFluxDensity(0)
end

@testset "Compressibility Functionalities" begin
@test Compressibility(12//1000) == Compressibility(12.0u"kPa^-1")
@test Compressibility() == Compressibility(0)
end

@testset "MomentOfInertia Functionalities" begin
@test MomentOfInertia(12//1000) == MomentOfInertia(12.0u"g*m^2")
@test MomentOfInertia() == MomentOfInertia(0)
end

@testset "SpecificAngularMomentum Functionalities" begin
@test SpecificAngularMomentum(12//1000) == SpecificAngularMomentum(12.0u"mN*m*s/kg")
@test SpecificAngularMomentum() == SpecificAngularMomentum(0)
end

@testset "SpectralPower Functionalities" begin
@test SpectralPower(12//1000) == SpectralPower(12.0u"mW/m")
@test SpectralPower() == SpectralPower(0)
end

@testset "Irradiance Functionalities" begin
@test Irradiance(12//1000) == Irradiance(12.0u"mW/m^2")
@test Irradiance() == Irradiance(0)
end

@testset "SpectralIrradiance Functionalities" begin
@test SpectralIrradiance(12//1000) == SpectralIrradiance(12.0u"mW/m^3")
@test SpectralIrradiance() == SpectralIrradiance(0)
end

@testset "RadiantIntensity Functionalities" begin
@test RadiantIntensity(12//1000) == RadiantIntensity(12.0u"mW/sr")
@test RadiantIntensity() == RadiantIntensity(0)
end

@testset "SpectralIntensity Functionalities" begin
@test SpectralIntensity(12//1000) == SpectralIntensity(12.0u"mW/(sr*m)")
@test SpectralIntensity() == SpectralIntensity(0)
end

@testset "Radiance Functionalities" begin
@test Radiance(12//1000) == Radiance(12.0u"mW/(sr*m^2)")
@test Radiance() == Radiance(0)
end

@testset "SpectralRadiance Functionalities" begin
@test SpectralRadiance(12//1000) == SpectralRadiance(12.0u"mW/(sr*m^3)")
@test SpectralRadiance() == SpectralRadiance(0)
end

@testset "RadiantExposure Functionalities" begin
@test RadiantExposure(12//1000) == RadiantExposure(12.0u"mJ/m^2")
@test RadiantExposure() == RadiantExposure(0)
end

@testset "Molarity Functionalities" begin
@test Molarity(12//1000) == Molarity(12.0u"mmol/m^3")
@test Molarity() == Molarity(0)
end

@testset "MolarVolume Functionalities" begin
@test MolarVolume(12//1000000) == MolarVolume(12.0u"cm^3/mol")
@test MolarVolume() == MolarVolume(0)
end

@testset "MolarHeatCapacity Functionalities" begin
@test MolarHeatCapacity(12//1000) == MolarHeatCapacity(12.0u"mJ/(K*mol)")
@test MolarHeatCapacity() == MolarHeatCapacity(0)
end

@testset "MolarEnergy Functionalities" begin
@test MolarEnergy(12//1000) == MolarEnergy(12.0u"mJ/mol")
@test MolarEnergy() == MolarEnergy(0)
end

@testset "MolarConductivity Functionalities" begin
@test MolarConductivity(12//1000) == MolarConductivity(12.0u"mS*m^2/mol")
@test MolarConductivity() == MolarConductivity(0)
end

@testset "Molality Functionalities" begin
@test Molality(12//1000) == Molality(12.0u"mmol/kg")
@test Molality() == Molality(0)
end

@testset "MolarMass Functionalities" begin
@test MolarMass(12//1000) == MolarMass(12.0u"g/mol")
@test MolarMass() == MolarMass(0)
end

@testset "CatalyticEfficiency Functionalities" begin
@test CatalyticEfficiency(12//1000000) == CatalyticEfficiency(12.0u"cm^3/(mol*s)")
@test CatalyticEfficiency() == CatalyticEfficiency(0)
end

@testset "VolumeChargeDensity Functionalities" begin
@test VolumeChargeDensity(12//1000) == VolumeChargeDensity(12.0u"mC/m^3")
@test VolumeChargeDensity() == VolumeChargeDensity(0)
end

@testset "AreaChargeDensity Functionalities" begin
@test AreaChargeDensity(12//1000) == AreaChargeDensity(12.0u"mC/m^2")
@test AreaChargeDensity() == AreaChargeDensity(0)
end

@testset "LinearChargeDensity Functionalities" begin
@test LinearChargeDensity(12//1000) == LinearChargeDensity(12.0u"mC/m")
@test LinearChargeDensity() == LinearChargeDensity(0)
end

@testset "Conductivity Functionalities" begin
@test Conductivity(12//1000) == Conductivity(12.0u"mS/m")
@test Conductivity() == Conductivity(0)
end

@testset "Permittivity Functionalities" begin
@test Permittivity(12//1000) == Permittivity(12.0u"mF/m")
@test Permittivity() == Permittivity(0)
end

@testset "MagneticPermittivity Functionalities" begin
@test MagneticPermittivity(12//1000) == MagneticPermittivity(12.0u"mH/m")
@test MagneticPermittivity() == MagneticPermittivity(0)
end

@testset "Exposure Functionalities" begin
@test Exposure(12//1000) == Exposure(12.0u"mC/kg")
@test Exposure() == Exposure(0)
end

@testset "Resistivity Functionalities" begin
@test Resistivity(12//1000) == Resistivity(12.0u"mΩ*m")
@test Resistivity() == Resistivity(0)
end

@testset "ElectronMobility Functionalities" begin
@test ElectronMobility(12//1000000) == ElectronMobility(12.0u"mm^2/(V*s)")
@test ElectronMobility() == ElectronMobility(0)
end

@testset "MagneticReluctance Functionalities" begin
@test MagneticReluctance(12//1000) == MagneticReluctance(12.0u"kH^-1")
@test MagneticReluctance() == MagneticReluctance(0)
end

@testset "MagneticRrigidity Functionalities" begin
@test MagneticRrigidity(12//1000) == MagneticRrigidity(12.0u"mT*m")
@test MagneticRrigidity() == MagneticRrigidity(0)
end

@testset "MagnetomotiveForce Functionalities" begin
@test MagnetomotiveForce(12//1000) == MagnetomotiveForce(12.0u"mA*rad")
@test MagnetomotiveForce() == MagnetomotiveForce(0)
end

@testset "MagneticSusceptibility Functionalities" begin
@test MagneticSusceptibility(12//1000) == MagneticSusceptibility(12.0u"mm/H")
@test MagneticSusceptibility() == MagneticSusceptibility(0)
end

@testset "LuminousEnergy Functionalities" begin
@test LuminousEnergy(12//1000) == LuminousEnergy(12.0u"mlm*s")
@test LuminousEnergy() == LuminousEnergy(0)
end

@testset "LuminousExposure Functionalities" begin
@test LuminousExposure(12//1000) == LuminousExposure(12.0u"mlx*s")
@test LuminousExposure() == LuminousExposure(0)
end

@testset "Luminance Functionalities" begin
@test Luminance(12//1000) == Luminance(12.0u"mcd/m^2")
@test Luminance() == Luminance(0)
end

@testset "LuminousEfficacy Functionalities" begin
@test LuminousEfficacy(12//1000) == LuminousEfficacy(12.0u"mlm/W")
@test LuminousEfficacy() == LuminousEfficacy(0)
end

@testset "HeatCapacity Functionalities" begin
@test HeatCapacity(12//1000) == HeatCapacity(12.0u"mJ/K")
@test HeatCapacity() == HeatCapacity(0)
end

@testset "SpecificHeatCapacity Functionalities" begin
@test SpecificHeatCapacity(12//1000) == SpecificHeatCapacity(12.0u"mJ/(K*kg)")
@test SpecificHeatCapacity() == SpecificHeatCapacity(0)
end

@testset "ThermalConductivity Functionalities" begin
@test ThermalConductivity(12//1000) == ThermalConductivity(12.0u"mW/(m*K)")
@test ThermalConductivity() == ThermalConductivity(0)
end

@testset "ThermalResistance Functionalities" begin
@test ThermalResistance(12//1000) == ThermalResistance(12.0u"mK/W")
@test ThermalResistance() == ThermalResistance(0)
end

@testset "ThermalExpansionCoefficient Functionalities" begin
@test ThermalExpansionCoefficient(12//1000) == ThermalExpansionCoefficient(12.0u"kK^-1")
@test ThermalExpansionCoefficient() == ThermalExpansionCoefficient(0)
end

@testset "TemperatureGradient Functionalities" begin
@test TemperatureGradient(12//1000) == TemperatureGradient(12.0u"mK/m")
@test TemperatureGradient() == TemperatureGradient(0)
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

@testset "ElectricDisplacementField Functionalities" begin
@test ElectricDisplacementField(1, 2//1000) == ElectricDisplacementField(1 * u"C/m^2", 2//1 * u"mC/m^2", 0.0u"C/m^2")
@test ElectricDisplacementField() == ElectricDisplacementField(0, 0, 0)
end

@testset "LinearChargeDensity Functionalities" begin
@test LinearChargeDensity(12//1000) == LinearChargeDensity(12.0u"mC/m")
@test LinearChargeDensity() == LinearChargeDensity(0)
end

@testset "ElectricFieldStrength Functionalities" begin
@test ElectricFieldStrength(1, 2//1000) == ElectricFieldStrength(1 * u"N/C", 2//1 * u"mN/C", 0.0u"N/C")
@test ElectricFieldStrength() == ElectricFieldStrength(0, 0, 0)
end

@testset "MagneticFieldStrength Functionalities" begin
@test MagneticFieldStrength(1, 2//1000) == MagneticFieldStrength(1 * u"A/m", 2//1 * u"mA/m", 0.0u"A/m")
@test MagneticFieldStrength() == MagneticFieldStrength(0, 0, 0)
end

@testset "MagneticDipoleMoment Functionalities" begin
@test MagneticDipoleMoment(1, 2//1000) == MagneticDipoleMoment(1 * u"J/T", 2//1 * u"mJ/T", 0.0u"J/T")
@test MagneticDipoleMoment() == MagneticDipoleMoment(0, 0, 0)
end

@testset "MagneticReluctance Functionalities" begin
@test MagneticReluctance(12//1000) == MagneticReluctance(12.0u"kH^-1")
@test MagneticReluctance() == MagneticReluctance(0)
end
