os.loadAPI("/.sys/yggdrasil/yggdrasil")

if not yggdrasil.namespace_exists('nonix') then
	yggdrasil.namespace_create('nonix')
	local system_store = yggdrasil.namespace_open('nonix')
end
