
numlua=require "lib/numLUA"

-- dataset
data_x=numlua:createMatrix({
   {1,0,1},
   {0,0,1},
   {1,0,1}
  })
data_y=numlua:createVector({1,0,1})

-- perceptron
brain=numlua:randVec(3)
lr=0.01
n=1000


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
for x_data_indx=1,#data_y.vec,1 do
    output=numlua:dot(numlua:createVector(data_x.mat[x_data_indx]),brain)
    print("OUTPUT:"..output.." EXPECTED:"..data_y.vec[x_data_indx])
end
