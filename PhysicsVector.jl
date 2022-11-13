abstract type PhysicsVector <: AbstractVector{Number} end
	Base.size(PV::PhysicsVector) = (3,)
	function Base.getindex(PV::PhysicsVector, i::Integer)
		if     i == 1; return PV.x
		elseif i == 2; return PV.y
		elseif i == 3; return PV.z
		end
	end
	Base.similar(PV::PhysicsVector) = physics(PV.x, PV.y, PV.z)
	Base.collect(PV::PhysicsVector) = [PV.x, PV.y, PV.z]
	function Base.setindex!(PV::PhysicsVector, val, i::Integer)
		val = ps_strip(val)
		if     i == 1; return physics(val,  PV.y, PV.z)
		elseif i == 2; return physics(PV.x, val,  PV.z)
		elseif i == 3; return physics(PV.x, PV.y, val )
		end
	end

	struct GeneralVector <: PhysicsVector
		x
		y
		z
		function GeneralVector(x::Number, y::Number, z::Number)
			x, y, z = promote(x, y, z)
			return new(x, y, z)
		end
	end
		GeneralVector( (x, y, z) ) = GeneralVector(x, y, z)
		GeneralVector() = GeneralVector(0.0, 0.0, 0.0)

	struct CartesianCoordinate <: PhysicsVector
		x
		y
		z
		function CartesianCoordinate(x::Number=0, y::Number=0, z::Number=0)
			x, y, z = convert.(Float64, (x, y, z))
			return new(x, y, z)
		end
	end
		Base.showarg(io::IO, CC::CartesianCoordinate, toplevel) = print(io, CartesianCoordinate)
		CartesianCoordinate(args) = CartesianCoordinate(args...)

	struct Position <: PhysicsVector
		x
		y
		z
		function Position(x::Number=0u"m", y::Number=0u"m", z::Number=0u"m")
			x, y, z = correct_units(x, y, z, u"m")
			return new(x, y, z)
		end
	end
		Position(args) = Position(args...)

	struct Force <: PhysicsVector
		x
		y
		z
		function Force(x::Number=0u"N", y::Number=0u"N", z::Number=0u"N")
			x, y, z = correct_units(x, y, z, u"N")
			return new(x, y, z)
		end
	end
		Force(args) = Force(args...)

	struct Velocity  <: PhysicsVector
		x
		y
		z
		function Velocity(x::Number=0u"m/s", y::Number=0u"m/s", z::Number=0u"m/s")
			x, y, z = correct_units(x, y, z, u"m/s")
			return new(x, y, z)
		end
	end
		Velocity(args) = Velocity(args...)

	struct Acceleration <: PhysicsVector
		x
		y
		z
		function Acceleration(x::Number=0u"m/s^2", y::Number=0u"m/s^2", z::Number=0u"m/s^2")
			x, y, z = correct_units(x, y, z, u"m/s^2")
			return new(x, y, z)
		end
	end
		Acceleration(args) = Acceleration(args...)

	struct Jerk <: PhysicsVector
		x
		y
		z
		function Jerk(x::Number=0u"m/s^3", y::Number=0u"m/s^3", z::Number=0u"m/s^3")
			x, y, z = correct_units(x, y, z, u"m/s^3")
			return new(x, y, z)
		end
	end
		Jerk(args) = Jerk(args...)

	struct Snap <: PhysicsVector
		x
		y
		z
		function Snap(x::Number=0u"m/s^4", y::Number=0u"m/s^4", z::Number=0u"m/s^4")
			x, y, z = correct_units(x, y, z, u"m/s^4")
			return new(x, y, z)
		end
	end
		Snap(args) = Snap(args...)

	struct AngularVelocity <: PhysicsVector
		x
		y
		z
		function AngularVelocity(x::Number=0u"rad/s", y::Number=0u"rad/s", z::Number=0u"rad/s")
			x, y, z = correct_units(x, y, z, u"rad/s")
			return new(x, y, z)
		end
	end
		AngularVelocity(args) = AngularVelocity(args...)

	struct AngularAcceleration <: PhysicsVector
		x
		y
		z
		function AngularAcceleration(x::Number=0u"rad/s^2", y::Number=0u"rad/s^2", z::Number=0u"rad/s^2")
			x, y, z = correct_units(x, y, z, u"rad/s^2")
			return new(x, y, z)
		end
	end
		AngularAcceleration(args) = AngularAcceleration(args...)

	struct Momentum <: PhysicsVector
		x
		y
		z
		function Momentum(x::Number=0u"kg*m/s", y::Number=0u"kg*m/s", z::Number=0u"kg*m/s")
			x, y, z = correct_units(x, y, z, u"kg*m/s")
			return new(x, y, z)
		end
	end
		Momentum(args) = Momentum(args...)

	struct AngularMomentum <: PhysicsVector
		x
		y
		z
		function AngularMomentum(x::Number=0u"N*m*s", y::Number=0u"N*m*s", z::Number=0u"N*m*s")
			x, y, z = correct_units(x, y, z, u"N*m*s")
			return new(x, y, z)
		end
	end
		AngularMomentum(args) = AngularMomentum(args...)

	struct Torque <: PhysicsVector
		x
		y
		z
		function Torque(x::Number=0u"N*m", y::Number=0u"N*m", z::Number=0u"N*m")
			x, y, z = correct_units(x, y, z, u"N*m")
			return new(x, y, z)
		end
	end
		Torque(args) = Torque(args...)

	struct ElectricDisplacementField <: PhysicsVector
		x
		y
		z
		function ElectricDisplacementField(x::Number=0u"C/m^2", y::Number=0u"C/m^2", z::Number=0u"C/m^2")
			x, y, z = correct_units(x, y, z, u"C/m^2")
			return new(x, y, z)
		end
	end
		ElectricDisplacementField(args) = ElectricDisplacementField(args...)

	struct CurrentDensity <: PhysicsVector
		x
		y
		z
		function CurrentDensity(x::Number=0u"A/m^2", y::Number=0u"A/m^2", z::Number=0u"A/m^2")
			x, y, z = correct_units(x, y, z, u"A/m^2")
			return new(x, y, z)
		end
	end
		CurrentDensity(args) = CurrentDensity(args...)

	struct ElectricFieldStrength <: PhysicsVector
		x
		y
		z
		function ElectricFieldStrength(x::Number=0u"N/C", y::Number=0u"N/C", z::Number=0u"N/C")
			x, y, z = correct_units(x, y, z, u"N/C")
			return new(x, y, z)
		end
	end
		ElectricFieldStrength(args) = ElectricFieldStrength(args...)

	struct MagneticFieldStrength <: PhysicsVector
		x
		y
		z
		function MagneticFieldStrength(x::Number=0u"A/m", y::Number=0u"A/m", z::Number=0u"A/m")
			x, y, z = correct_units(x, y, z, u"A/m")
			return new(x, y, z)
		end
	end
		MagneticFieldStrength(args) = MagneticFieldStrength(args...)

	struct MagneticDipoleMoment <: PhysicsVector
		x
		y
		z
		function MagneticDipoleMoment(x::Number=0u"J/T", y::Number=0u"J/T", z::Number=0u"J/T")
			x, y, z = correct_units(x, y, z, u"J/T")
			return new(x, y, z)
		end
	end
		MagneticDipoleMoment(args) = MagneticDipoleMoment(args...)

	struct MagneticVectorPotential <: PhysicsVector
		x
		y
		z
		function MagneticVectorPotential(x::Number=0u"Wb/m", y::Number=0u"Wb/m", z::Number=0u"Wb/m")
			x, y, z = correct_units(x, y, z, u"Wb/m")
			return new(x, y, z)
		end
	end
		MagneticVectorPotential(args) = MagneticVectorPotential(args...)