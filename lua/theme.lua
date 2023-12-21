-- theme.lua
local colors                                = {
    gray        = "#24283b",
    light_gray  = "#373B41",
    black       = "#222222",
    white       = "#ffffff",
    blue        = "#7aa2f7",
    green       = "#bbffb9",
    red         = "#f7768e",
    orange      = "#ff9e64",
    yellow      = "#e0af68",
    pink        = "#bb9af7",
    syan        = "#01ffff",
    theme       = "#F0C674",
    theme1      = "#9999ff",
    disabled    = "#707880",
    transparent = "#FFFFFF00"
}

---------------------------
-- Default awesome theme --
---------------------------

local xresources                            = require("beautiful.xresources")

local dpi                                   = xresources.apply_dpi

local gfs                                   = require("gears.filesystem")
local gears                                 = require("gears")
local themes_path                           = gfs.get_themes_dir()
local home                                  = os.getenv("HOME")

local theme                                 = {}

theme.gray                                  = "#24283b"
theme.light_gray                            = "#373B41"
theme.black                                 = "#222222"
theme.white                                 = "#ffffff"
theme.blue                                  = "#7aa2f7"
theme.green                                 = "#bbffb9"
theme.red                                   = "#f7768e"
theme.orange                                = "#ff9e64"
theme.yellow                                = "#e0af68"
theme.pink                                  = "#bb9af7"
theme.syan                                  = "#01ffff"
theme.theme                                 = "#F0C674"
theme.theme1                                = "#9999ff"
theme.disabled                              = "#707880"
theme.transparent                           = "#FFFFFF00"
-- theme.lua

theme.font                                  = "Noto Sans Mono SemiCondensed 12"

theme.bg_normal                             = colors.gray
theme.bg_focus                              = colors.gray
theme.bg_systray                            = colors.gray

theme.fg_normal                             = colors.white
theme.fg_focus                              = colors.white

theme.useless_gap                           = 2
theme.border_width                          = dpi(1)
theme.border_normal                         = colors.gray
theme.border_focus                          = colors.theme1
theme.border_marked                         = ""

theme.separator                             = "  |  "
theme.separator_color                       = colors.theme1
-- statusbar
-- awesome-menu
-- theme.awesome_icon = '<svg t="1692262076877" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1581" width="48" height="48"><path d="M524.1 87c-268.9 0-390.3 333.9-390.3 568.1 0 234.2 156.1 281.9 390.3 281.9 234.2 0 390.3-47.7 390.3-281.9S793 87 524.1 87z m-65 637.5H389.7V525h-65.1v-52h34.7c21.7 0 34.7-8.7 34.7-30.4v-13h65v294.9z m216.8 0h-65V525h-69.4v-52h34.7c21.7 0 34.7-8.7 34.7-30.4v-13H676v294.9z" p-id="1582"></path></svg>'
theme.awesome_icon                          = "~/.config/awesome/icons/menu.png"

-- 设置状态栏属性
theme.wibar_stretch                         = true                  -- 如果需要拉伸 Wibar 以填充屏幕
theme.wibar_border_width                    = 3                     -- Wibar 边框宽度如果想实现margin，请把 wibar_border_color 设置为空
theme.wibar_border_color                    = ""                    -- Wibar 边框颜色
theme.wibar_ontop                           = true                  -- 如果 Wibar 要位于其他窗口的顶部
theme.wibar_cursor                          = "arrow"               -- Wibar 的鼠标光标
theme.wibar_opacity                         = 0.86                  -- Wibar 不透明度，介于 0 和 1 之间
theme.wibar_type                            = "dock"                -- 窗口类型（桌面、普通、停靠等）
theme.wibar_width                           = ""                    -- Wibar 的宽度
theme.wibar_height                          = 36                    -- Wibar 的高度
theme.wibar_bg                              = colors.gray           -- 使用完全不透明的颜色值
theme.wibar_bgimage                         = ""                    -- Wibar 的背景图像
theme.wibar_fg                              = colors.white          -- Wibar 的前景色（文本）颜色
-- theme.wibar_shape           = gears.shape.rounded_rect      -- Wibar 的形状，圆角矩形
theme.wibar_shape                           = gears.shape.rectangle -- Wibar 的形状,矩形

-- taglist
-- theme.tags                   = { "","","","","","","","󰮤",""}
theme.tags                                  = { "", "", "", "", "", "", "", "", "" }
theme.taglist_font                          = "Symbols Nerd Font 12"
theme.taglist_spacing                       = 4
theme.taglist_bg_focus                      = colors.gray     -- 焦点标签的背景色
theme.taglist_fg_focus                      = colors.theme1   -- 焦点标签的前景色（文本颜色）
theme.taglist_bg_urgent                     = colors.gray     -- 紧急状态标签的背景色
theme.taglist_fg_urgent                     = colors.red      -- 紧急状态标签的前景色
theme.taglist_bg_occupied                   = colors.gray     -- 已占用标签的背景色
theme.taglist_fg_occupied                   = colors.white    -- 已占用标签的前景色
theme.taglist_bg_empty                      = colors.gray     -- 空标签的背景色
theme.taglist_fg_empty                      = colors.disabled -- 空标签的前景色
theme.taglist_bg_volatile                   = colors.gray     -- 变化标签的背景色
theme.taglist_fg_volatile                   = colors.red      -- 变化标签的前景色

-- tasklist
-- 当前窗口在焦点时的背景和前景颜色
theme.tasklist_bg_focus                     = nil
theme.tasklist_fg_focus                     = nil
-- 当前窗口在紧急状态时的背景和前景颜色
theme.tasklist_bg_urgent                    = nil
theme.tasklist_fg_urgent                    = nil
-- 任务列表外观设置
theme.tasklist_fg_normal                    = nil
theme.tasklist_bg_normal                    = nil
theme.tasklist_fg_focus                     = nil
theme.tasklist_bg_focus                     = nil
theme.tasklist_fg_urgent                    = nil
theme.tasklist_bg_urgent                    = nil
theme.tasklist_fg_minimize                  = nil
theme.tasklist_bg_minimize                  = nil
-- 任务列表背景图像设置
theme.tasklist_bg_image_normal              = ""
theme.tasklist_bg_image_focus               = ""
theme.tasklist_bg_image_urgent              = ""
theme.tasklist_bg_image_minimize            = ""
-- 任务列表其他设置
theme.tasklist_disable_icon                 = false
theme.tasklist_icon_width                   = 24
theme.tasklist_icon_height                  = 24

theme.tasklist_disable_task_name            = false
theme.tasklist_plain_task_name              = true
theme.tasklist_font                         = theme.font
--theme.tasklist_font                 = "monospace 10"
theme.tasklist_align                        = "left"
theme.tasklist_font_focus                   = theme.font
theme.tasklist_font_minimized               = ""
theme.tasklist_font_urgent                  = ""
theme.tasklist_spacing                      = 10
-- 任务列表形状和边框设置
theme.tasklist_shape                        = gears.shape.rectangle
theme.tasklist_shape_border_width           = 0
theme.tasklist_shape_border_color           = colors.gray
theme.tasklist_shape_focus                  = gears.shape.rectangle
theme.tasklist_shape_border_width_focus     = 0
theme.tasklist_shape_border_color_focus     = nil
theme.tasklist_shape_minimized              = gears.shape.rectangle
theme.tasklist_shape_border_width_minimized = 0
theme.tasklist_shape_border_color_minimized = nil
theme.tasklist_shape_urgent                 = gears.shape.rectangle
theme.tasklist_shape_border_width_urgent    = 0
theme.tasklist_shape_border_color_urgent    = nil


-- 菜单项的默认外观
theme.menu_submenu_icon = ""                                        --用于子菜单的图标。
theme.menu_font         = theme.taglist_font                                -- 菜单文本字体。
theme.menu_height       = 26                                        -- 物品高度。
theme.menu_width        = 100                                       -- 默认菜单宽度。
theme.menu_border_color = theme.gray                                -- 菜单项边框颜色。
theme.menu_border_width = 3                                         -- 菜单项边框宽度。
theme.menu_fg_focus     = theme.black                              -- 默认焦点项目前景（文本）颜色。
theme.menu_bg_focus     = theme.white                          -- 默认焦点项目背景颜色。
theme.menu_fg_normal    = theme.white                               -- 默认前景色（文本）。
theme.menu_bg_normal    = theme.gray                                -- 默认背景颜色。
theme.menu_submenu      = "-" -- 如果未提供 menu_submenu_icon，则默认子菜单指示器。


-- 通知
theme.notification_font             = theme.font         -- 字符串或lgi.Pango.FontDescription	通知字体。	
theme.notification_bg               = theme.gray           -- 通知背景颜色。	
theme.notification_fg               = theme.white           -- 通知前景色。	
theme.notification_border_width     = theme.gray -- 整数	通知边框宽度。	
theme.notification_border_color     = theme.gray  -- 颜色	通知边框颜色。	
theme.notification_shape            = gears.shape.partially_rounded_rect
theme.notification_opacity          = 1      -- 整数	通知不透明度。	
theme.notification_margin           = 6      -- 整数	通知小部件（或弹出窗口）内的边距。	
theme.notification_spacing          = 10      -- 数字	通知之间的间距。
-- theme.notification_width            = 300       -- 整数	通知宽度。	
-- theme.notification_height           = 100       -- 整数	通知高度。	



theme.wallpaper         = themes_path .. "default/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh      = themes_path .. "default/layouts/fairhw.png"
theme.layout_fairv      = themes_path .. "default/layouts/fairvw.png"
theme.layout_floating   = themes_path .. "default/layouts/floatingw.png"
theme.layout_magnifier  = themes_path .. "default/layouts/magnifierw.png"
theme.layout_max        = themes_path .. "default/layouts/maxw.png"
theme.layout_fullscreen = themes_path .. "default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path .. "default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path .. "default/layouts/tileleftw.png"
theme.layout_tile       = home .. "/.config/awesome/icons/tile.png"
theme.layout_tiletop    = themes_path .. "default/layouts/tiletopw.png"
theme.layout_spiral     = themes_path .. "default/layouts/spiralw.png"
theme.layout_dwindle    = themes_path .. "default/layouts/dwindlew.png"
theme.layout_cornernw   = themes_path .. "default/layouts/cornernww.png"
theme.layout_cornerne   = themes_path .. "default/layouts/cornernew.png"
theme.layout_cornersw   = themes_path .. "default/layouts/cornersww.png"
theme.layout_cornerse   = themes_path .. "default/layouts/cornersew.png"

-- 其他设置b
theme.icon_menu     = home .. "/.config/awesome/icons/menu.png"
theme.icon_arch     = home .. "/.config/awesome/icons/archlinux.png"
theme.icon_settings = home .. "/.config/awesome/icons/setting-fill.png"
theme.icon_shutdown = home .. "/.config/awesome/icons/shutdown.png"
theme.icon_reboot   = home .. "/.config/awesome/icons/reboot.png"
theme.icon_lock     = home .. "/.config/awesome/icons/ts-lock.png"

-- widgets
theme.widgets_num_font = "Symbols Nerd Font 12"

return theme
