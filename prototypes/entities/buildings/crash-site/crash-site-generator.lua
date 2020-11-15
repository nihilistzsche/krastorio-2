local hit_effects = require("__base__/prototypes/entity/demo-hit-effects")
local sounds      = require("__base__/prototypes/entity/demo-sounds")

data:extend(
{   
	{
		type = "electric-energy-interface",
		name = "kr-crash-site-generator",
		localised_name = {"entity-name.kr-damaged-ship-reactor"},
		localised_description = {"entity-description.kr-crash-site-building"},
		icon = kr_crash_site_icons_path .. "crash-site-generator.png",
		icon_size = 64, icon_mipmaps = 4,
		flags = {"placeable-player", "player-creation", "hidden", "not-rotatable"},
		map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
		max_health = 150,
		resistances =
		{
			{type = "fire", percent = 100},
			{type = "impact",percent = 60},
			{type = "physical",percent = 50}
		},
		corpse = "medium-remnants",
		minable =
		{
			mining_time = 4,
			results = 
			{
				{ type = "item", name = "iron-plate", amount_min = 5, amount_max = 13, probability = 1 },
				{ type = "item", name = "copper-cable", amount_min = 4, amount_max = 8, probability = 1 },
				{ type = "item", name = "iron-gear-wheel", amount_min = 3, amount_max = 5, probability = 0.75},
				{ type = "item", name = "electronic-circuit", amount_min = 2, amount_max = 3, probability = 0.75},
				{ type = "item", name = "kr-sentinel", amount_min = 1, amount_max = 2, probability = 0.50}
			},
			mining_particle = "shell-particle"
		},
		damaged_trigger_effect = hit_effects.entity(),
		collision_box = {{-1.5, -0.9}, {0.9, 0.9}},
		selection_box = {{-1.5, -0.9}, {0.9, 0.9}},
		allow_copy_paste = false,
		energy_source =
		{
			type = "electric",
			buffer_capacity = "240kJ",
			usage_priority = "primary-output",
			input_flow_limit = "0kW",
			output_flow_limit = "240kW"
		},
		energy_production = "240kW",
		energy_usage = "0kW",
		light = {intensity = 0.75, size = 6, color = {r = 1.0, g = 1.0, b = 1.0}, shift = {64/64, -140/64}},
		continuous_animation = true,
		integration_patch_render_layer = "decals",
		integration_patch =
		{
			filename = kr_crash_site_sprites_path .. "generator/crash-site-generator-ground.png",
			priority = crash_site_sprite_priority,
			width = 192,
			height = 180,
			shift = util.by_pixel(-28, -38),
			frame_count = 1,
			line_length = 1,
			hr_version =
			{
				filename = kr_crash_site_sprites_path .. "generator/hr-crash-site-generator-ground.png",
				priority = crash_site_sprite_priority,
				width = 384,
				height = 360,
				shift = util.by_pixel(-28, -38),
				frame_count = 1,
				line_length = 1,
				scale = 0.5
			}
		},
		animation =
		{
			layers =
			{
				{
					filename = kr_crash_site_sprites_path .. "generator/crash-site-generator.png",
					priority = crash_site_sprite_priority,
					width = 142,
					height= 128,
					frame_count = 5,
					line_length = 5,
					repeat_count = 16,
					shift = util.by_pixel(-10, -24),
					animation_speed = crash_site_generator_animation_speed,
					hr_version =
					{
						filename = kr_crash_site_sprites_path .. "generator/hr-crash-site-generator.png",
						priority = crash_site_sprite_priority,
						width = 286,
						height= 252,
						frame_count = 5,
						line_length = 5,
						repeat_count = 16,
						animation_speed = crash_site_generator_animation_speed,
						shift = util.by_pixel(-11, -23),
						scale = 0.5
					}
				},
				{
					filename = kr_crash_site_sprites_path .. "generator/crash-site-generator-beams.png",
					priority = crash_site_sprite_priority,
					width = 48,
					height= 116,
					frame_count = 16,
					line_length = 4,
					repeat_count = 5,
					shift = util.by_pixel(24, -30),
					animation_speed = crash_site_generator_animation_speed,
					hr_version = 
					{
						filename = kr_crash_site_sprites_path .. "generator/hr-crash-site-generator-beams.png",
						priority = crash_site_sprite_priority,
						width = 224,
						height= 232,
						frame_count = 16,
						line_length = 4,
						repeat_count = 5,
						animation_speed = crash_site_generator_animation_speed,
						shift = util.by_pixel(-8, -30),
						scale = 0.5
					}
				},
				{
					filename = kr_crash_site_sprites_path .. "generator/crash-site-generator-shadow.png",
					priority = crash_site_sprite_priority,
					width = 236,
					height= 78,
					frame_count = 1,
					line_length = 1,
					repeat_count = 80,
					shift = util.by_pixel(26, 4),
					draw_as_shadow = true,
					animation_speed = crash_site_generator_animation_speed,
					hr_version =
					{
						filename = kr_crash_site_sprites_path .. "generator/hr-crash-site-generator-shadow.png",
						priority = crash_site_sprite_priority,
						width = 474,
						height= 152,
						frame_count = 1,
						line_length = 1,
						repeat_count = 80,
						draw_as_shadow = true,
						shift = util.by_pixel(25, 5),
						animation_speed = crash_site_generator_animation_speed,
						scale = 0.5
					}
				}
			}
		},
		vehicle_impact_sound = sounds.generic_impact
	}
})