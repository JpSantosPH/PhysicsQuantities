begin
    using Unitful
    using LinearAlgebra
    include("PhysicsQuantities.jl")
    using .PhysicsQuantities
end

@code_warntype convert.(Quantity{Float64, dimension(u"s")}, (1u"s", 2.0u"s", 3u"s"))

@code_warntype 

@benchmark [correct_args(i, 2.0u"s", i*u"s", u"s") for i in 1:100]
Speed(1)
function correct_args(m::Number, unit::Unitful.Units)
    if !(m isa Quantity); m = m*unit end
    return convert(Quantity{Float64, dimension(unit)}, m)
end