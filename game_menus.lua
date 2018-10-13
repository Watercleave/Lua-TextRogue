-- Menu texts
local mainMenuText =
[[-----=====Lua TextRogue=====-----

--Main Menu--
a) Play
b) Settings
c) Quit]]


-- Main menu function - Encapsulates all game code (Uses tail recursion to run different menus and the actual game)
function run_menu(args)

  assert(args.outputfunc and args.valuefunc and args.inputfunc and args.clearfunc,
    "Main game menu: run_menu called without core arguments.")
  
  local output = args.outputfunc
  local valuefunc = args.valuefunc
  local input = args.inputfunc
  local clear = args.clearfunc
  
  output(mainMenuText, true)
  
  while true do
    output("\nEnter your choice.")
    local choice = input(nil, ">")
    
    if choice == 'a' then return menu_play(args)
    elseif choice == 'b' then return menu_settings(args)
    elseif choice == 'c' then return
    else output("'" .. choice .. "' is not a valid option.")
    end
  end

end


function menu_play(args)
  error("Play menu not implemented yet.")
end


function menu_settings(args)
  error("Settings menu not implemented yet.")
end
