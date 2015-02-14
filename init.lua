os.loadAPI("/api/redString")
os.loadAPI("/api/sovietProtocol")

local alias_file = io.open('/.sys/aliases', 'r')
if alias_file then
	for line in alias_file:lines() do
		alias = redString.split(line)
		shell.run('alias', unpack(alias))
	end
end

if fs.exists('/setup') then
	shell.run('/setup')
end