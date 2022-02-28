using Agents
using AgentsX

include("LayeredAgentActions.jl")

"""
    Social <:ParamLayer
The Social layer for LayeredAgent
"""
mutable struct Social <: ParamLayer
    ethnicity::Int
end

"""
    Economic <:ParamLayer
The Economic layer for LayeredAgent
"""
mutable struct Economic <: ParamLayer
    rich::Bool
end

"""
    Cognitive <:ParamLayer
The Cognitive Layer for LayeredAgent
"""
mutable struct Cognitive <: ParamLayer
    tired::Bool
end

"""
    LayeredAgent <: AbstractAgent
A LayeredAgent in a GridSpace
This agent has Social, Economic, and Cognitive Layers
"""
mutable struct LayeredAgent <: AbstractAgent
    id::Int
    pos::NTuple{2, Int}
    Social::Social
    Economic::Economic
    Cognitive::Cognitive
end


