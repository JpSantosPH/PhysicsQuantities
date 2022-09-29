elseif d == dimension(u"A/m^2");        return CurrentDensity(x, y, z)

u"A/m^2"        => CurrentDensity,

1
    
    struct CurrentDensity{A,B,C} <: PhysicsVector where {A,B,C}
        x::Quantity{Float64, dimension(u"A/m^2"), Unitful.FreeUnits{A, dimension(u"A/m^2"), nothing}}
        y::Quantity{Float64, dimension(u"A/m^2"), Unitful.FreeUnits{B, dimension(u"A/m^2"), nothing}}
        z::Quantity{Float64, dimension(u"A/m^2"), Unitful.FreeUnits{C, dimension(u"A/m^2"), nothing}}
    end
        function CurrentDensity(x::Number=0.0u"A/m^2", y::Number=0.0u"A/m^2", z::Number=0.0u"A/m^2")
            if !(x isa Quantity); x = x*u"A/m^2" end
            if !(y isa Quantity); y = y*u"A/m^2" end
            if !(z isa Quantity); z = z*u"A/m^2" end
            x, y, z = convert.(Quantity{Float64, dimension(u"A/m^2")}, (x, y, z))
            return CurrentDensity(x, y, z)
        end
        Base.showarg(io::IO, V::CurrentDensity, toplevel) = print(io, CurrentDensity)
        CurrentDensity(args) = CurrentDensity(args...)

@testset "CurrentDensity Functionalities" begin
    @test CurrentDensity(1, 2//1000) == CurrentDensity(1 * u"A/m^2", 2//1 * u"mA/m^2", 0.0u"A/m^2")
    @test CurrentDensity() == CurrentDensity(0, 0, 0)
end