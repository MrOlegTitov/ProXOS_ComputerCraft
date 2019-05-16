os.pullEvent = os.pullEventRaw
term.setBackgroundColor(colors.gray)
term.setTextColor(colors.cyan)
os.loadAPI("/proxos/.libraries/guiLibrary")

local w,h = term.getSize()

function printCentered( y,s )
   local x = math.floor((w - string.len(s)) / 2)
   term.setCursorPos(x,y)
   term.clearLine()
   term.write( s )
end

local nOption = 1

local function drawMenu()
   term.clear()
   term.setCursorPos(1,1)
   term.write("Pesonalization")

   term.setCursorPos(w-11,1)
   if nOption == 1 then
   term.write("BG: Block")
elseif nOption == 2 then
   term.write("BG: Earth")
elseif nOption == 3 then
   term.write("BG: Moon")
elseif nOption == 4 then
   term.write("Back")
else
end

end

--GUI
term.clear()
local function drawFrontend()
   printCentered( math.floor(h/2) - 4,  "Ver. 0.15")
   printCentered( math.floor(h/2) - 3, "Personalization app")
   printCentered( math.floor(h/2) - 2, "Backgrounds:" )
   printCentered( math.floor(h/2) - 1, "")
   printCentered( math.floor(h/2) + 0, ((nOption == 1) and "[ BG: Block]") or "BG: Block" )
   printCentered( math.floor(h/2) + 1, ((nOption == 2) and "[ BG: Earth]") or "BG: Earth" )
   printCentered( math.floor(h/2) + 2, ((nOption == 3) and "[ BG: Moon ]") or "BG: Moon" )
   printCentered( math.floor(h/2) + 3, ((nOption == 4) and "[ Exit app]") or "Exit app" )
   printCentered( math.floor(h/2) + 4, "")
end

--Display
drawMenu()
drawFrontend()

while true do
 local e,p = os.pullEvent()
 if e == "key" then
  local key = p
  if key == 17 or key == 200 then

   if nOption > 1 then
    nOption = nOption - 1
    drawMenu()
    drawFrontend()
   end
  elseif key == 31 or key == 208 then
  if nOption < 4 then
  nOption = nOption + 1
  drawMenu()
  drawFrontend()
end
elseif key == 28 then
    --End should not be here!!
break
end --End should be here!!
end
end
term.clear()

--Conditions
if nOption  == 1 then
guiLibrary.bgPath = "/proxos/.backgrounds/_dt"
os.sleep(1)
shell.run("/proxos/gui.lua")
elseif nOption == 2 then
guiLibrary.bgPath = "/proxos/.backgrounds/_ld"
os.sleep(1)
shell.run("/proxos/gui.lua")
elseif nOption == 3 then
guiLibrary.bgPath = "/proxos/.backgrounds/_tl"
os.sleep(1)
shell.run("/proxos/gui.lua")
else
os.sleep(1)
shell.run("/proxos/gui.lua")
end