"""
    agent_step!(agent, model)
    Generatlised step function
"""
function agent_step!(agent, model)
    steps = model.step_function
    for func in steps
        func(agent, model)
    end    
end