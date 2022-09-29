elseif d == dimension(u"W/(sr*m)");        return SpectralIntensity(m)

u"W/(sr*m)"        => SpectralIntensity,

@testset "SpectralIntensity Functionalities" begin
    @test SpectralIntensity(12//1000) == SpectralIntensity(12.0u"kW/(sr*m)")
    @test SpectralIntensity() == SpectralIntensity(0)
end

    struct SpectralIntensity{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"W/(sr*m)"), Unitful.FreeUnits{T, dimension(u"W/(sr*m)"), nothing}}
    end
        Base.show(io::IO, PS::SpectralIntensity) = print(io, SpectralIntensity,"(", PS.m, ")")
        function SpectralIntensity(m::Number=0.0u"W/(sr*m)")
            if !(m isa Quantity); m = m*u"W/(sr*m)" end
            m = convert(Quantity{Float64, dimension(u"W/(sr*m)")}, m)
            return SpectralIntensity(m)
        end