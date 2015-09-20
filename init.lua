os.loadAPI("/.sys/nonix")
os.loadAPI("/.sys/yggdrasil/yggdrasil")


NONIX = true

local system_store = yggdrasil.namespace_open('nonix')

if yggdrasil.namespace_exists('yum') then
	local yum_ns = yggdrasil.namespace_open('yum')
	for _, package in pairs(yum_ns.installed_packages:get_itterator()) do
		if package.value.aliases then 
			for alias, file in pairs(package.value.aliases) do 
				shell.setAlias(alias, file)
			end
		end
	end
end

if fs.exists('/setup') then
	shell.run('/setup')
end