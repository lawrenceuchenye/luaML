-- main class Object(Table)
numLUA={}

-- createVector function class
function numLUA:createVector(vector)
  local this={
   vec=vector
  }

 -- function to get vector length
  function this:getLength()
    local sum_scalars=0
    for scal_indx=1,#self.vec,1 do
      sum_scalars=sum_scalars+math.pow(self.vec[scal_indx],2)
    end

    return math.sqrt(sum_scalars)
  end

-- function to get the dot product of vectors
  function this:dot(vector)
    local dot_product=0
    for scal_indx=1,#self.vec,1 do
       dot_product=dot_product+(self.vec[scal_indx]*vector.vec[scal_indx])
    end

    return dot_product
  end

-- function to add vectors
  function this:add(vector)
    local sum_vector={}
    for scal_indx=1,#self.vec,1 do
      sum_vector[scal_indx]=(self.vec[scal_indx]+vector.vec[scal_indx])
    end

    return numLUA:createVector(sum_vector)
  end

-- function to subtract vectors
  function this:sub(vector)
    local sub_vector={}
    for scal_indx=1,#self.vec,1 do
      sub_vector[scal_indx]=self.vec[scal_indx]-vector.vec[scal_indx]
    end

    return numLUA:createVector(sub_vector)
  end

-- function to divide vectors
  function this:div(vector)
    local div_vector={}
    for scal_indx=1,#self.vec,1 do
      div_vector[scal_indx]=self.vec[scal_indx]/vector.vec[scal_indx]
    end

    return numLUA:createVector(div_vector)
  end

-- function to multiply vectors
  function this:mul(vector)
    if #self.vec ~= #vector.vec then
      print("Error:vectors must be of the same dimensions")
      return nil
    end

    local dot_vector={}
    for scal_indx=1,#self.vec,1 do
      dot_vector[scal_indx]=self.vec[scal_indx]*vector.vec[scal_indx]
    end

    return numLUA:createVector(dot_vector)
  end

-- function to print vector
  function this:print()
    local vector_string="{"
    for scal_indx=1,#self.vec,1 do
       vector_string=vector_string..self.vec[scal_indx]
       if scal_indx < #self.vec then
         vector_string=vector_string..","
        end
    end

    vector_string=vector_string.."}"
    print(vector_string)
  end

-- function to scale vector i.e times the vector by a scalar
  function this:scale(scalar)
    local scal_vector={}
    for scal_indx=1,#self.vec,1 do
       scal_vector[scal_indx]=self.vec[scal_indx]*scalar
    end

    return numLUA:createVector(scal_vector)
  end

 -- function for cross product of vectors
  function this:cross(vector)
     if #self.vec ~= #vector.vec then
        print("Error:vectors must be of the same dimensions")
        return nil
     end
     if #self.vec > 3 or #vector.vec > 3 then
        print("Error:unable to get cross product for vectors greater than 3 dimensions")
        return nil
      end

      if #vector.vec < 3 then
         return (self.vec[1]*vector.vec[2])-(self.vec[2]*vector.vec[1])
      else
         local cross_vector={
             (self.vec[2]*vector.vec[3])-(self.vec[3]*vector.vec[2]),
             (self.vec[3]*vector.vec[1])-(self.vec[1]*vector.vec[3]),
             (self.vec[1]*vector.vec[2])-(self.vec[2]*vector.vec[1])
           }
           return numLUA:createVector(cross_vector)
       end
  end
 -- return vector obj(table)
  return this
end

-- function to generate random vectors
function numLUA:randVec(n)
   local vector={}
   math.randomseed(os.time())
   for scal_indx=1,n,1 do
      vector[scal_indx]=math.random()
   end

   return self:createVector(vector)
end

-- function to get exponent
function numLUA:exp(n)
   return math.exp(n)
end

-- function to get the dot product of vectors
function numLUA:dot(vector1,vector2)
  if #vector1.vec ~= #vector2.vec then
    print("Error:vectors must be of the same dimensions")
    return nil
  end

  local dot_product=0
  for scal_indx=1,#vector1.vec,1 do
       dot_product=dot_product+(vector1.vec[scal_indx]*vector2.vec[scal_indx])
  end
  return dot_product
end

-- function for cross product of vectors
function numLUA:cross(vector1,vector2)
    if #vector1.vec ~= #vector2.vec then
       print("Error:vectors must be of the same dimensions")
       return nil
    end
    if #vector1.vec > 3 or #vector2.vec > 3 then
       print("Error:unable to get cross product for vectors greater than 3 dimensions")
       return nil
    end

    if #vector2.vec < 3 then
        return (vector1.vec[1]*vector2.vec[2])-(vector1.vec[2]*vector2.vec[1])
     else
        local cross_vector={
            (vector1.vec[2]*vector2.vec[3])-(vector1.vec[3]*vector2.vec[2]),
            (vector1.vec[3]*vector2.vec[1])-(vector1.vec[1]*vector2.vec[3]),
            (vector1.vec[1]*vector2.vec[2])-(vector1.vec[2]*vector2.vec[1])
          }
          return numLUA:createVector(cross_vector)
      end
  end

function numLUA:createMatrix(matrix)
   this={
     mat=matrix
    }

   -- function to print a matrix
    function this:print()
      local mat_str="{"
      for mat_indx=1,#self.mat,1 do
        local vector_string="{"
        if mat_indx~=1 then
          vector_string="\n {"
        end

        for scal_indx=1,#self.mat[mat_indx],1 do
          vector_string=vector_string..self.mat[mat_indx][scal_indx]
          if scal_indx < #self.mat[mat_indx] then
            vector_string=vector_string..","
          end
        end

        if #self.mat~=mat_indx then
          vector_string=vector_string.."},"
        else
          vector_string=vector_string.."}"
        end
       mat_str=mat_str..vector_string
      end

      mat_str=mat_str.."}"
      print(mat_str)
    end

   -- function to multiply a matrix by a scalar
    function this:scale(scalar)
      local scal_mat={}
      for rw_indx=1,#self.mat,1 do
         localscal_mat_v={}
         for cl_indx=1,#self.mat[1],1 do
           scal_mat_v[cl_indx]=self.mat[rw_indx][cl_indx]*scalar
         end
         scal_mat[rw_indx]=scal_mat_v
      end
      return numLUA:createMatrix(scal_mat)
    end


    -- function to add a matrix by a scalar
    function this:add(scalar)
      local scal_mat={}
      for rw_indx=1,#self.mat,1 do
         local scal_mat_v={}
         for cl_indx=1,#self.mat[1],1 do
           scal_mat_v[cl_indx]=self.mat[rw_indx][cl_indx]+scalar
         end
         scal_mat[rw_indx]=scal_mat_v
      end
      return numLUA:createMatrix(scal_mat)
    end


    -- function to subtract a matrix by a scalar
    function this:sub(scalar)
      local scal_mat={}
      for rw_indx=1,#self.mat,1 do
         local scal_mat_v={}
         for cl_indx=1,#self.mat[1],1 do
           scal_mat_v[cl_indx]=self.mat[rw_indx][cl_indx]-scalar
         end
         scal_mat[rw_indx]=scal_mat_v
      end
      return numLUA:createMatrix(scal_mat)
    end


    -- function to divide a matrix by a scalar
    function this:div(scalar)
      local scal_mat={}
      for rw_indx=1,#self.mat,1 do
         local scal_mat_v={}
         for cl_indx=1,#self.mat[1],1 do
           scal_mat_v[cl_indx]=self.mat[rw_indx][cl_indx]/scalar
         end
         scal_mat[rw_indx]=scal_mat_v
      end
      return numLUA:createMatrix(scal_mat)
    end

    -- function to multiply a matrix by a vector
    function this:vecMul(vector)
       if  #self.mat[1] ~= #vector.vec then
         print("Error:vector and matrix columns must be of the same dimensions")
         return nil
       end
       local vec_mul_mat={}
       for rw_indx=1,#self.mat,1 do
          local mat_vec={}
          for cl_indx=1,#vector.vec,1 do
            mat_vec[cl_indx]=self.mat[rw_indx][cl_indx]*vector.vec[cl_indx]
          end
          vec_mul_mat[rw_indx]=mat_vec
       end
       return numLUA:createMatrix(vec_mul_mat)
    end

    -- function to add a matrix by a vector
    function this:vecAdd(vector)
       if  #self.mat[1] ~= #vector.vec then
         print("Error:vector and matrix columns must be of the same dimensions")
         return nil
       end

       local vec_mul_mat={}
       for rw_indx=1,#self.mat,1 do
          local mat_vec={}
          for cl_indx=1,#vector.vec,1 do
            mat_vec[cl_indx]=self.mat[rw_indx][cl_indx]+vector.vec[cl_indx]
          end
          vec_mul_mat[rw_indx]=mat_vec
       end

       return numLUA:createMatrix(vec_mul_mat)
    end

    -- function to divide a matrix by a vector
    function this:vecDiv(vector)
       if  #self.mat[1] ~= #vector.vec then
         print("Error:vector and matrix columns must be of the same dimensions")
         return nil
       end
       local vec_mul_mat={}
       for rw_indx=1,#self.mat,1 do
          local mat_vec={}
          for cl_indx=1,#vector.vec,1 do
            mat_vec[cl_indx]=self.mat[rw_indx][cl_indx]/vector.vec[cl_indx]
          end
          vec_mul_mat[rw_indx]=mat_vec
       end
       return numLUA:createMatrix(vec_mul_mat)
    end

    -- function to subtract a matrix by a vector
    function this:vecSub(vector)
       if  #self.mat[1] ~= #vector.vec then
         print("Error:vector and matrix columns must be of the same dimensions")
         return nil
       end

       local vec_mul_mat={}
       for rw_indx=1,#self.mat,1 do
          local mat_vec={}
          for cl_indx=1,#vector.vec,1 do
            mat_vec[cl_indx]=self.mat[rw_indx][cl_indx]-vector.vec[cl_indx]
          end
          vec_mul_mat[rw_indx]=mat_vec
       end

       return numLUA:createMatrix(vec_mul_mat)
    end

    -- return matrix obj(table)
    return this
end

-- return class/table
return numLUA
