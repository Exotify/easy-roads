--Code made for test purpose and may not be optimized - Vamato

local maths = require(game:GetService("ReplicatedStorage").Modules.Maths)
print(maths)
print("Server started!")

local lines = Instance.new("Folder")
lines.Name = "Lines"
lines.Parent = workspace

local ShouldRender = false

local function randomVector()
   local rnd = Random.new()
   return Vector3.new(
      rnd:NextInteger(-50,50),
      rnd:NextInteger(0,50),
      rnd:NextInteger(-50,50)
   )
end

local function display(pos,color)
   local part = Instance.new("Part")
   part.Position = pos
   part.Anchored = true
   part.Color = color or Color3.new(0,1,0)
   if color then
      part.Size = Vector3.new(1,1,1)
   else
      part.Size = Vector3.new(.5,.5,.5)
   end

   part.TopSurface = Enum.SurfaceType.Smooth
   part.BottomSurface = Enum.SurfaceType.Smooth

   part.Parent = workspace
   return part
end

local function line(a:Vector3,b:Vector3,props:{string:any},width:number)
   width = width or .7
   local res = maths.Line(a,b)
   local new = Instance.new("Part")
   new.CFrame = res.CFrame
   new.Size = Vector3.new(width,width,res.Width)
   new.Anchored = true
   new.Color = Color3.new(0,1,0)
   new.TopSurface = Enum.SurfaceType.Smooth
   new.BottomSurface = Enum.SurfaceType.Smooth

   for name,value in props or {} do
      new[name] = value
   end

   new.Parent = workspace
   return new
end

local function render(v1:Vector3,v2:Vector3,v3:Vector3,v4:Vector3)
   lines:ClearAllChildren()
   local pos = {}
   local n = 40
   for i=0,n do
      local point = maths.Lerp.Vector(maths.Lerp.Cubic,
         i/n,
         v1,v3,v4,v2
      )

      table.insert(pos,point)
   end

   for i = 1,#pos-1 do
      line(pos[i],pos[i+1]).Parent = lines
   end

   line(v1,v3,{["Color"]=Color3.new(0,1,1)},.3).Parent = lines
   line(v2,v4,{["Color"]=Color3.new(0,1,1)},.3).Parent = lines
end

local p1 = display(randomVector(),Color3.new(0,0,1))
local p2 = display(randomVector(),Color3.new(0,0,1))

local p3 = display(randomVector(),Color3.new(1,0,0))
local p4 = display(randomVector(),Color3.new(1,0,0))

render(p1.Position,p2.Position,p3.Position,p4.Position)

local function ehhh()
   ShouldRender = true
end

p1:GetPropertyChangedSignal("Position"):Connect(ehhh)
p2:GetPropertyChangedSignal("Position"):Connect(ehhh)
p3:GetPropertyChangedSignal("Position"):Connect(ehhh)
p4:GetPropertyChangedSignal("Position"):Connect(ehhh)

--render loop
while true do
   if ShouldRender then
      ShouldRender = false
      render(p1.Position,p2.Position,p3.Position,p4.Position)
   end

   task.wait(.1)
end