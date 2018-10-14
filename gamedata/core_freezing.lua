-- Contains code for freezing actors and other schedulables, then thawing them and "catching up"
-- on lost time later.

-- TODO


-- cFreezeable: Any object (usually high-overhead ones) which can be "frozen" (stopping processing) and then
--              "thawed" at a later date, catching up as needed based on the time spent frozen.
-- TODO