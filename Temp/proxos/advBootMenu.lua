term.setBackgroundColor(colors.blue)
os.pullEvent = os.pullEventRaw

local w,h = term.getSize()

function printCentered( y,s )
   local x = math.floor((w - string.len(s)) / 2)
   term.setCursorPos(x,y)
   term.clearLine()
   term.write( s )
end

local nOption = 1

local function drawMenu()
   term.setTextColor(colors.lightGray)
   term.clear()
   term.setCursorPos(1,1)
   term.write("Advanced boot menu ")

   term.setCursorPos(w-13,1)
  if nOption == 1 then
   term.write("SM Without CMD")
  elseif nOption == 2 then
   term.write("SM Only CMD")
  elseif nOption == 3 then
   term.write("Uninstall ProXOS")
  elseif nOption == 4 then
   term.write(" <-Back--- ")
  else
end

end

--GUI
term.clear()
local function drawFrontend()
   term.setTextColor(colors.lightGray)
   printCentered( math.floor(h/2) - 4, "")
   printCentered( math.floor(h/2) - 3, "Advanced boot menu")
   printCentered( math.floor(h/2) - 2, "Select advanced boot option" )
   printCentered( math.floor(h/2) - 1, "")
   printCentered( math.floor(h/2) + 0, ((nOption == 1) and "[SM without cmd]") or "SM without cmd" )
   printCentered( math.floor(h/2) + 1, ((nOption == 2) and "[SM only os cmd]") or "SM only os cmd" )
   printCentered( math.floor(h/2) + 2, ((nOption == 3) and "[Uninstall ProXOS]") or "Uninstall Proxos")
   printCentered( math.floor(h/2) + 3, ((nOption == 4) and "[<-Back-to-os--]") or "<-Back-to-os--" )
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
  if nOption < 3 then
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
shell.run("/proxos/safeMode1.lua")
elseif nOption == 2 then
shell.run("/proxos/safeMode2.lua")
elseif nOption == 3 then
shell.run("/proxos/unins.lua")
elseif nOption == 4 then
shell.run("/.bootMenu")
end
