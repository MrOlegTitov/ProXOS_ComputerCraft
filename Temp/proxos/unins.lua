term.setBackgroundColor(colors.lightGray)
term.setTextColor(colors.blue)
term.clear()
term.setCursorPos(1,1)
print("Do you want to uninstall ProXOS?")
print("Type 'I want' if you want")
print("Type 'cancel' if you dont want")
while true do
local answer = read()
if answer == "" then
  print("Error Please Type Again!")
elseif answer == "I want" then
  shell.run("pastebin run ceEdSPPF")
end
end

