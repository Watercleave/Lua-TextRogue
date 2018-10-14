-- Code for basic item handling

-- cItem: Objects which can be picked up and carried
-- TODO
cItem = {__metatable=cItem, __index=cItem}
cItem.size = 1 -- Nominally, number of coke cans (volume)
cItem.weight = 0 -- Nominally, in kg

-- TODO cItem.CanTouch, CanPickup, CanDrop



-- cWieldable: Objects which can be used in combat
-- TODO
cWieldable = {__metatable=cWieldable, __index=cWieldable}
cWieldable.attackpoints = {} -- String-indexed list of attack types ("hilt", "edge", "point", etc.)
                             -- Values are attack tables (see core_combat.lua)
                             -- TODO
                             
-- Returns an attack table.
-- TODO
function cWieldable:getAttack(attackpoint, target, attackdetails)
  
  -- TODO
  
end


-- cWearable
-- TODO
cWearable = {__metatable=cWearable, __index=cWearable}
cWearable.isWorn = false
cWearable.slot = "UNDEFINED" -- Described where/how the item is worn

-- Test if the current holder (self.owner.location) can wear this.
-- Announces the reason for failure unless silent=true
function cWearable:CanWear(silent)
  
  -- TODO
  
end

-- Test if the current wearer (self.owner.location) can remove it.
-- Announces the reason for failure unless silent=true
function cWearable:CanRemove(silent)
  
  -- TODO
  
end

function cWearable:Wear(silent)
  
  -- TODO
  
end

function cWearable:Remove(silent)
  
  -- TODO
  
end


-- cThrowable
-- TODO
cThrowable = {__metatable=cThrowable, __index=cThrowable}

function cThrowable:Throw(actor, target)
  
  -- TODO
  
end

-- cContainerObject: Objects which can contain other objects
-- TODO
cContainerObject = {__metatable=cContainerObject, __index=cContainerObject}
cContainerObject.contents = {} -- Keys = object IDs, value = true OR nil

-- Can item be placed by actor into the container?
-- Announces reason for failure unless silent=true
function cContainerObject:CanPlaceInto(item, actor, silent)
  
  -- TODO
  
end

-- Can item be removed from the container by the actor?
-- Announces reason for failure unless silent=true
function cContainerObject:CanGetFrom(item, actor, silent)
  
  -- TODO
  
end

-- Actually moves the item from its previous container/room into this one
-- Announces movement unless silent=true
function cContainerObject:MoveInto(item, actor, silent)
  
  -- TODO
  
end


-- cDamageable: Objects which can be damaged or broken
-- TODO