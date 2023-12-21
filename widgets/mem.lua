local wibox = require("wibox")
local beautiful = require("beautiful")
local awful = require("awful")

local update_interval = 10  -- Update interval in seconds

local HOME_DIR = os.getenv("HOME")
local WIDGET_DIR = HOME_DIR .. '/.config/awesome/icons'

local mem_widget = wibox.widget {
    {
        {
            image = WIDGET_DIR .. "/brightness.svg",
            resize = true,
            widget = wibox.widget.imagebox
        },
        {
            id = "text",
            widget = wibox.widget.textbox
        },
        layout = wibox.layout.fixed.horizontal,
    },
    widget = wibox.container.margin,
    margins = 4
}

local function update_mem_widget(widget)
    local total, used, free, shared, buff_cache, available, total_swap, used_swap, free_swap =
        awful.spawn.with_line_callback("free -h --si", {
            stdout = function (line)
                if line:match("^Mem:") then
                    total, used, free, shared, buff_cache, available = line:match("Mem:%s+(%S+)%s+(%S+)%s+(%S+)%s+(%S+)%s+(%S+)%s+(%S+)")
                elseif line:match("^Swap:") then
                    total_swap, used_swap, free_swap = line:match("Swap:%s+(%S+)%s+(%S+)%s+(%S+)")
                end
            end
        })

    local used_gb = string.gsub(used, "G", "")
    local total_gb = string.gsub(total, "G", "")
    widget.text:set(used_gb .. "/" .. total_gb .. "GB")
end

update_mem_widget(mem_widget)

awful.widget.watch(
    'bash -c "free -h --si | grep ^Mem:"',
    update_interval,
    function(widget, stdout)
        update_mem_widget(mem_widget)
    end
)

return mem_widget