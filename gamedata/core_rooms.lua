-- Code for rooms
-- TODO

-- cRoom: Rooms, which can contain other objects
-- TODO
cRoom = {__metatable=cRoom, __index=cRoom}
cRoom.contents = {} -- Keys = object IDs, value = true OR nil
cRoom.exits = {} -- String-indexed list of either cRooms or cLinks

-- Can the actor enter the room? Returns true or false.
-- Announces reason for failure unless silent=true
function cRoom:CanEnter(actor, movetype, silent)
  
  movetype = movetype or "walk"
  
  -- TODO
  
end

-- Can the actor exit the room? Returns true or false.
-- Announces reason for failure unless silent=true
function cRoom:CanExit(actor, movetype, silent)
  
  movetype = movetype or "walk"
  
  -- TODO
  
end

-- Physically move the actor into the room (and out of their previous one)
-- Announces their departure and arrival (unless silent_*=true)
function cRoom:MoveInto(actor, movetype, silent_depart, silent_arrive)
  
  movetype = movetype or "walk"
  -- TODO
  
end