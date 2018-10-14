-- Contains the core components used by the game.
-- Also defines a factory to create objects based on a list of components

-- NBNB All game objects reference other objects by integer ID, NOT by direct reference
-- (This allows for easier serialisation)
-- (Might consider changing this to dynamically assign IDs on save, and then resolve to direct references
-- on load)

-- Prototype for GameObjects
-- Methods only, no variables (those go in components)
GameObject = {}
GameObject.__metatable = GameObject

-- If a non-GameObject method  or variable is called on a GameObject, we traverse its components until we
-- find one to handle the or provide the variable. If there is none, raise an error.
local function GetValueFromComponent(obj, value)
  
  assert(obj.components)
  
  for _, component in pairs(obj.components) do
    
    if component[value]then
      return component[value]
    end
    
  end
  
  error("Attempted to invoke '" .. value .. "' of '" .. obj .. "'. No such method or variable exists.", 2)
  
  
end
GameObject.__index = GetValueFromComponent

-- Ditto, for setting values
-- If no component has an entry, add one to the BASE object
local function SetValueToComponent(obj, key, value)
  
  assert(obj.components)
  
  for _, component in obj.components do
    
    if component[key] then
      component[key] = value
      return true
    end
    
  end
  
  obj[key] = value
  return false
  
end


-- Instantiates a new game object, pulling an ID from the first argument and giving it all the
-- components listed in the second argument.
-- Finally, adds the new object to game.objects and returns its ID.
function GameObject:new(game, components, args)
  
  assert(game)
  components = components or {}
  
  local o = {}
  o.__metatable = GameObject
  
  o.id = game.GetID()
  o.game = game
  o.components = components
  
  for _, v in pairs(i.components) do
    v.initialise(game, o, args) -- Initialise each of the components
    v.owner = o
  end
  
  game.AddObject(o)
  
  return o.id
  
end



-- Now we define all of the components which make up GameObjects
-- Every component needs, at minimum, an initialise() function and a component name
-- 
-- The prototype objects are metatable-indexes with only functions, NO variables
--
-- All component names have the form c*

-- TODO Split components off into core_*.lua files

-- cPhysicsObject: All objects which have a physical location in the game world.
-- TODO
cPhysicsObject = {__metatable=cPhysicsObject, __index=cPhysicsObject}
cPhysicsObject.location = -1

-- Silent utility method to move the item from one place to another.
-- Does not perform any checks; teleports item from one place to another
-- Correctly handles items in limbo (location=-1)
-- Use this rather than manually changing .location and .contents of items
function cPhysicsObject:UtilityMove(destID)
  
  local game = self.owner.game
  local sourceID = self.location
  
  local sourceObj = nil
  local destObj = nil
  if sourceID >= 0 then sourceObj = game:g(sourceID) end
  if destID >= 0 then sourceObj = game:g(destID) end
  
  if sourceObj then
    sourceObj.contents[self.id] = nil
  end
  
  if destObj then
    destObj.contents[self.id] = true
  end
  
  self.location = destID
  
end


-- cVocabObject: Objects which can be referred to or interacted with.
-- TODO
cVocabObject = {__metatable=cVocabObject, __index = cVocabObject}
cVocabObject.nouns = {}
cVocabObject.adjectives = {}
cVocabObject.pronounset = {} -- TODO
cVocabObject.printedName = "name uninitialised"
cVocabObject.fullName = "full name uninitialised"
cVocabObject.distinguishers = {}

-- cActor: Objects which can act under their own power.
-- TODO
cActor = {__metatable=cActor, __index = cActor}
function cActor:Act()
  error("cActor " .. self .. " in " .. self.owner .. " does not override cActor:Act()")
end


-- cScheduled: Objects which "trigger" at regular intervals.
-- TODO
cScheduled = {__metatable=cActor, __index=cActor}
function cScheduled:Trigger()
  error("cScheduled " .. self .. " in " .. self.owner .. " does not override cScheduled:Trigger()")
end


-- cInventoryObject: Any 'object' (normally a cActor) with an inventory
-- TODO
cInventoryObject = {__metatable=cInventoryObject, __index=cInventoryObject}
cInventoryObject.contents = {} -- Keys = object IDs, value = true OR nil

-- Can items be picked up, retrieved from a container, etc. by this actor?
-- Announces reason for failure unless silent=true
function cInventoryObject:CanGet(item, silent)
  
  -- TODO
  
end

-- Can items be dropped, put into containers, etc. by this actor
-- Announces reason for failure unless silent=true
function cInventoryObject:CanDrop(item, destination, silent)
  
  -- TODO
  
end

-- Moves an item into this inventory.
-- Announces, unless silent=true
function cInventoryObject:Get(item, silent)
  
  -- TODO
  
end
