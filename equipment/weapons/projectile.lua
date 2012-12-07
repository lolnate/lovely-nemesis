projectile = class:new()

-- Normally we should load a config file for a weapon, but since this is love2d and lua,
-- we can just hard code some stuff for testing.
function projectile:init(name, parent)
	self.name = name
	self.parent = parent
	loaded_chunk = assert(loadfile("lovely-nemesis/equipment/weapons/configs/"..name..".lua"))
	loaded_chunk()
	self.last_fire = 0
end

function projectile:fire(dt)
	self.last_fire = self.last_fire + dt
	if self.last_fire > 1 / weapons.config.proj_tiny_auto.rof then
		self.last_fire = self.last_fire - 1 / weapons.config.proj_tiny_auto.rof
		print "fire"
	end
end