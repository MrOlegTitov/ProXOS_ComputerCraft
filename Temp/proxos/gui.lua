--Variables
  version = "1.1.1 (Alpha)"
  running = true
  msAct = false
  
  --Api's
  os.loadAPI("/proxos/.libraries/guiLibrary")
  
  --Colors
  colTB = colors.cyan
  colBG = colors.lightBlue
  colTBA = colors.lime 
  
  --Images
  _dt = paintutils.loadImage(guiLibrary.bgPath)
  
  --Booleans
  _ms = 0
  _rcm = 0
  
--Functions

  clear = function()
    term.setBackgroundColor(colors.black)
    term.clear()
    term.setCursorPos(1,1)
  end
  
  drawMenu1 = function()
    term.setCursorPos(1,2)
    term.setBackgroundColor(colors.cyan)
    term.setTextColor(colors.red)
    print("[POWER]")
    
  end
  
  redraw = function()
    _rcm = 0
    drawDesktop()
    drawTaskbar()
    
  end
  
  rightClickMenu = function(x, y)
    term.setBackgroundColor(colors.lightGray)
    term.setTextColor(colors.lime)
    term.setCursorPos(x, y)
    term.write(" [LUA] ")
    term.setCursorPos(x, y+1)
    term.write(" [IDE] ")
    local event, button, xPos, yPos = os.pullEvent("mouse_click")
    while true do
      if button == 1 and yPos == y and xPos <= (x+7) and xPos >= x then
        running = false
        clear()
        term.setTextColor(colors.orange)
        print("Gone into Lua Prompt...")
        sleep(0.45)
        shell.run("lua")
        break
      elseif button == 1 and yPos == (y+1) and xPos <= (x+7) and xPos >= x then
        shell.run("edit","/proxos/gui.lua")
        init()
        break
      else
        redraw()
        break
      end
    end
  end
  
  drawTaskbar = function()
    term.setCursorPos(1,1)
    term.setBackgroundColor(colTB)
    term.clearLine()
    term.setCursorPos(1,1)
    term.setBackgroundColor(colTBA)
    term.setTextColor(colors.white)
    term.write("[MENU]")
  end

  stop = function()
  term.clear()
  running = false
  term.setTextColor(colors.green)
  print("Its works!")
  end

  drawDesktop = function()
    term.setBackgroundColor(colBG)
    term.clear()
    term.setCursorPos(1,1)
    paintutils.drawImage(_dt,1,1)
  end
  
  runTime = function()
    while running do
      event, button, x, y = os.pullEvent("mouse_click")
      if _ms == 0 and button == 1 and x < 7 and y == 1 then
      _ms = 1
      msAct = true
      drawMenu1()
      elseif _ms == 1 and button == 1 and y == 2 and x < 7 then
      stop()
      elseif _ms == 1 and button == 1 and y == 1 and x < 7 then
      init()
      elseif _ms == 0 and _rcm == 0 and button == 2 then
        _rcm = 1
        rightClickMenu(x, y)
      end    
    end
  end
  
  init = function()
    msAct = false
    _ms = 0
    _rcm = 0
    drawDesktop()
    drawTaskbar()
    runTime()
  end
--Main Stuff
  init()
