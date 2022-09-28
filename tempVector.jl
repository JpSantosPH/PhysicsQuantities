    struct ElectricFieldStrength{A,B,C} <: PhysicsVector where {A,B,C}
        x::Quantity{Float64, dimension(u"N/C"), Unitful.FreeUnits{A, dimension(u"N/C"), nothing}}
        y::Quantity{Float64, dimension(u"N/C"), Unitful.FreeUnits{B, dimension(u"N/C"), nothing}}
        z::Quantity{Float64, dimension(u"N/C"), Unitful.FreeUnits{C, dimension(u"N/C"), nothing}}
    end
        function ElectricFieldStrength(x::Number=0.0u"N/C", y::Number=0.0u"N/C", z::Number=0.0u"N/C")
            if !(x isa Quantity); x = x*u"N/C" end
            if !(y isa Quantity); y = y*u"N/C" end
            if !(z isa Quantity); z = z*u"N/C" end
            x, y, z = convert.(Quantity{Float64, dimension(u"N/C")}, (x, y, z))
            return ElectricFieldStrength(x, y, z)
        end
        Base.showarg(io::IO, V::ElectricFieldStrength, toplevel) = print(io, :ElectricFieldStrength)
        ElectricFieldStrength(args) = ElectricFieldStrength(args...)