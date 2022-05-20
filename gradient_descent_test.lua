
numlua=require "lib/numLUA"

-- dataset
data_x=numlua:createMatrix({
   {1,0,1},
   {0,0,1},
   {1,0,1},
   {0,1,0}
  })
data_y=numlua:createVector({1,0,1,0})

-- perceptron
brain=numlua:randVec(3)
lr=0.001
n=10000


print("\n=========== UNOPTIMZED BRAIN ==========")
brain:print()

sum_error=0
for n_iter=1,n,1 do
  sum_error=0
  for x_data_indx=1,#data_y.vec,1 do
     y_pred=numlua:dot(numlua:createVector(data_x.mat[x_data_indx]),brain)
     error=0.5*(y_pred-data_y.vec[x_data_indx])
     error=math.pow(error,2)
     sum_error=sum_error+error
     dW=-(lr*(y_pred-data_y.vec[x_data_indx]))
     dW=numlua:createVector(data_x.mat[x_data_indx]):scale(dW)
     brain=brain:add(dW)
  end
--  print("Sum Error:"..sum_error)
end
print("\nSUM ERROR:"..sum_error)
print("\n========== OPTIMIZED BRAIN =========")
brain:print()

---- testing trained perceptron
print()
test_data_x=numlua:createMatrix({
   {0,1,0},
   {0,1,1},
   {1,1,0},
   {1,0,0}
  })

test_data_y=numlua:createVector({0,1,1,0})

for x_data_indx=1,#test_data_y.vec,1 do
    output=numlua:dot(numlua:createVector(test_data_x.mat[x_data_indx]),brain)
    print("OUTPUT:"..output.." EXPECTED:"..test_data_y.vec[x_data_indx])
end
