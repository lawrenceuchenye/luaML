
numlua=require "lib/numLUA"

vec1=numlua:createVector({1,0,1, 1})
vec2=numlua:createVector({4,5,6})

print(vec1 * vec2)

m=numlua:createMatrix({
  {1,2,3,4},
  {5,6,7,8}
 })

-- m:vecSub(vec1):print()
