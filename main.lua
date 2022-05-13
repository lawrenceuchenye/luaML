local numlua=require "lib/numLUA"

-- create test vector
local vec1=numlua:createVector({1,0,1,0})
-- local vec2=numlua:createVector({4,5,6})

-- create a 2x4 matrix
local mat=numlua:createMatrix({
  {1,2,3,4},
  {5,6,7,8}
 })

-- subtract vector 1 from matrix
mat:vecSub(vec1):print()

