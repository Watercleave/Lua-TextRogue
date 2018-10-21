

-- The basic Game object
Game = {}
Game.__metatable = Game

function Game:new(o)
  
  o = o or {}
  o.__index = self
  
  -- Game.objects is an ID-indexed list of objects (tables)
  o.objects = {}
  o.nextID = o.nextID or 0
  o.playerActor = -1
  
  -- Game.schedule is a table, indexed by timepoint (as integers), containing a list of all actors to execute
  -- at each (indexed) timepoint.
  o.schedule = {}
  
  -- Time is measured in milliseconds. At each integer timestep, the actors and schedulables
  -- scheduled there are run, in the order they were recieved.
  o.time = 0 
  
  return o
  
end

-- TODO Add loading Game from file
-- TODO Add saving Game to file

-- Returns an ID for the next object to be created.
function Game:GetID()
  
  n = self.nextID
  self.nextID = n + 1
  return n
  
end


function Game:AddObject(object)
  
  object.id = object.id or self.GetID()
  self.objects[object.id] = object
  
  -- TODO Check for schedulable and schedule if necessary
  
end

-- Returns an object based on its ID reference
function Game:GetObject(id)
  
  -- Assert that the object exists
  assert(self.objects[id], "Tried to get object with ID: " .. id .. "; No such ID.")
  
  return self.objects[id]
  
end

-- Alias for Game:GetObject(id)
function Game:g(id) return self.GetObject(id) end

function Game:SetPlayerActor(id)
  
  if self.playerActor >= 0 then
    -- There is already a player actor.
    -- TODO reset that actor to their default Act().
  end
  
  local newPlayerActor = self:g(id)
  self.playerActor = newPlayerActor
  newPlayerActor.components.actor.Act = function(self)
    
    -- TODO Get input
    -- TODO Parse input
    -- TODO Perform action
    -- TODO Return scheduling delay
    
  end
  
end


-- Schedule the object with the given id to run or act at a specified time after "now".
function Game:Schedule(id, offset)
  
  -- Get the offset time at which to schedule the object.
  local time = offset + self.time
  
  -- Initialise the list for this timestep
  if not self.schedule[time] then
    self.schedule[time] = {}
  end
  
  table.insert(self.schedule[time], id)
  
end


function Game:Run()
  
  
  while(true) do
    
    -- If there is anything scheduled to happen at this timestep...
    if self.schedule[self.time] then
      
      -- Iterate through everything scheduled to happen at this timestep.
      for _, v in ipairs(self.schedule[self.time]) do
        
        local obj = self:g(v) -- Get the actual object reference
        
        if obj.components.cActor then
          local offset = obj:Act() -- Have the actor act; this returns the offset to the next action.
          self:Schedule(v, offset)
        elseif obj.components.cScheduled then
          local offset = obj:Trigger()
          self:Schedule(v, offset)
        else
          error("Scheduled object " .. v .. " has neither cActor nor cScheduled")
        end
      end
      
    end
    
  end
  
  
end

