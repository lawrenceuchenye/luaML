local numLUAError = {}

function numLUAError:CrossProduct (obj1, obj2)
	error("ErrorCrossProduct: unable to get cross product for vectors greater than 3 dimensions!")
end

function numLUAError:MatchingColumns (obj1, obj2)
	error("ErrorMatchingColumns: " .. type(obj1) .. " and " .. type(obj2) .. " columns must be of the same dimensions!")
end

function numLUAError:MatchingDimensions (obj1, obj2)
	error("ErrorMatchingDimensions: " .. type(obj1) .. " and " .. type(obj2) .. " must be of the same dimensions!")
end


return numLUAError
