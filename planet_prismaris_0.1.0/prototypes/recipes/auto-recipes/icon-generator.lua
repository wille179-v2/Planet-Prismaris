function generate_recycling_recipe_icons_from_item(item, mode)
  local icons = {}
  local topIcon = prismarisConstants.iconsPath .. "chronocycle-" .. mode .. "-top.png" --chronocycle-acceleration-top
  if item.icons == nil then
    icons =
    {
      {
        icon = "__recycler__/graphics/icons/recycling.png"
      },
      {
        icon = item.icon,
        icon_size = item.icon_size,
        scale = (0.5 * defines.constant.default_icon_size / (item.icon_size or defines.constant.default_icon_size)) * 0.8,
      },
      {
        icon = topIcon
      },
    }
  else
    icons =
    {
      {
        icon = "__recycler__/graphics/icons/recycling.png"
      }
    }
    for i = 1, #item.icons do
      local icon = table.deepcopy(item.icons[i]) -- we are gonna change the scale, so must copy the table
      icon.scale = ((icon.scale == nil) and (0.5 * defines.constant.default_icon_size / (icon.icon_size or defines.constant.default_icon_size)) or icon.scale) * 0.8
      icon.shift = util.mul_shift(icon.shift, 0.8)
      icons[#icons + 1] = icon
    end
    icons[#icons + 1] =
    {
      icon = topIcon
    }
  end
  return icons
end

return generate_recycling_recipe_icons_from_item