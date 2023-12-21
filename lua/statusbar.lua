-- statusbar.lua

local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local keybindings = require("lua.keybindings")
local theme = require("lua.theme")
local menu = require("lua.menu")

local statusbar = {} -- 创建一个模块

-- statusbar 间隔符号
local separator = wibox.widget.textbox('<span foreground="' ..
    theme.separator_color .. '">' .. theme.separator .. '</span>')

-- 状态栏 时钟
local textclock = wibox.widget.textclock()
textclock.font = theme.font
local logout = require("widgets.logout")
local battery = require("widgets.battery")
local light = require("widgets.light")
local cpu = require("widgets.cpu")
-- 设置可以切换的布局
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.floating,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
    awful.layout.suit.corner.ne,
    awful.layout.suit.corner.sw,
    awful.layout.suit.corner.se,
}


statusbar.create = function(s)
    -- 设置tag列表,默认tile布局
    awful.tag(theme.tags, s, awful.layout.layouts[1])

    -- 布局
    s.layoutbox = awful.widget.layoutbox(s)

    s.layoutbox:buttons(gears.table.join(
        awful.button({}, 1, function() awful.layout.inc(1) end),
        awful.button({}, 3, function() awful.layout.inc(-1) end),
        awful.button({}, 4, function() awful.layout.inc(1) end),
        awful.button({}, 5, function() awful.layout.inc(-1) end))
    )

    s.taglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        -- filter  = awful.widget.taglist.filter.noempty,
        buttons = keybindings.taglist_buttons
    }

    s.tasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.focused,
        widget_template = {
            {
                {
                    {
                        id = 'icon_role',
                        widget = wibox.widget.imagebox, -- 使用 imagebox 来显示图标
                        forced_width = 20,              -- 设置图标的宽度
                        forced_height = 20,             -- 设置图标的高度
                    },
                    top = 8,
                    right = 6,
                    left = 6,
                    widget = wibox.container.margin,

                },
                {
                    id = 'text_role',
                    widget = wibox.widget.textbox, -- 用于显示窗口标题
                },
                layout = wibox.layout.fixed.horizontal,
            },
            widget = wibox.container.margin,
        },
    }

    -- 创建statusbar
    s.wibox = awful.wibar({ position = "top", screen = s })

    -- 初始化statusbar
    s.wibox:setup {
        layout = wibox.layout.align.horizontal,

        {
            layout = wibox.layout.fixed.horizontal,
            menu.wibox_launcher,
            separator,
            s.taglist,
            separator,
        },
        s.tasklist,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.textbox(" "),
            cpu(),
            textclock,
            -- calendar(),
            separator,
            battery({
                show_current_level = true
            }),
            wibox.widget.textbox(" "),
            light{
                type = 'icon_and_text',
                program = 'xbacklight',
                step = 2,
            },
            separator,
            wibox.widget.systray(),
            s.layoutbox,
            logout(),
        },
    }
    -- 状态栏默认隐藏
    s.wibox.visible = true
    s.wibox.ontop = false
end

return statusbar -- 导出模块
