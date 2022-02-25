module AgentsX

export ParamLayer
export AbstractLayer

export agent_step!

include("layers.jl")
include("ABM.jl")

end