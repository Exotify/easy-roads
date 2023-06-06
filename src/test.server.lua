--Code made for test purpose and may not be optimized - Vamato

local maths = require(game:GetService("ReplicatedStorage").Modules.Maths)
print("Server started!")

local rnd = Random.new()

local p1 = Vector3.new(
   rnd:NextInteger(-30,30),
   0,
   rnd:NextInteger(-30,30)
)

local p2 = Vector3.new(
   rnd:NextInteger(-30,30),
   0,
   rnd:NextInteger(-30,30)
)

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
   new.Size = Vector3.new(.7,.7,res.Width+.2)
   new.Anchored = true
   new.Color = Color3.new(0,1,0)

   new.Parent = workspace
end

local off = Vector3.new(20,0,0)

display(p1,Color3.new(0,0,1))
display(p2,Color3.new(0,0,1))

display(p1+off,Color3.new(1,0,0))
display(p2-off,Color3.new(1,0,0))

local pos = {}
local n = 20
for i=0,n do
   local point = maths.VectorCubic(p1,p1+off,p2,p2-off,i/n)
   table.insert(pos,point)
end

for i = 1,#pos-1 do
   line(pos[i],pos[i+1])
end
