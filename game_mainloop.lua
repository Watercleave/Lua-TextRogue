

-- The basic Game object
Game = {}
Game.__metatable = Game

function Game:new(o)
  
  o = o or {}
  o.__index = self
  
  -- Game.objects is an ID-indexed list of objects (tables)
  o.objects = {}
  o.nextID = o.nextID or 0
  
  -- Game.schedule is a table, indexed by timepoint (as integers), containing a list of all actors to execute
  -- at each (indexed) timepoint.
  o.schedule = {}
  
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

function Game:Run()
  
  -- TODO Game loop code goes here
  
end

