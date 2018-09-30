--Напишите программу, которая в диапазоне чисел от 1 до N выведет в консоль
--local N = io.read()
local N = 30
for i=1,N do
	if ((i%3 == 0) and (i%5 == 0)) then print(3)
		elseif (i%3 == 0) then print(1)
		elseif (i%5 == 0) then print(2)
	end
end