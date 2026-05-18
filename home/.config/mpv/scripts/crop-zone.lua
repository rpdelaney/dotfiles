-- This script prints an FFmpeg crop filter string whenever pan or zoom is updated.

-- ANSI color codes
local reset = "\27[0m"
local bold = "\27[1m"
local green = "\27[32m"

-- Function to output the crop zone
function output_crop_zone()
    local vw = mp.get_property_number("video-params/w")
    local vh = mp.get_property_number("video-params/h")
    local zoom = mp.get_property_number("video-zoom")
    local pan_x = mp.get_property_number("video-pan-x")
    local pan_y = mp.get_property_number("video-pan-y")

    -- Ensure video parameters are loaded
    if not (vw and vh and zoom and pan_x and pan_y) then return end

    local z_factor = 2 ^ zoom

    -- Calculate unconstrained crop dimensions
    local cw = math.floor(vw / z_factor)
    local ch = math.floor(vh / z_factor)

    -- Calculate unconstrained crop offsets based on MPV's center-origin coordinates
    local cx = math.floor((vw / 2) - ((vw * (0.5 + pan_x)) / z_factor))
    local cy = math.floor((vh / 2) - ((vh * (0.5 + pan_y)) / z_factor))

    -- Clamp to source video boundaries
    cw = math.max(2, math.min(vw, cw))
    ch = math.max(2, math.min(vh, ch))
    cx = math.max(0, math.min(vw - cw, cx))
    cy = math.max(0, math.min(vh - ch, cy))

    -- Enforce even integers to maintain compatibility with yuv420p chroma subsampling
    cw = cw - (cw % 2)
    ch = ch - (ch % 2)
    cx = cx - (cx % 2)
    cy = cy - (cy % 2)

    -- Construct the colored output
    local output = string.format(
        "%scrop=%s%d:%d:%d:%d%s\n",
        bold, green, cw, ch, cx, cy, reset
    )
    io.stdout:write(output)
end

-- Function called whenever pan or zoom changes
function on_pan_zoom_change(name, value)
    output_crop_zone()
end

-- Observe changes to pan and zoom properties
mp.observe_property("video-zoom", "number", on_pan_zoom_change)
mp.observe_property("video-pan-x", "number", on_pan_zoom_change)
mp.observe_property("video-pan-y", "number", on_pan_zoom_change)
