-- ktx oregen and torch
-- ktx v0.1
-- 2019 Jan 15
-- Xiong
-- hacked from GloopTest v0.0.4a
-- CC-BY-SA


ktx.ore = {}
ktx.debug(
    "MESSAGE",
    "Loading ores."
)

local stone_sounds = default.node_sound_stone_defaults()

dofile(minetest.get_modpath("ktx").."/ore/api.lua")

-- following comment reproduced verbatim from previous author:

-- HUGE NOTE HERE:
-- I did not make the textures. celeron55/erlehmann made the textures which were licensed under CC-BY-SA, and then edited by me.
-- The textures for non-gem ores are thus CC-BY-SA, with respect to celeron55/erlehmann
-- Suck it, minetest community.
--

-- Kalite in common stone.
ktx.ore.register_ore("ktx", "kalite", "Kalite", {
	ore = {
		makes = true,
		drop = {
			max_items = 4,
			items = {
				{
					items = {'ktx:kalite_lump'},
					rarity = 5,
				},
				{
					items = {'ktx:kalite_lump'},
					rarity = 2,
				},
				{
					items = {'ktx:kalite_lump 2'},
				},
			}
		},
		texture = {
			base = "default_stone.png",
			overlay = "gloopores_mineral_kalite.png",
		},
		groups = {cracky=3},
		sounds = stone_sounds,
		generate = {
			generate_inside_of = "default:stone",
			chunks_per_mapblock = 9*9*9,
			chunk_size = 6,
			max_blocks_per_chunk = 7,
			miny = -31000,
			maxy = 10
		},
	},
})

minetest.register_craftitem("ktx:kalite_lump", {
	description = "Kalite Lump",
	inventory_image = "gloopores_kalite_lump.png",
	on_use = minetest.item_eat(1),
})

minetest.register_node("ktx:kalite_torch", {
	description = "Kalite Torch",
	drawtype = "torchlike",
	tiles = {
		{name="gloopores_kalite_torch_on_floor_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		{name="gloopores_kalite_torch_on_ceiling_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}},
		{name="gloopores_kalite_torch_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=3.0}}
	},
	inventory_image = "gloopores_kalite_torch_on_floor.png",
	wield_image = "gloopores_kalite_torch_on_floor.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = LIGHT_MAX-1,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5-0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5+0.6, 0.1},
		wall_side = {-0.5, -0.3, -0.1, -0.5+0.3, 0.3, 0.1},
	},
	groups = {choppy=2,dig_immediate=3},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
})

minetest.register_craft({
	output = "ktx:kalite_torch 4",
	recipe = {
		{"ktx:kalite_lump"},
		{"default:stick"},
	}
})

minetest.register_craft({
	type = "fuel",
	recipe = "ktx:kalite_lump",
	burntime = 30,
})

-- Iron ore in desert stone.
ktx.ore.register_ore("ktx", "desert_iron", "Desert Iron", {
	ore = {
		makes = true,
		drop = "default:iron_lump",
		texture = {
			base = "default_desert_stone.png",
			overlay = "default_mineral_iron.png",
		},
		groups = {cracky=3},
		sounds = stone_sounds,
		generate = {
			generate_inside_of = "default:desert_stone",
			chunks_per_mapblock = 7*7*7,
			chunk_size = 2,
			max_blocks_per_chunk = 3,
			miny = 0,
			maxy = 10
		},
	},
})

-- Coal in desert stone.
ktx.ore.register_ore("ktx", "desert_coal", "Desert Coal", {
	ore = {
		makes = true,
		drop = "default:coal_lump",
		texture = {
			base = "default_desert_stone.png",
			overlay = "default_mineral_coal.png",
		},
		groups = {cracky=3},
		sounds = stone_sounds,
		generate = {
			generate_inside_of = "default:desert_stone",
			chunks_per_mapblock = 6*6*6,
			chunk_size = 3,
			max_blocks_per_chunk = 8,
			miny = 0,
			maxy = 30
		},
	},
})

--#