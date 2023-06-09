--Script made by Vamato
--ONLY USE WITH PERMISSION

local ui = require(script.Ui)


print("Plugin loaded")

--code done in 1min so is garbage
local new = ui.new(plugin)

local sc = Instance.new("ScreenGui")
local fr = Instance.new("Frame")
fr.Parent = sc
fr.Size = UDim2.fromScale(1,1)

fr.BackgroundColor3 = Color3.fromRGB(29,29,29)

new:setScreen(sc)