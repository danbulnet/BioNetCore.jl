module Similarity

export WeightedSimilarityConnection

import BioNetCore.Abstraction: AnyNeuron, AnySimilarityConnection
import BioNetCore.ID
import BioNetCore.ID: ConnectionID
import BioNetCore.Connection

function Connection.kind(connection::AnySimilarityConnection)::ConnectionKind
    ConnectionKind::SimilarityConnectionKind
end

mutable struct WeightedSimilarityConnection <: AnySimilarityConnection 
    from::AnyNeuron
    to::AnyNeuron
    weight::Float32
end

Connection.from(connection::WeightedSimilarityConnection)::AnyNeuron = connection.from

Connection.to(connection::WeightedSimilarityConnection)::AnyNeuron = connection.to

function ID.id(connection::WeightedSimilarityConnection)::ConnectionID
    ConnectionID(ID.id(Connection.from(connection)), ID.id(Connection.to(connection)))
end

Connection.weight(connection::WeightedSimilarityConnection)::AnyNeuron = connection.weight

end