    struct Action{T} <: PhysicsScalar where {T}
        m::Quantity{Float64, dimension(u"J*s"), Unitful.FreeUnits{T, dimension(u"J*s"), nothing}}
    end
        Base.show(io::IO, PS::Action) = print(io, Action,"(", PS.m, ")")
        function Action(m::Number=0.0u"J*s")
            if !(m isa Quantity); m = m*u"J*s" end
            m = convert(Quantity{Float64, dimension(u"J*s")}, m)
            return Action(m)
        end