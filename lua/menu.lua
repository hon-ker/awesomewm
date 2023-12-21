local awful = require("awful")
local theme = require("lua.theme")
local naughty = require("naughty")
local wibox = require("wibox")


local menu_theme = {
    height = theme.menu_height,  -- 设置菜单高度为20像素
    width = theme.menu_width,  -- 设置菜单宽度为150像素
    font = theme.menu_font,  -- 设置字体和字体大小
    fg_normal = theme.menu_fg_normal,   -- 设置正常状态下的前景色
    fg_focus = theme.menu_fg_focus,    -- 设置焦点状态下的前景色
    bg_normal = theme.menu_bg_normal,   -- 设置正常状态下的背景色
    bg_focus = theme.menu_bg_focus,    -- 设置焦点状态下的背景色
    border = theme.menu_border_color,      -- 设置边框颜色
    border_width  = theme.menu_border_width,-- 设置菜单的边框宽度（以像素为单位）。
    -- submenu_icon = "-",-- 设置子菜单的图标（可以是字符串或图标对象）。
    -- submenu = "",-- 设置子菜单的样式。
}

local awesomemenu = {
    { "reboot", function() awful.spawn("reboot") end },
    { "shutdown", function() awful.spawn("shutdown -h now") end },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
}

-- 创建一个菜单
local system_menu = awful.menu({
    items = {
        { "关机", function() awful.spawn("poweroff") end,theme.icon_shutdown },
        { "注销", function() awesome.quit() end ,theme.icon_reboot},
        { "重启", function() awful.spawn("reboot") end ,theme.icon_reboot},
        { "Item 3", function() naughty.notify({ text = "Clicked Item 3" }) end },
    },
    theme = menu_theme, -- 使用你的菜单主题
})
-- 添加左右边距
local my_menu = awful.menu({
    items = {
        { "Item 1", function() naughty.notify({ text = "Clicked Item 1" }) end, theme.icon_arch },
        { "Item 2", function() naughty.notify({ text = "Clicked Item 2" }) end,image },
        { "Item 3", function() naughty.notify({ text = "Clicked Item 3" }) end },
        { "Item 4", awesomemenu },
    },
    theme = menu_theme,
})



-- 在某个事件中显示菜单
-- my_menu:show({ keygrabbRer = true })
local wibox_launcher = awful.widget.launcher({
    image = theme.icon_menu,
    command = "sudo alacritty",
    -- menu=my_menu
})


local wibox_system = awful.widget.launcher({
    image = theme.icon_lock,
    menu = system_menu,
    -- command = "sudo alacritty"
})


return {
    wibox_launcher = wibox_launcher,
    wibox_system = wibox_system,
    myawesomemenu = myawesomemenu,
    my_menu = my_menu
  }