-- This script prints the A-B loop timestamps when mpv exits, if an A-B loop is set.

function on_shutdown()
    local a = mp.get_property_number("ab-loop-a")
    local b = mp.get_property_number("ab-loop-b")

    if a and b then
        local function format_time(seconds)
            local hrs = math.floor(seconds / 3600)
            local mins = math.floor((seconds % 3600) / 60)
            local secs = seconds % 60
            return string.format("%02d:%02d:%06.3f", hrs, mins, secs)
        end

        local a_formatted = format_time(a)
        local b_formatted = format_time(b)

        -- ANSI color codes
        local reset = "\27[0m"
        local bold = "\27[1m"
        local green = "\27[32m"
        local yellow = "\27[33m"

        -- Construct the colored output
        local output = string.format(
            "%s-ss '%s%s%s%s' -to '%s%s%s%s%s'\n",
            bold, green, a_formatted, reset, bold,
            yellow, b_formatted, reset, bold, reset
        )
        io.stdout:write(output)
    end
end

mp.register_event("shutdown", on_shutdown)
