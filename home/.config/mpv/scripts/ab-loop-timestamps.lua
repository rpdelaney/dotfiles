-- This script prints the A-B loop timestamps whenever the A-B loop is created or updated.

-- Function to format time in HH:MM:SS.mmm
function format_time(seconds)
    local hrs = math.floor(seconds / 3600)
    local mins = math.floor((seconds % 3600) / 60)
    local secs = seconds % 60
    return string.format("%02d:%02d:%06.3f", hrs, mins, secs)
end

-- ANSI color codes
local reset = "\27[0m"
local bold = "\27[1m"
local green = "\27[32m"
local yellow = "\27[33m"

-- Function to output the A-B loop timestamps
function output_ab_loop_timestamps()
    local a = mp.get_property_number("ab-loop-a")
    local b = mp.get_property_number("ab-loop-b")
    if a and b then
        local a_formatted = format_time(a)
        local b_formatted = format_time(b)

        -- Construct the colored output
        local output = string.format(
            "%s-ss '%s%s%s%s' -to '%s%s%s%s%s'\n",
            bold, green, a_formatted, reset, bold,
            yellow, b_formatted, reset, bold, reset
        )
        io.stdout:write(output)
    end
end

-- Function called whenever ab-loop-a or ab-loop-b changes
function on_ab_loop_change(name, value)
    output_ab_loop_timestamps()
end

-- Observe changes to ab-loop-a and ab-loop-b
mp.observe_property("ab-loop-a", "number", on_ab_loop_change)
mp.observe_property("ab-loop-b", "number", on_ab_loop_change)
