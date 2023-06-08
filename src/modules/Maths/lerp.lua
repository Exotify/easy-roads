function lerp(a:number,b:number,t:number)
   return a + (b-a)*t
end

return {
   ["Linear"]=lerp,
   ["Quadratic"]=(function(a:number,b:number,c:number,t:number)
      local l1 = lerp(a,b,t)
      local l2 = lerp(b,c,t)
      return lerp(l1,l2,t)
   end),
   ["Cubic"]=(function(a:number,b:number,c:number,d:number,t:number)
      local l1 = lerp(a,b,t)
      local l2 = lerp(b,c,t)
      local l3 = lerp(c,d,t)

      local l4 = lerp(l1,l2,t)
      local l5 = lerp(l2,l3,t)
      return lerp(l4,l5,t)
   end),
   --Function subject to changes or being removed
   ["Vector"]=(function(func,t,...)
      local xs = {}
      local ys = {}
      local zs = {}
      for _,v in {...} do
         table.insert(xs,v.X)
         table.insert(ys,v.Y)
         table.insert(zs,v.Z)
      end
      
      table.insert(xs,t)
      table.insert(ys,t)
      table.insert(zs,t)

      return Vector3.new(
         func(unpack(xs)),
         func(unpack(ys)),
         func(unpack(zs))
      )
   end)
}