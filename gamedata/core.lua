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
  
  for _, component in ipairs(obj.components) do
    
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
  
  o = {}
  o.__metatable = GameObject
  
  o.id = game.GetID()
  o.components = components
  
  for _, v in ipairs(i.components) do
    v.initialise(game, o, args) -- Initialise each of the components
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

-- cVocabObject: Objects which can be referred to or interacted with.
-- TODO

-- cActor: Objects which can act under their own power.
-- TODO

-- cScheduled: Objects which "trigger" at regular intervals.
-- TODO

-- cRoom: Rooms, which can contain other objects
-- TODO

-- cContainerObject: Objects which can contain other objects
-- TODO

-- cItem: Objects which can be picked up and carried
-- TODO

-- cWeapon: Objects which can be used in combat
-- TODO

-- cBody: Objects which have a living(-ish) body that can take damage etc.
-- TODO

-- cDamageable: Objects which can be damaged or broken
-- TODO

-- cLightSource
-- TODO

-- cSenseObject: Any object that can be detected by one or more senses
-- TODO

-- cSensor: Any object that can receive sense signals
-- TODO

-- cEffect: Any object that is primarily an effect applied to another object (eg. poison, buffs, debuffs...)
-- TODO

-- cFreezeable: Any object (usually high-overhead ones) which can be "frozen" (stopping processing) and then
--              "thawed" at a later date, catching up as needed based on the time spent frozen.
-- TODO
