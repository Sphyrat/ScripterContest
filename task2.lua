--[[
Реализовать функцию sprintf, возвращающую строку по заданному формату.
Пример вызова:
sprintf("Игрок {0} ударил игрока {2}, который потерял {1} очков жизни.", "Nagibator" , 173, "Noob");
Ожидаемый результат:
"Игрок Nagibator ударил игрока Noob, который потерял 173 очков жизни."
]]--

function sprintf(text, ...)
	local mainStr = text
	local n = select('#', ...)
	if (n ~= 0) then
		for i=1,n do
			local v = select(i, ...)
			mainStr = string.gsub(mainStr, "{" .. (i-1) .. "}", v)
		end
	end
	return mainStr
end

print(sprintf("Игрок {0} ударил игрока {2}, который потерял {1} очков жизни.", "Nagibator" , 173, "Noob"))
print(sprintf("Участники турнира: {0}, {1}, {2}, {3}, {4}", "Игрок1", "Игрок2","Игрок3", "Nagibator", "Noob"))
print(sprintf("Победитель турнира: {0}", "Nagibator"))
print(sprintf("Благодарим всех за участие"))
