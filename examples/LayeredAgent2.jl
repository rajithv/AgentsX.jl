using Agents
using AgentsX

include("LayeredAgentActions.jl")

"""
    Economic <:ParamLayer
The Economic layer for LayeredAgent2
"""
mutable struct Economic <: ParamLayer
    rich::Bool
end

"""
    Cognitive <:ParamLayer
The Cognitive Layer for LayeredAgent2
"""
mutable struct Cognitive <: ParamLayer
    tired::Bool
end

"""
    Physiological <:ParamLayer
The Physiological Layer for LayeredAgent2
"""
mutable struct Physiological <: ParamLayer
    hungry::Bool
end

"""
    LayeredAgent2 <: AbstractAgent
A LayeredAgent in a GridSpace
This agent has Social, Economic, and Cognitive Layers
"""
mutable struct LayeredAgent2 <: AbstractAgent
    id::Int
    pos::NTuple{2, Int}
    Economic::Economic
    Cognitive::Cognitive
    Physiological::Physiological
end


