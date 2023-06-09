--Script made by Vamato
--ONLY USE WITH PERMISSION

local module = {}
module.__index = module

function module.new(plugin)
   local widgetInfo = DockWidgetPluginGuiInfo.new(
      Enum.InitialDockState.Float,  -- Widget will be initialized in floating panel
      true,   -- Widget will be initially enabled
      false,  -- Don't override the previous enabled state
      200,    -- Default width of the floating window
      300,    -- Default height of the floating window
      150,    -- Minimum width of the floating window
      150     -- Minimum height of the floating window
   )

   local widget = plugin:CreateDockWidgetPluginGui("Easy-Roads-Widget", widgetInfo)
   widget.Title = "Widget ewwwww"
   return setmetatable({["__widget"]=widget,["__screengui"]=nil,["__plugin"]=plugin},module)
end

function module:setScreen(screen:ScreenGui)
   self.__screengui = screen
   screen.Parent = self.__widget
end

return module