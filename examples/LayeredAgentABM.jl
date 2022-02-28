using Agents
using AgentsX
using Random
using InteractiveDynamics
using CairoMakie

include("LayeredAgent.jl")

function initialise(step_function; numagents=100, seed=250)
    space = GridSpace((20, 20); periodic=false)
    properties = Dict(:step_function => step_function)
    rng = Random.MersenneTwister(seed)

    model = ABM(
        LayeredAgent, space;
        properties, rng
    )

    for n in 1:numagents
        agent = LayeredAgent(n, (1, 1), 
                Social(rand(0:1)), Economic(Bool(rand(0:1))),
                Cognitive(Bool(rand(0:1)))
        )
        add_agent_single!(agent, model)
    end

    return model
end

model = initialise([move, think])

