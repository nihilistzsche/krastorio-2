-- -- -- Apply the choosen science pack recipes

-- Base
require(kr_public_lib .. "science-pack-recipe")
-- Variations
require(kr_settings_updates_compatibility_path .. "science-pack-variations")

-- Change Recipes
data.raw.recipe["automation-science-pack"] = krastorio.science_pack_recipes[settings.startup["kr-automation-science-pack-recipe"].value]["automation-science-pack"]
data.raw.recipe["logistic-science-pack"]   = krastorio.science_pack_recipes[settings.startup["kr-logistic-science-pack-recipe"].value]["logistic-science-pack"]
data.raw.recipe["military-science-pack"]   = krastorio.science_pack_recipes[settings.startup["kr-military-science-pack-recipe"].value]["military-science-pack"]
data.raw.recipe["chemical-science-pack"]   = krastorio.science_pack_recipes[settings.startup["kr-chemical-science-pack-recipe"].value]["chemical-science-pack"]
data.raw.recipe["production-science-pack"] = krastorio.science_pack_recipes[settings.startup["kr-production-science-pack-recipe"].value]["production-science-pack"]
data.raw.recipe["utility-science-pack"]    = krastorio.science_pack_recipes[settings.startup["kr-utility-science-pack-recipe"].value]["utility-science-pack"] 

-- Check impossible ingredients
local unlockable_items = krastorio.recipes.findNotUnlockableRecipes()

krastorio.recipes.removeIngredients("automation-science-pack", unlockable_items)
krastorio.recipes.removeIngredients("logistic-science-pack", unlockable_items)
krastorio.recipes.removeIngredients("military-science-pack", unlockable_items)
krastorio.recipes.removeIngredients("production-science-pack", unlockable_items)
krastorio.recipes.removeIngredients("utility-science-pack", unlockable_items)