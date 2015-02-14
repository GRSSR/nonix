function clamp(value, min, max)
	if value > max then
		return max
	elseif value < min then
		return min
	else
		return value
	end
end

do
	local args = {...}
	local buffer = {}
	local sys_print = print
	local length = 0
	print = function(x) table.insert(buffer, x); length = length +1 end
	sys_print("boop")
	shell.run(unpack(args))
	local start_i = 0
	local end_i
	local x, y = term.getSize()
	while 1 do 
		term.clear()
		term.setCursorPos(1,1)
		start_i = clamp(start_i, 0, math.max(length-y, 0))
		end_i = start_i + math.min(length, y)
		for i=start_i,end_i do
			sys_print(buffer[i])
		end

		term.setCursorPos(1, y)
		sys_print(":", start_i)
		local event, key = os.pullEvent()

		if event == 'key' then
			if key == keys.q then
				break
			elseif key == keys.up then
				start_i = start_i -1
			elseif key == keys.down then
				start_i = start_i +1
			end

		end

	end

	print = sys_print
end
