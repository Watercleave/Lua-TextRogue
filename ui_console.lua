_gameversion = "0.01"
_defaultmenu = "game_menus.lua"


-- Definitions

local uivalues = {}  -- String-indexed table of anything that needs an icon, prompt etc.
local defaultprompt = ">"
local rin = io.read
local wout = io.write

-- Define utility functions

local function clearConsole()
  
  for i=1, 30 do
    print()
  end
  
end


-- Define callbacks

local function printOutput(str)
  
  -- TODO
  
  print(str)
  
end


local function setUIValue(key, value)
  
  -- TODO
  uivalues[key] = value
  
end


local function getInput(inputType, prompt)

  inputType = inputType or "line"
  prompt = prompt or defaultprompt
  
  -- TODO: Check inputType
  
  wout(prompt)
  
  -- TODO: Post-process input to match inputType
  
  return rin()

end


-- Initialise everything (Not much in this version)

print("Starting console.")
print("Version " .. _gameversion)

print("Loading default menu: " .. _defaultmenu)
local menu = _defaultmenu
dofile(menu)

run_menu{outputfunc=printOutput, valuefunc = setUIValue, inputfunc = getInput}









