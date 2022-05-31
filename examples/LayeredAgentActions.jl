"""
    move(agent, model)
Move function for the agents. Alters the agents in the spatial layer.
If the agent has a Cognitive layer, moving makes them not-tired.
If the agent has a Physiological layer, moving makes them not-hungry.
"""
function move(agent, model)
    agent.pos = (rand(1:10), rand(1:10))
    if hasproperty(agent, Cognitive)
        agent.Cognitive.tired = false
    elseif hasproperty(agent, :Physiological)
        agent.Physiological.hungry = false
    end
end

"""
    think(agent, model)
If the agent has a cognitive layer, thinking alters them tired,
If the agent has a Physiological layer, thinking makes them hungry.
"""
function think(agent, model)
    if hasproperty(agent, Cognitive)
        agent.Cognitive.tired = true
    elseif hasproperty(agent, Physiological)
        agent.Physiological.hungry = true
    end
end