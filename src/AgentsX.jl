module AgentsX

using Agents
using Mustache

include("layers.jl")
include("ABM.jl")
include("codegen.jl")

export ParamLayer
export AbstractLayer

export agent_step!
export AxBM
export create_agent_template

end