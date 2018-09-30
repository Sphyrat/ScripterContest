--[[
Вывести содержимое таблицы.
Плюсами будут:
- поддержка вложенных таблиц в качестве ключей и значений.
- поддержка рекурсивных таблиц (таблица содержит в себе ссылку на саму себя).
Примечание к заданию №3: в lua есть типы данных "nil, boolean, number, string, userdata, function, thread, and table" ,и вот таблица - один из основных типов, часто используемый.
Требуется написать функцию, которой на вход передается таблица (в некотором смысле объект), и которая выведет содержимое таблицы на экран. Можно обобщить: написать функцию, которая выведет на экран содержимое аргумента(ов) в читаемом виде. 

]]--

function elementToString(t)
	if(type(t) == "number") then return tostring(t)
		elseif(type(t) == "string") then return string.format("%q", t)
		elseif(type(t) == "table") then do
			local res = "{"
			for i,v in pairs(t) do
				if(type(v) == "number") then res = res .. v .. ", "
					elseif(type(v) == "string") then res = res .. string.format("%q", v) .. ", "
					elseif(type(v) == "table") then res = res .. elementToString(v) .. ", "
					else res = res .. "UnexpectedType, "
				end
			end
			local l = string.len(res)
			res = string.sub(res, 1, l - 2) .. "}"
			return res
		end
		else return "UnexpectedType"
	end
end


function printTable(...)
	count = select('#', ...)
	if(count == 0) then io.write("Empty input\n")
		else for i = 1, count do
			local table = select(i, ...)
			if(type(table) ~= "table") then io.write("Input# " .. i .. ": Wrong type\n")
				else do
					local tName = "Table#" .. i
					io.write("\tTable >> ", tName, "\n")
					local savedByName = {} savedByName[table] = tName
					for j,v in pairs(table) do
						if(savedByName[v]) then do
							io.write("Cell >> ", tName, "[",elementToString(j),"]\n")
							io.write("Value >> ", savedByName[v], "\n")
						end
						else
							--savedByName[v] = tName .. "[" .. elementToString(j) .. "]"
							io.write("Cell >> ", tName, "[",elementToString(j),"]\n")
							io.write("Value >> ", elementToString(v), "\n")
						end
					end
					io.write("\n")
				end
			end
		end
	end
end


local a = {1,2,[{1,2}]={3,4}} a[3] = a
local b = {"A","B"}
printTable(a,b)
printTable()
printTable("asdasd")
printTable(b,"asdads")
