--sc_flags
--intended to hang be placed next to default fence posts


local blank = "sc_invisible.png"

local flag_box = {
    type = "fixed",
    fixed = {-1.0, -0.5, -0.0625, 0.5, 0.5, 0.0625},
}

--  Define your colors here
local flag_colors = {
    {name = "orange", hex = "#B74D01"},
    {name = "red",    hex = "#C10000"},
    {name = "blue",   hex = "#269DFF"},
    {name = "green",  hex = "#425219"},
    {name = "pink",   hex = "#FF80C4"},
    {name = "purple", hex = "#570077"},
    {name = "white",  hex = "#FFFFE7"},
    {name = "yellow", hex = "#FFFF54"},
    {name = "black",  hex = "#2D2828"},
    -- Add more as needed
}

--  Register each flag node
for _, color in ipairs(flag_colors) do
    local tex = {
        name = "sc_flags_wool_animated.png^[multiply:" .. color.hex,
        animation = {
            type = "vertical_frames",
            aspect_w = 24,
            aspect_h = 16,
            length = 2
        }
    }

    minetest.register_node("sc_flags:flag_" .. color.name, {
        description = "Waving " .. color.name:gsub("^%l", string.upper) .. " Flag",
        drawtype = "mesh",
        mesh = "sc_flags_flag.obj",
        selection_box = flag_box,
        tiles = {tex, blank},
        use_texture_alpha = "clip",
        paramtype = "light",
        sunlight_propagates = true,
        walkable = false,
        is_ground_content = false,
        groups = {snappy = 3, oddly_breakable_by_hand = 1},
        sounds = default.node_sound_leaves_defaults(),
        paramtype2 = "facedir",
    })
end


-- Create aliases from old sc_blocks flags to new sc_flags flags
for _, color in ipairs(flag_colors) do
    minetest.register_alias("sc_blocks:flag_" .. color.name,
                            "sc_flags:flag_" .. color.name)
end
