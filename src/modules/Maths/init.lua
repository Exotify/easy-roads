--Math function made by Vamato

function lerp(a:number,b:number,t:number)
   return a+(b-a)*t
end


function quadratic(a,b,c,t)
   local l1 = lerp(a,b,t)
   local l2 = lerp(b,c,t)
   return lerp(l1,l2,t)
end

function cubic(a,b,c,d,t)
   local l1 = quadratic(a,b,c,t)
   local l2 = quadratic(b,c,d,t)
   return lerp(l1,l2,t)
end

function VectorLerp(v1:Vector3,v2:Vector3,t:number)
   return Vector3.new(
      lerp(v1.X,v2.X,t),
      lerp(v1.Y,v2.Y,t),
      lerp(v1.Z,v2.Z,t)
   )
end

function VectorCubic(v1:Vector3,a1:Vector3,v2:Vector3,a2:Vector3,t:number)
   return Vector3.new(
      cubic(v1.X,a1.X,a2.X,v2.X,t),
      cubic(v1.Y,a1.Y,a2.Y,v2.Y,t),
      cubic(v1.Z,a1.Z,a2.Z,v2.Z,t)
   )
end

function FormLine(p1:Vector3,p2:Vector3)
   return {
      ["Width"] = (p1-p2).Magnitude,
      ["CFrame"] = CFrame.new(
         (p1+p2)/2,
         p2
      )
   }
end


return {
   ["Lerp"]=lerp,
   ["VectorLerp"]=VectorLerp,
   ["Quadratic"]=quadratic,
   ["Cubic"]=cubic,
   ["VectorCubic"]=VectorCubic,
   ["Line"]=FormLine,
}