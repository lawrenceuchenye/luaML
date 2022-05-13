
local numlua=require "lib/numLUA"

-- dataset
local data_x=numlua:createMatrix({
   {1,0,1},
   {0,0,1},
   {1,0,1}
  })
local data_y=numlua:createVector({1,0,1})

-- perceptron
local brain=numlua:randVec(3)
local lr=0.01
local n=1000


print("\n=========== UNOPTIMZED BRAIN ==========")
brain:print()

local sum_error=0
for n_iter=1,n,1 do
  sum_error=0
  for x_data_indx=1,#data_y.vec,1 do
     local y_pred=numlua:dot(numlua:createVector(data_x.mat[x_data_indx]),brain)
     local err=0.5*(y_pred-data_y.vec[x_data_indx])
     err=math.pow(err,2)
     sum_error=sum_error+err
     local dW=-(lr*(y_pred-data_y.vec[x_data_indx]))
     dW=numlua:createVector(data_x.mat[x_data_indx]):scale(dW)
     brain=brain:add(dW)
  end
--  print("Sum Error:"..sum_error)
end

print("\nSUM ERROR:"..sum_error)
print("\n========== OPTIMIZED BRAIN =========")
brain:print()

-- testing trained perceptron
print()
for x_data_indx=1,#data_y.vec,1 do
    local output=numlua:dot(numlua:createVector(data_x.mat[x_data_indx]),brain)
    print("OUTPUT:"..output.." EXPECTED:"..data_y.vec[x_data_indx])
end
