--Math functions made by Vamato

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
   ["Lerp"]=require(script.lerp),
   ["Line"]=FormLine,
}