"""
    agent_step!(agent, model)
    Generalised step function
"""
function agent_step!(agent, model)
    steps = model.step_function
    for func in steps
        func(agent, model)
    end    
end

"""
    ABM(agents::Array{<:AbstractAgent}, args...; kwargs...)
    A method for ABM function to accept a list of agent types
"""
function AxBM(agents::Array{<:AbstractAgent}, args...; kwargs...)
    return ABM(Union{agents...}, args...; kwargs...)
end