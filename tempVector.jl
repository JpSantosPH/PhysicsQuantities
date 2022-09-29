elseif d == dimension(u"N");        return Force(x, y, z)

u"N"        => Force,

@testset "Force Functionalities" begin
    @test Force(1, 2//1000) == Force(1 * u"N", 2//1 * u"mN", 0.0u"N")
    @test Force() == Force(0, 0, 0)
end
    
    struct Force{A,B,C} <: PhysicsVector where {A,B,C}
        x::Quantity{Float64, dimension(u"N"), Unitful.FreeUnits{A, dimension(u"N"), nothing}}
        y::Quantity{Float64, dimension(u"N"), Unitful.FreeUnits{B, dimension(u"N"), nothing}}
        z::Quantity{Float64, dimension(u"N"), Unitful.FreeUnits{C, dimension(u"N"), nothing}}
    end
        function Force(x::Number=0.0u"N", y::Number=0.0u"N", z::Number=0.0u"N")
            if !(x isa Quantity); x = x*u"N" end
            if !(y isa Quantity); y = y*u"N" end
            if !(z isa Quantity); z = z*u"N" end
            x, y, z = convert.(Quantity{Float64, dimension(u"N")}, (x, y, z))
            return Force(x, y, z)
        end
        Base.showarg(io::IO, V::Force, toplevel) = print(io, Force)
        Force(args) = Force(args...)