function checkFiles()
  print("Checking Directories")
  print(fs.exists("/proxos"))
  sleep(0.5)
  print(fs.exists("/proxos/.backgrounds"))
  sleep(0.5)
  print(fs.exists("/proxos/.programs"))
  sleep(0.5)
  print(fs.exists("/proxos/.libraries"))
  sleep(0.5)
  print("Checking os files")
  sleep(1)
  print(fs.exists("/proxos/gui.lua"))
  sleep(0.5)
  print(fs.exists("/startup.lua"))
  sleep(0.5)
  print(fs.exists("/.bootMenu"))
  sleep(0.5)
  print(fs.exists("/proxos/command.lua"))
  sleep(0.5)
  print(fs.exists("/proxos/advBootMenu.lua"))
  sleep(0.5)
  print("Checking backgrounds")
  sleep(1)
  print(fs.exists("/proxos/.backgrounds/dt"))
  sleep(0.5)
  print(fs.exists("/proxos/.backgrounds/ld"))
  sleep(0.5)
  print(fs.exists("/proxos/.backgrounds/tl"))
  sleep(0.5)
  print("Checking programs")
  sleep(1)
  print(fs.exists("/proxos/.programs/password."))
  sleep(0.5)
  print(fs.exists("/proxos/.programs/themes.lua"))
  sleep(1)
  print("Checking libraries")
  print(fs.exists("/proxos/.libraries/guiLibrary."))
  sleep(0.5)
  print("Successfully checked")
  sleep(1.5)
end

function clearTask()
  term.clear()
  term.setCursorPos(1,1)
end

function cmdPrompt()
  term.setTextColor(colors.lime)
  term.setBackgroundColor(colors.cyan)
  print("Welcome to ProXOS command prompt.")
  print("Please type 'help' to see commands list.")
  print("---------------------------------------------")  
  local cmd = read()
  if cmd == "help" then
    print("Commands:")
    print("help: showing this cmd list")
    print("px.load('file name')")
    print("this is working commands. Wait for updates!!! :-)")
  end
end  

function loadTask()
  term.setBackgroundColor(colors.black)
  term.setTextColor(colors.white)
  term.clear()
  term.setCursorPos(10,1)
  print("Safe Mode Console")
  term.setCursorPos(1,2)
  print("Loading...")
  os.sleep(1)
  print("Next Task: Checking os files...")
  checkFiles()
  sleep(1)
  textutils.slowPrint("**************************")
  sleep(0.5)
  clearTask()
  sleep(0.5)
  cmdPrompt()
  
 end
 loadTask()