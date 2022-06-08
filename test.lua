function Object (name)
	local object = { name = name }

	setmetatable(object, {
		__add = function (_, obj)
			obj.name = _.name .. " " .. obj.name
			return obj
		end,
		__t = function (_)
			print("...	")
			return "notype"
		end
	})

	return object
end

local obj1 = Object("test_1")
local obj2 = Object("test_2")

-- print((obj1 + obj2).name)
print(type(obj1))
