--Code made for test purpose and may not be optimized - Vamato

local maths = require(game:GetService("ReplicatedStorage").Modules.Maths)
print(maths)
print("Server started!")

local function randomVector()
   local rnd = Random.new()
   return Vector3.new(
      rnd:NextInteger(-50,50),
      rnd:NextInteger(0,50),
      rnd:NextInteger(-50,50)
   )
end

local p1 = randomVector()
local p2 = randomVector()
local p3 = randomVector()
local p4 = randomVector()

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

   part.Parent = workspace
end

local function line(a:Vector3,b:Vector3)
   local res = maths.Line(a,b)
   local new = Instance.new("Part")
   new.CFrame = res.CFrame
   new.Size = Vector3.new(.7,.7,res.Width)
   new.Anchored = true
   new.Color = Color3.new(0,1,0)

   new.Parent = workspace
end

display(p1,Color3.new(0,0,1))
display(p2,Color3.new(0,0,1))

display(p3,Color3.new(1,0,0))
display(p4,Color3.new(1,0,0))

local pos = {}
local n = 40
for i=0,n do
   local point = maths.Lerp.Vector(maths.Lerp.Cubic,
      i/n,
      p1,p3,p4,p2
   )

   table.insert(pos,point)
end

for i = 1,#pos-1 do
   line(pos[i],pos[i+1])
end
