module("CoreGUI", package.seeall)
require "defines"
require "scripts/oninit"

local BUTTON_COLSPAN = 3 -- copied from testing mode mod
guiNames = {mainFlowMaster="MasterGUIFlow",
            mainFrameMaster="MasterGUIFrame",
            buttonFlowMaster="MasterGUIPartFlow",
			mainFlowCore="CoreGUIFlow",
            mainFrameCore="CoreGUIFrame",
            buttonFlowCore="CoreGUIPartFlow",
			mainFlowDynamic="DynamicGUIFlow",
            mainFrameDynamic="DynamicGUIFrame",
            buttonFlowDynamic="DynamicGUIPartFlow",
			mainFlowTools="ToolsGUIFlow",
            mainFrameTools="ToolsGUIFrame",
            buttonFlowTools="ToolsGUIPartFlow",
			mainFlowMetallurgy="MetallurgyGUIFlow",
            mainFrameMetallurgy="MetallurgyGUIFrame",
            buttonFlowMetallurgy="MetallurgyGUIPartFlow",
			mainFlowAbout="AboutGUIFlow",
            mainFrameAbout="AboutGUIFrame",
            buttonFlowAbout="AboutGUIPartFlow",
            ExportButton="CoreGUIExport!",
            DebugButton="CoreGUIDebug!",
            AboutButton="MasterGUIAbout!",
            ExitButton="MasterGUIExit!",
            BackButton="CoreGUIBack!",
            CoreButton="CoreGUICore!",
            DynamicButton="CoreGUIDynamic!",
            ToolsButton="CoreGUITools!",
            MetallurgyButton="CoreGUIMetallurgy!",
            DynamicSystemButton="DynamicGUISystem!",
            DynamicSystemHardButton="DynamicGUISystemHard!",
            ToolsCraftingButton="ToolsGUICrafting!",
            ToolsItemButton="ToolsGUIItemLost!",
            MetallurgyFluidsButton="MetallurgyGUIFluids!",
            MetallurgyOresButton="MetallurgyGUIOres!",
            labelCore="CoreGUILabelCore",
            labelDynamic="CoreGUILabelDynamic",
            labelTools="CoreGUILabelDynamic",
            labelMetallurgy="CoreGUILabelMetallurgy",
            label0="CoreGUILabel0",
            label="CoreGUILabel",
            label1="CoreGUILabel1",
            label2="CoreGUILabel2",
            label3="CoreGUILabel3",
            label4="CoreGUILabel4",
            label5="CoreGUILabel5",
            label6="CoreGUILabel6",
            label7="CoreGUILabel7",
            label8="CoreGUILabel8",
            label9="CoreGUILabel9",
            label10="CoreGUILabel10",
            label11="CoreGUILabel11",
            label12="CoreGUILabel12",
            label13="ToolsGUILabel1",
            label15="CoreGUILabel13",
            label16="CoreGUILabel14",
            label14="MetallurgyGUILabel1",
            labelAbout1="AboutGUILabel1",
            labelAbout2="AboutGUILabel2",
            labelAbout3="AboutGUILabel3",
            labelAbout4="AboutGUILabel4",
            labelAbout5="AboutGUILabel5",
            labelAbout6="AboutGUILabel6",
            labelAbout7="AboutGUILabel7",
            labelAbout8="AboutGUILabel8",
            labelAbout9="AboutGUILabel9",
            labelAbout10="AboutGUILabel10",
            }
mainFrameMaster = nil -- placeholder
mainFrameCore = nil -- placeholder
mainFrameDynamic = nil -- placeholder
mainFrameTools = nil -- placeholder
mainFrameMetallurgy = nil -- placeholder
mainFrameAbout = nil -- placeholder
MainScreen = "Click the Module you want to use Commands for!"
Core = "These are the Options for DyTech-Core!"
Dynamic = "These are the Options for DyTech-Dynamic!"
Tools = "These are the Options for DyTech-Tools!"
Metallurgy = "These are the Options for DyTech-Metallurgy!"
Tools1 = "Lost the item for the Crafting Bench? Click the Give Button to get it again!"
Metallurgy1 = "Regeneration of Fluids or Ores Takes some time, prepare for some Lag!"
About7 = "All DyTech modules are made by Dysoch!"
About8 = "Usage of code from the modules is only allowed with permission from Dysoch"
About9 = ""
About10 = ""
About1 = "Special Thanks To:"
About2 = "FreeER, for helping me when i started out, and with the start of the Dynamic System."
About3 = "drs9999, for lending me his tree growing codes."
About4 = "TheBruteMan, for updating Inserters, and making videos for me!"
About5 = "The Devs: For making this great game, and allowing it to be easily moddable."
About6 = "Everybody for has donated the information from the Export function!"
function showMasterGUI()
for i,player in ipairs(game.players) do
local center = player.gui.center
	player.gui.center.add({type="flow", direction="vertical", name=guiNames.mainFlowMaster})
	player.gui.center[guiNames.mainFlowMaster].add({type="frame", direction="vertical", name=guiNames.mainFrameMaster, caption="DyTech Control Center!"})
	mainFrameMaster = player.gui.center[guiNames.mainFlowMaster][guiNames.mainFrameMaster]
	for ii,pplayer in ipairs(game.players) do
		mainFrameMaster.add({type="flow", direction="horizontal", name=guiNames.mainFlowMaster})
		mainFrameMaster[guiNames.mainFlowMaster].add({type="button", name=guiNames.CoreButton, caption="DyTech-Core!"})
		if glob.dytech.dynamic then mainFrameMaster[guiNames.mainFlowMaster].add({type="button", name=guiNames.DynamicButton, caption="DyTech-Dynamic!"}) end
		if glob.dytech.tools then mainFrameMaster[guiNames.mainFlowMaster].add({type="button", name=guiNames.ToolsButton, caption="DyTech-Tools!"}) end
		if glob.dytech.metallurgy then mainFrameMaster[guiNames.mainFlowMaster].add({type="button", name=guiNames.MetallurgyButton, caption="DyTech-Metallurgy!"}) end
		mainFrameMaster[guiNames.mainFlowMaster].add({type="button", name=guiNames.AboutButton, caption="About!"})
		mainFrameMaster[guiNames.mainFlowMaster].add({type="button", name=guiNames.ExitButton, caption="Close!"})
		if debug_master then mainFrameMaster[guiNames.mainFlowMaster].add({type="button", name=guiNames.DebugButton, caption="Debug!"}) end
		mainFrameMaster.add({type="label", name=guiNames.label0, caption=MainScreen})
		mainFrameMaster.add({type="label", name=guiNames.label, caption="You have played".." "..tostring(glob.timer.hours).." ".."Hours,".." "..tostring(glob.timer.minutes).." ".."Minutes and".." "..tostring(glob.timer.seconds).." ".."Seconds!"}) 
	end
end	
end

function showAboutGUI()
for i,player in ipairs(game.players) do
local center = player.gui.center
	player.gui.center.add({type="flow", direction="vertical", name=guiNames.mainFlowAbout})
	player.gui.center[guiNames.mainFlowAbout].add({type="frame", direction="vertical", name=guiNames.mainFrameAbout, caption="About!"})
	mainFrameAbout = player.gui.center[guiNames.mainFlowAbout][guiNames.mainFrameAbout]
	for ii,pplayer in ipairs(game.players) do
		mainFrameAbout.add({type="flow", direction="horizontal", name=guiNames.buttonFlowAbout})
		mainFrameAbout[guiNames.buttonFlowAbout].add({type="button", name=guiNames.ExitButton, caption="Close!"})
		mainFrameAbout.add({type="label", name=guiNames.labelAbout7, caption=About7})
		mainFrameAbout.add({type="label", name=guiNames.labelAbout8, caption=About8})
		mainFrameAbout.add({type="label", name=guiNames.labelAbout9, caption=About9})
		mainFrameAbout.add({type="label", name=guiNames.labelAbout10, caption=About10})
		mainFrameAbout.add({type="label", name=guiNames.labelAbout1, caption=About1})
		mainFrameAbout.add({type="label", name=guiNames.labelAbout2, caption=About2})
		mainFrameAbout.add({type="label", name=guiNames.labelAbout3, caption=About3})
		mainFrameAbout.add({type="label", name=guiNames.labelAbout4, caption=About4})
		mainFrameAbout.add({type="label", name=guiNames.labelAbout5, caption=About5})
		mainFrameAbout.add({type="label", name=guiNames.labelAbout6, caption=About6})
	end
end	
end

function showCoreGUI()
for i,player in ipairs(game.players) do
local center = player.gui.center
	player.gui.center.add({type="flow", direction="vertical", name=guiNames.mainFlowCore})
	player.gui.center[guiNames.mainFlowCore].add({type="frame", direction="vertical", name=guiNames.mainFrameCore, caption="DyTech-Core Control Center!"})
	mainFrameCore = player.gui.center[guiNames.mainFlowCore][guiNames.mainFrameCore]
	for ii,pplayer in ipairs(game.players) do
		mainFrameCore.add({type="flow", direction="horizontal", name=guiNames.buttonFlowCore})
		mainFrameCore[guiNames.buttonFlowCore].add({type="button", name=guiNames.ExportButton, caption="Export!"})
		mainFrameCore[guiNames.buttonFlowCore].add({type="button", name=guiNames.BackButton, caption="Back!"})
		mainFrameCore[guiNames.buttonFlowCore].add({type="button", name=guiNames.ExitButton, caption="Close!"})
		mainFrameCore.add({type="label", name=guiNames.labelCore, caption=Core})
	end
end	  
end

function showDynamicGUI()
for i,player in ipairs(game.players) do
local center = player.gui.center
	player.gui.center.add({type="flow", direction="vertical", name=guiNames.mainFlowDynamic})
	player.gui.center[guiNames.mainFlowDynamic].add({type="frame", direction="vertical", name=guiNames.mainFrameDynamic, caption="DyTech-Core Control Center!"})
	mainFrameDynamic = player.gui.center[guiNames.mainFlowDynamic][guiNames.mainFrameDynamic]
	for ii,pplayer in ipairs(game.players) do
		mainFrameDynamic.add({type="flow", direction="horizontal", name=guiNames.buttonFlowDynamic})
		mainFrameDynamic[guiNames.buttonFlowDynamic].add({type="button", name=guiNames.DynamicSystemButton, caption="Toggle Dynamic System!"})
		mainFrameDynamic[guiNames.buttonFlowDynamic].add({type="button", name=guiNames.DynamicSystemHardButton, caption="Toggle Dynamic Hard Mode!"})
		mainFrameDynamic[guiNames.buttonFlowDynamic].add({type="button", name=guiNames.BackButton, caption="Back!"})
		mainFrameDynamic[guiNames.buttonFlowDynamic].add({type="button", name=guiNames.ExitButton, caption="Close!"})
		mainFrameDynamic.add({type="label", name=guiNames.labelDynamic, caption=Dynamic})
		mainFrameDynamic.add({type="label", name=guiNames.label15, caption="Dynamic System is".." "..tostring(remote.call("DyTech-Dynamic", "CheckSystem"))})
		mainFrameDynamic.add({type="label", name=guiNames.label16, caption="Dynamic System Hard Mode is".." "..tostring(remote.call("DyTech-Dynamic", "CheckSystemHard"))})
	end
end	
end

function showToolsGUI()
for i,player in ipairs(game.players) do
local center = player.gui.center
	player.gui.center.add({type="flow", direction="vertical", name=guiNames.mainFlowTools})
	player.gui.center[guiNames.mainFlowTools].add({type="frame", direction="vertical", name=guiNames.mainFrameTools, caption="DyTech-Core Control Center!"})
	mainFrameTools = player.gui.center[guiNames.mainFlowTools][guiNames.mainFrameTools]
	for ii,pplayer in ipairs(game.players) do
		mainFrameTools.add({type="flow", direction="horizontal", name=guiNames.buttonFlowTools})
		mainFrameTools[guiNames.buttonFlowTools].add({type="button", name=guiNames.ToolsCraftingButton, caption="Tools Crafting!"})
		mainFrameTools[guiNames.buttonFlowTools].add({type="button", name=guiNames.ToolsItemButton, caption="Give Crafting Bench Item!"})
		mainFrameTools[guiNames.buttonFlowTools].add({type="button", name=guiNames.BackButton, caption="Back!"})
		mainFrameTools[guiNames.buttonFlowTools].add({type="button", name=guiNames.ExitButton, caption="Close!"})
		mainFrameTools.add({type="label", name=guiNames.labelTools, caption=Tools})
		mainFrameTools.add({type="label", name=guiNames.label13, caption=Tools1})
	end
end	
end

function showMetallurgyGUI()
for i,player in ipairs(game.players) do
local center = player.gui.center
	player.gui.center.add({type="flow", direction="vertical", name=guiNames.mainFlowMetallurgy})
	player.gui.center[guiNames.mainFlowMetallurgy].add({type="frame", direction="vertical", name=guiNames.mainFrameMetallurgy, caption="About!"})
	mainFrameMetallurgy = player.gui.center[guiNames.mainFlowMetallurgy][guiNames.mainFrameMetallurgy]
	for ii,pplayer in ipairs(game.players) do
		mainFrameMetallurgy.add({type="flow", direction="horizontal", name=guiNames.buttonFlowMetallurgy})
		mainFrameMetallurgy[guiNames.buttonFlowMetallurgy].add({type="button", name=guiNames.MetallurgyFluidsButton, caption="Regenerate Fluids!"})
		mainFrameMetallurgy[guiNames.buttonFlowMetallurgy].add({type="button", name=guiNames.MetallurgyOresButton, caption="Regenerate Ores!"})
		mainFrameMetallurgy[guiNames.buttonFlowMetallurgy].add({type="button", name=guiNames.BackButton, caption="Back!"})
		mainFrameMetallurgy[guiNames.buttonFlowMetallurgy].add({type="button", name=guiNames.ExitButton, caption="Close!"})
		mainFrameMetallurgy.add({type="label", name=guiNames.labelMetallurgy, caption=Metallurgy})
		mainFrameMetallurgy.add({type="label", name=guiNames.label14, caption=Metallurgy1})
	end
end	
end

function closeAllGUI()
for i,player in ipairs(game.players) do
  if player.gui.center[CoreGUI.guiNames.mainFlowMaster] and player.gui.center[CoreGUI.guiNames.mainFlowMaster].valid then
    player.gui.center[CoreGUI.guiNames.mainFlowMaster].destroy()
  end
  if player.gui.center[CoreGUI.guiNames.mainFlowCore] and player.gui.center[CoreGUI.guiNames.mainFlowCore].valid then
    player.gui.center[CoreGUI.guiNames.mainFlowCore].destroy()
  end
  if player.gui.center[CoreGUI.guiNames.mainFlowDynamic] and player.gui.center[CoreGUI.guiNames.mainFlowDynamic].valid then
    player.gui.center[CoreGUI.guiNames.mainFlowDynamic].destroy()
  end
  if player.gui.center[CoreGUI.guiNames.mainFlowTools] and player.gui.center[CoreGUI.guiNames.mainFlowTools].valid then
    player.gui.center[CoreGUI.guiNames.mainFlowTools].destroy()
  end
  if player.gui.center[CoreGUI.guiNames.mainFlowMetallurgy] and player.gui.center[CoreGUI.guiNames.mainFlowMetallurgy].valid then
    player.gui.center[CoreGUI.guiNames.mainFlowMetallurgy].destroy()
  end
  if player.gui.center[CoreGUI.guiNames.mainFlowAbout] and player.gui.center[CoreGUI.guiNames.mainFlowAbout].valid then
    player.gui.center[CoreGUI.guiNames.mainFlowAbout].destroy()
  end
end
end

function closeMasterGUI()
for i,player in ipairs(game.players) do
  if player.gui.center[CoreGUI.guiNames.mainFlowMaster] and player.gui.center[CoreGUI.guiNames.mainFlowMaster].valid then
    player.gui.center[CoreGUI.guiNames.mainFlowMaster].destroy()
  end
end
end

function closeCoreGUI()
for i,player in ipairs(game.players) do
  if player.gui.center[CoreGUI.guiNames.mainFlowCore] and player.gui.center[CoreGUI.guiNames.mainFlowCore].valid then
    player.gui.center[CoreGUI.guiNames.mainFlowCore].destroy()
  end
end
end

function closeDynamicGUI()
for i,player in ipairs(game.players) do
  if player.gui.center[CoreGUI.guiNames.mainFlowDynamic] and player.gui.center[CoreGUI.guiNames.mainFlowDynamic].valid then
    player.gui.center[CoreGUI.guiNames.mainFlowDynamic].destroy()
  end
end
end

function closeToolsGUI()
for i,player in ipairs(game.players) do
  if player.gui.center[CoreGUI.guiNames.mainFlowTools] and player.gui.center[CoreGUI.guiNames.mainFlowTools].valid then
    player.gui.center[CoreGUI.guiNames.mainFlowTools].destroy()
  end
end
end

function closeMetallurgyGUI()
for i,player in ipairs(game.players) do
  if player.gui.center[CoreGUI.guiNames.mainFlowMetallurgy] and player.gui.center[CoreGUI.guiNames.mainFlowMetallurgy].valid then
    player.gui.center[CoreGUI.guiNames.mainFlowMetallurgy].destroy()
  end
end
end

function closeAboutGUI()
for i,player in ipairs(game.players) do
  if player.gui.center[CoreGUI.guiNames.mainFlowAbout] and player.gui.center[CoreGUI.guiNames.mainFlowAbout].valid then
    player.gui.center[CoreGUI.guiNames.mainFlowAbout].destroy()
  end
end
end