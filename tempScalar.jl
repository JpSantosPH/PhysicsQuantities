elseif d == dimension(u"S/m");        return Conductivity(m)

u"S/m"        => Conductivity,

1

    struct Conductivity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"S/m"), Unitful.FreeUnits{T, dimension(u"S/m"), nothing}}
    end
        Base.show(io::IO, PS::Conductivity) = print(io, Conductivity,"(", PS.m, ")")
        function Conductivity(m::Number=0.0u"S/m")
            if !(m isa Quantity); m = m*u"S/m" end
            m = convert(Quantity{Float64, dimension(u"S/m")}, m)
            return Conductivity(m)
        end

@testset "Conductivity Functionalities" begin
    @test Conductivity(12//1000) == Conductivity(12.0u"mS/m")
    @test Conductivity() == Conductivity(0)
end