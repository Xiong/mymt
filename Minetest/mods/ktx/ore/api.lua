-- ktx crafts
-- ktx v0.1
-- 2019 Jan 15
-- Xiong
-- hacked from GloopTest v0.0.4a
-- CC-BY-SA


generation_ores = {}

-- ore, lump, ingot, block
function ktx.ore.register_ore(modname, name, desc, uses)
	if uses.block ~= nil and uses.block.makes ~= false then
		minetest.register_node(modname..":"..name.."block", {
			description = desc.." Block",
			tiles = {uses.block.texture},
			is_ground_content = true,
			light_source = uses.block.light or 0,
			groups = uses.block.groups,
			sounds = uses.block.sounds
		})
		if uses.block.fromingots == true and uses.ingot ~= nil then
			minetest.register_craft({
				output = modname..":"..name.."block",
				recipe = {
					{modname..":"..name.."_ingot", modname..":"..name.."_ingot", modname..":"..name.."_ingot"},
					{modname..":"..name.."_ingot", modname..":"..name.."_ingot", modname..":"..name.."_ingot"},
					{modname..":"..name.."_ingot", modname..":"..name.."_ingot", modname..":"..name.."_ingot"}
				}
			})
			minetest.register_craft({
				output = modname..":"..name.."_ingot 9",
				recipe = {
					{modname..":"..name.."block"}
				}
			})
		end
	end
	if uses.ore ~= nil and uses.ore.makes ~= false then
		minetest.register_node(modname..":mineral_"..name, {
			description = desc.." Ore",
			tiles = {uses.ore.texture.base.."^"..uses.ore.texture.overlay},
			is_ground_content = true,
			drop = uses.ore.drop,
			light_source = uses.ore.light or 0,
			groups = uses.ore.groups,
			sounds = uses.ore.sounds
		})
		minetest.register_ore({
			ore_type       = "scatter",
			ore            = modname..":mineral_"..name,
			wherein        = uses.ore.generate.generate_inside_of,
			clust_scarcity = uses.ore.generate.chunks_per_mapblock,
			clust_num_ores = uses.ore.generate.max_blocks_per_chunk,
			clust_size     = uses.ore.generate.chunk_size,
			y_min     = uses.ore.generate.miny,
			y_max     = uses.ore.generate.maxy,
		})
	end
	if uses.lump ~= nil and uses.lump.makes ~= false then
		minetest.register_craftitem(modname..":"..name.."_"..uses.lump.name, {
			description = desc.." "..uses.lump.desc,
			inventory_image = uses.lump.texture,
		})
	end
	if uses.ingot ~= nil and uses.ingot.makes ~= false then
		minetest.register_craftitem(modname..":"..name.."_ingot", {
			description = desc.." Ingot",
			inventory_image = uses.ingot.texture,
		})
		if uses.ingot.smeltrecipe == true and uses.lump ~= nil then
			minetest.register_craft({
				type = "cooking",
				output = modname..":"..name.."_ingot",
				recipe = modname..":"..name.."_"..uses.lump.name,
			})
		end
	end
end

--#