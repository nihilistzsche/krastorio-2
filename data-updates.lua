local table = require("__flib__.table")
---------------------------------------------------------------------------
-- -- -- PRE UPDATES
---------------------------------------------------------------------------
krastorio.stage = "data-updates"
---------------------------------------------------------------------------
-- -- -- CONTENTS UPDATES (data updates)
---------------------------------------------------------------------------
-- -- Modifing vanilla game objects
require(kr_prototypes_path .. "vanilla-changes/mandatory-vanilla-updates")
require(kr_prototypes_path .. "vanilla-changes/optional-vanilla-updates")
-- Generating buring recipes for fluids
local fluid_burner_util = require(kr_public_lib .. "fluid-burner-util")
fluid_burner_util.generateBurnFluidsRecipes()
-- Generate for each item that can't be processed from the crusher
-- a void recipe for destroy it
-- (This must be done after adding other recipes)
require(kr_recipes_prototypes_path .. "generate-void-crushing-recipes")
local matter_util = require(kr_public_lib .. "matter-util")
matter_util.createStandardKrastorioMatterRecipes()
-- Generate tree and rock recipes
require("prototypes.others.greenhouse")
---------------------------------------------------------------------------
-- -- -- COMPATIBILITY INITIALIZATION (data update stage)
---------------------------------------------------------------------------
local scripts_path = "compatibility-scripts/data-updates/"
require(scripts_path .. "angelsaddons-mobility")
require(scripts_path .. "angelsaddons-smeltingtrain")
require(scripts_path .. "Construction_Drones")
require(scripts_path .. "Flow_Control")
require(scripts_path .. "Load-Furn")
require(scripts_path .. "MineLiquidOres")
require(scripts_path .. "RealisticReactors")
-- AAI (Programmable) Vehicles
require(scripts_path .. "aai-vehicles")
require(scripts_path .. "aai-programmable-vehicles")
-- Pyanodons
require(scripts_path .. "Pyanodon")
-- Schall Uranium Processing
require(scripts_path .. "SchallUranium")
require(scripts_path .. "Tral-robot-tree-farm")
require(scripts_path .. "LinkedBelts")
---------------------------------------------------------------------------
-- -- -- OTHER
---------------------------------------------------------------------------
-- Make characters be targeted by the teleporter turrets
for _, character in pairs(data.raw["character"]) do
  local mask = character.trigger_target_mask or { "common", "ground-unit" }
  character.trigger_target_mask = mask

  -- FIXME: Use a proper name
  table.insert(mask, "character")
end
-- Make anything with an equipment grid of the correct category be detected by tesla coils
local types_have_grid = {
  "artillery-wagon",
  "car",
  "cargo-wagon",
  "character",
  "fluid-wagon",
  "locomotive",
  "spider-vehicle",
}
local grids = data.raw["equipment-grid"]
for _, type in pairs(types_have_grid) do
  for _, prototype in pairs(data.raw[type]) do
    if type ~= "character" then
      local grid = grids[prototype.equipment_grid]
      if not grid or not table.find(grid.equipment_categories, "universal-equipment") then
        goto continue
      end
    end

    local mask = prototype.trigger_target_mask
    if not mask then
      if type == "character" then
        mask = { "common", "ground-unit" }
      else
        mask = {}
      end
    end

    prototype.trigger_target_mask = mask
    table.insert(mask, "kr-tesla-coil-trigger")

    ::continue::
  end
end
-- Make trains targetable by tesla coils
local types_are_military = {
  "locomotive",
  "cargo-wagon",
  "fluid-wagon",
  "artillery-wagon",
}
for _, type in pairs(types_are_military) do
  for _, prototype in pairs(data.raw[type]) do
    prototype.is_military_target = true
  end
end

-- Map generation presets
require(kr_others_prototypes_path .. "map-gen-preset-updates")
