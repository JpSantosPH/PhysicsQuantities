Base.Broadcast.BroadcastStyle(::Type{<:PhysicsVector}) = Broadcast.ArrayStyle{PhysicsVector}()
function Base.similar(bc::Broadcast.Broadcasted{Broadcast.ArrayStyle{PhysicsVector}}, ::Type{ElType}) where ElType
    GeneralVector()
end