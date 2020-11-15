local hit_effects = require("__base__/prototypes/entity/demo-hit-effects")
local sounds      = require("__base__/prototypes/entity/demo-sounds")

data:extend(
{   
	{
		type = "lab",
		name = "kr-crash-site-lab-repaired",
		localised_name = {"entity-name.kr-damaged-ship-research-computer"},
		localised_description = {"entity-description.kr-crash-site-building"},
		has_backer_name = false,
		icon = kr_crash_site_icons_path .. "crash-site-lab-repaired.png",
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
		corpse = "big-remnants",
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
		dying_explosion = "medium-explosion",
		damaged_trigger_effect = hit_effects.entity(),
		collision_box = {{-2.2, -1.2}, {2.2, 1.2}},
		selection_box = {{-2.5, -1.5}, {2.5, 1.5}},
		entity_info_icon_shift = util.by_pixel(32, 0),
		light = {intensity = 0.9, size = 12, color = {r = 1.0, g = 1.0, b = 1.0}, shift = {1.5, 0.5}},
		integration_patch_render_layer = "decals",
		integration_patch = hr_crash_site_lab_ground(),
		on_animation =
		{
			layers =
			{
				{
					filename = kr_crash_site_sprites_path .. "lab/crash-site-lab-repaired.png",
					priority = crash_site_sprite_priority,
					width = 244,
					height = 126,
					frame_count = 1,
					line_length = 1,
					repeat_count = 24,
					animation_speed = 1 / 3,
					shift = util.by_pixel(-18, 14),
					hr_version =
					{
						filename = kr_crash_site_sprites_path .. "lab/hr-crash-site-lab-repaired.png",
						priority = crash_site_sprite_priority,
						width = 488,
						height = 252,
						frame_count = 1,
						line_length = 1,
						repeat_count = 24,
						animation_speed = 1 / 3,
						shift = util.by_pixel(-18, 14),
						scale = 0.5
					}
				},
				{
					filename = kr_crash_site_sprites_path .. "lab/crash-site-lab-repaired-beams.png",
					priority = crash_site_sprite_priority,
					width = 68,
					height = 50,
					frame_count = 24,
					line_length = 6,
					animation_speed = 1 / 3,
					shift = util.by_pixel(36, -20),
					blend_mode = "additive",
					hr_version =
					{
						filename = kr_crash_site_sprites_path .. "lab/hr-crash-site-lab-repaired-beams.png",
						priority = crash_site_sprite_priority,
						width = 130,
						height = 100,
						frame_count = 24,
						line_length = 6,
						animation_speed = 1 / 3,
						shift = util.by_pixel(37, -20),
						blend_mode = "additive",
						scale = 0.5
					}
				},
				{
					filename = kr_crash_site_sprites_path .. "lab/crash-site-lab-repaired-shadow.png",
					priority = crash_site_sprite_priority,
					width = 350,
					height = 148,
					frame_count = 1,
					line_length = 1,
					repeat_count = 24,
					animation_speed = 1 / 3,
					shift = util.by_pixel(-12, 12),
					draw_as_shadow = true,
					hr_version =
					{
						filename = kr_crash_site_sprites_path .. "lab/hr-crash-site-lab-repaired-shadow.png",
						priority = crash_site_sprite_priority,
						width = 696,
						height = 302,
						frame_count = 1,
						line_length = 1,
						repeat_count = 24,
						animation_speed = 1 / 3,
						shift = util.by_pixel(-11, 12),
						scale = 0.5,
						draw_as_shadow = true
					}
				}
			}
		},
		off_animation =
		{
			layers =
			{
				{
					filename = kr_crash_site_sprites_path .. "lab/crash-site-lab-repaired.png",
					priority = crash_site_sprite_priority,
					width = 244,
					height = 126,
					frame_count = 1,
					line_length = 1,
					repeat_count = 24,
					animation_speed = 1 / 3,
					shift = util.by_pixel(-18, 14),
					hr_version =
					{
						filename = kr_crash_site_sprites_path .. "crash-site-lab/hr-crash-site-lab-repaired.png",
						priority = crash_site_sprite_priority,
						width = 488,
						height = 252,
						frame_count = 1,
						line_length = 1,
						repeat_count = 24,
						animation_speed = 1 / 3,
						shift = util.by_pixel(-18, 14),
						scale = 0.5
					}
				},
				{
					filename = kr_crash_site_sprites_path .. "lab/crash-site-lab-repaired-shadow.png",
					priority = crash_site_sprite_priority,
					width = 350,
					height = 148,
					frame_count = 1,
					line_length = 1,
					repeat_count = 24,
					animation_speed = 1 / 3,
					shift = util.by_pixel(-12, 12),
					draw_as_shadow = true,
					hr_version =
					{
						filename = kr_crash_site_sprites_path .. "lab/hr-crash-site-lab-repaired-shadow.png",
						priority = crash_site_sprite_priority,
						width = 696,
						height = 302,
						frame_count = 1,
						line_length = 1,
						repeat_count = 24,
						animation_speed = 1 / 3,
						shift = util.by_pixel(-11, 12),
						scale = 0.5,
						draw_as_shadow = true
					}
				}
			}
		},
		working_sound =
		{
			sound =
			{
				filename = "__base__/sound/lab.ogg",
				volume = 0.7
			},
			audible_distance_modifier = 0.7,
			fade_in_ticks = 4,
			fade_out_ticks = 20
		},
		vehicle_impact_sound = sounds.generic_impact,
		open_sound = sounds.machine_open,
		close_sound = sounds.machine_close,
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			emissions_per_minute = 4
		},
		energy_usage = "60kW",
		researching_speed = 1,
		inputs = { "basic-tech-card" }
	}
})