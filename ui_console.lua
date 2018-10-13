-- The most basic UI - just outputs to and gets input from the console


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

local function printOutput(str, clr)
  
  -- Default values
  clr = clr or false
  -- TODO Preprocess output
  
  if clr then clearConsole() end
  print(str)
  
end


local function setUIValue(key, value)
  
  -- TODO
  uivalues[key] = value
  
end

-- Get input from the console
-- inputType = line|char|int|num
local function getInput(inputType, prompt)

  inputType = inputType or "line"
  prompt = prompt or defaultprompt
  
  wout(prompt)
  
  local input = rin()
  
  -- TODO: Post-process input to match inputType
  
  return input

end


-- Initialise everything (Not much in this version)

print("Starting console.")
print("Version " .. _gameversion)

print("Loading default menu: " .. _defaultmenu)
local menu = menufile
dofile(menu)

run_menu{outputfunc=printOutput, valuefunc = setUIValue, inputfunc = getInput, clearfunc = clearConsole}









