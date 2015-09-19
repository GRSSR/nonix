os.loadAPI("/.sys/nonix")

NONIX = true

local system_store = yggdrasil.namespace_open('nonix')

if yggdrasil.namespace_exists('yum') then
	local yum_ns = yggdrasil.namespace_open('yum')
	for _, package in pairs(yum_ns.installed_packages) do
		for alias, file in pairs(package.aliases) do 
			shell.setAlias(file, alias)
		end
	end
end

if fs.exists('/setup') then
	shell.run('/setup')
end