using Agents
using AgentsX
using Random
using InteractiveDynamics
using CairoMakie

include("LayeredAgent.jl")
include("LayeredAgent2.jl")

function initialise(step_function; numagents=100, seed=250)
    space = GridSpace((20, 20); periodic=false)
    properties = Dict(:step_function => step_function)
    rng = Random.MersenneTwister(seed)

    model = AgentsX.ABM(
        [LayeredAgent, LayeredAgent2], space;
        properties, rng
    )

    for n in 1:numagents/2
        agent = LayeredAgent(n, (1, 1), 
                Social(rand(0:1)), Economic(Bool(rand(0:1))),
                Cognitive(Bool(rand(0:1)))
        )
        agent2 = LayeredAgent2(n*2, (1, 1),
                Economic(Bool(rand(0:1))),
                Cognitive(Bool(rand(0:1))),
                Physiological(Bool(rand(0:1)))
        )
        add_agent_single!(agent, model)
        add_agent_single!(agent2, model)
    end


    return model
end

model = initialise([move, think])

step!(model, agent_step!)