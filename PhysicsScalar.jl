using Unitful
using Test

function (A::Unitful.FreeUnits)(m::Real)
    return m * A
end

@testset begin
    @test 12.3u"m/s" == u"m/s"(12.3)
end