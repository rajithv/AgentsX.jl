export create_agent_template

template_model = mt"""
using Agents
using AgentsX
using Random
using InteractiveDynamics
using CairoMakie

include("agent.jl")

\"\"\"
    initialise()
Initialise function for the ABM.
This function will return the ABM.
Arguments necessary for declaring the space will need to be passed manually.
\"\"\"

function initialise(step_function; numagents = {{:num_agents}}, seed = {{:random_seed}} )
    space = {{:space}}
    properties = Dict(:step_function => step_function)
    rng = Random.MersenneTwister(seed)
    
    model = ABM(
        {{:agent_class}}, space;
        properties, rng
    )

    for n in 1:numagents
        agent = {{:agent_class}}(
            #TODO Complete Agent Initialisation
        )
        add_agent_single!(agent, model)
    end

    return model

end

#TODO reorder agent actions in expected execution order if required.
#TODO insert keyword arguments if required
model = initialise([{{#:actions}}{{.}}{{^.[end]}}, {{/.[end]}}{{/:actions}}])
"""

template_agent = mt"""
using Agents
using AgentsX

include("actions.jl")
{{#:layers}}

\"\"\"
    {{.}} <:ParamLayer
The {{.}} layer for {{:agent_class}}.
\"\"\"
mutable struct {{.}} <: ParamLayer
    #TODO enter parameters for the {{.}} Layer
end

{{/:layers}}

\"\"\"
    {{:agent_class}} <:AbstractAgent
A {{:agent_class}} in a {{:space}}.
The agents by default possess the following layers:
{{#:layers}} 
    - {{.}}
{{/:layers}}
Spatial functions are handled by the respective space of Agents.jl
\"\"\"

mutable struct {{:agent_class}} <:AbstractAgent
    id::Int
    #TODO customise 'pos' as necessary
    #pos::NTuple{2, Int}
    {{#:layers}}
    {{.}}::{{.}}
    {{/:layers}}
end
"""

template_action = mt"""
{{#:actions}}
\"\"\"
{{.}}(agent, model)
TODO <Enter action description>
\"\"\"
function {{.}}(agent, model)

    #INPUT <Layer>

    #TODO complete {{.}} action code
    #TODO enter input/output layer information

    #OUTPUT <Layer>
end
{{/:actions}}
"""

function create_agent_template(;agent_class, num_agents, space, random_seed = 250, layers = Nothing, actions = Nothing, path = "src")
    if layers == Nothing
        layers = ["SocioEconomic", "Cognitive", "Physiological"]
    end
    dict = Dict(:agent_class => agent_class, :num_agents => num_agents, :space => space, :random_seed => random_seed, :layers => layers, :actions => actions)
    open(path * "/model.jl", "w") do io
        write(io, render(template_model, dict))
    end

    open(path * "/agent.jl", "w") do io
        write(io, render(template_agent, dict))
    end

    open(path * "/actions.jl", "w") do io
        write(io, render(template_action, dict))
    end
    
end
