elseif d == dimension(u"Hz/s")
    return FrequencyDrift(m)

dimension(u"Hz/s") => FrequencyDrift,

@testset "FrequencyDrift Functionalities" begin
    @test FrequencyDrift(12//1000) == FrequencyDrift(12u"mHz/s")
    @test FrequencyDrift() == FrequencyDrift(0)
end

struct FrequencyDrift <: PhysicsScalar
    m::typeof(1.0u"Hz/s")

    function FrequencyDrift(m::Number=0.0u"Hz/s")
        if !(m isa Quantity)
            m = m * u"Hz/s"
        end
        new(m)
    end
end
