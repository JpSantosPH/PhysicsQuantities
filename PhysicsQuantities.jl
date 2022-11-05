module PhysicsQuantities
using LinearAlgebra
using Unitful

include("PhysicsVector.jl")
export PhysicsVector, GeneralVector, CartesianCoordinate
export Position, Force, Velocity, Acceleration, Jerk, Snap
export AngularVelocity, AngularAcceleration, Momentum
export AngularMomentum, Torque, ElectricDisplacementField
export CurrentDensity, ElectricFieldStrength, MagneticFieldStrength
export MagneticDipoleMoment, MagneticVectorPotential

include("PhysicsScalar.jl")
export PhysicsScalar, GeneralScalar
export Time, Length, Mass, Current, Temperature, Substance
export Luminous, Frequency, Angle, Pressure, Energy, Power
export Charge, Voltage, Capacitance, Resistance, Conductance
export MagneticFlux,Induction, Inductance, LuminousFlux
export Illuminance, Radioactivity, AbsorbedDose, EquivalentDose
export CatalyticActivity, Speed, FrequencyDrift, VolumetricFlow
export Area, Volume, Wavenumber, LinearDensity, AreaDensity, Density
export SpecificVolume, Action, SpecificEnergy, EnergyDensity
export SurfaceTension, KinematicViscosity, DynamicViscosity
export MassFLowRate, AbsorbedDoseRate, FuelEfficiency, EnergyFluxDensity
export Compressibility, MomentOfInertia, SpecificAngularMomentum
export SpectralPower, Irradiance, SpectralIrradiance, RadiantIntensity
export SpectralIntensity, Radiance, SpectralRadiance, RadiantExposure
export Molarity, MolarVolume, MolarHeatCapacity, MolarEnergy
export MolarConductivity, Molality, MolarMass, CatalyticEfficiency
export VolumeChargeDensity, AreaChargeDensity, LinearChargeDensity
export Conductivity, Permittivity, MagneticPermittivity, Exposure
export Resistivity, ElectronMobility, MagneticReluctance, MagneticRrigidity
export MagnetomotiveForce, MagneticSusceptibility, LuminousEnergy
export LuminousExposure, Luminance, LuminousEfficacy, HeatCapacity
export SpecificHeatCapacity, ThermalConductivity, ThermalResistance
export ThermalExpansionCoefficient, TemperatureGradient

include("PhysicsOperators.jl")
export unitvec, ps_strip, correct_units

include("PhysicsEquations.jl")
export kinetic_energy

include("PhysicsCases.jl")
export physics, physicstype

end # end of module
