elseif d == dimension(u"N*m*s")
    return AngularMomentum(x, y, z)

dimension(u"N*m*s") => AngularMomentum,

@testset "AngularMomentum Functionalities" begin
    @test AngularMomentum(1, 2//1000) == AngularMomentum(1 * u"N*m*s", 2//1 * u"mN*m*s", 0.0u"N*m*s")
    @test AngularMomentum() == AngularMomentum(0, 0, 0)
end

    struct AngularMomentum <: PhysicsVector
        x::typeof(1.0u"N*m*s")
        y::typeof(1.0u"N*m*s")
        z::typeof(1.0u"N*m*s")

        function AngularMomentum(x::Number=0.0u"N*m*s", y::Number=0.0u"N*m*s", z::Number=0.0u"N*m*s")
            if !isa(x, Quantity)
                x = x * u"N*m*s"
            end
            if !isa(y, Quantity)
                y = y * u"N*m*s"
            end
            if !isa(z, Quantity)
                z = z * u"N*m*s"
            end
            return new(x, y, z)
        end
    end
        AngularMomentum(args) = AngularMomentum(args...)