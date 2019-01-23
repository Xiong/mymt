-- ktx file loader
-- ktx v0.1
-- 2019 Jan 15
-- Xiong
-- hacked from GloopTest v0.0.4a
-- CC-BY-SA


ktx = {}

function ktx.debug(level,message)
	print("["..level.."][ktx v0.1] "..message)
end

dofile(minetest.get_modpath("ktx").."/ore/kalite.lua")

ktx.debug("MESSAGE","Loaded.")

--#