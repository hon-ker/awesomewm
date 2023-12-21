local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
local keybindings = require("lua.keybindings")
local statusbar = require("lua.statusbar")
local menu = require("lua.menu")
require("awful.autofocus")



-----------------------------------------------------------
-- 自启动
-----------------------------------------------------------
awful.spawn.with_shell("~/.config/awesome/autostart.sh")

-----------------------------------------------------------
--  主题加载
-----------------------------------------------------------
beautiful.init("~/.config/awesome/lua/theme.lua")

-----------------------------------------------------------
-- 屏幕设置
-----------------------------------------------------------
awful.screen.connect_for_each_screen(function(s)
  -- 创建statusbar
  statusbar.create(s)
end)


-----------------------------------------------------------
-- 绑定快捷键
-----------------------------------------------------------
root.buttons(gears.table.join(
    awful.button({ }, 3, function () menu.my_menu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

root.keys(keybindings.globalkeys)


-----------------------------------------------------------
-- 窗口规则
-----------------------------------------------------------

awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = {},
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = keybindings.clientkeys,
      buttons = keybindings.clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen
    }
  },
  {
    rule = { type = "dock" },  -- 匹配任务栏窗口类型
    properties = { above = false }  -- 将上面的属性设置为false
},
  {
    rule = { class = "Google-chrome" },
    properties = { floating = false }
  }

}
-- }}}


-- 信号事件

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
  -- Set the windows at the slave,
  -- i.e. put it at the end of others instead of setting it master.
  -- if not awesome.startup then awful.client.setslave(c) end

  if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
    -- Prevent clients from being unreachable after screen count changes.
    awful.placement.no_offscreen(c)
  end
end)


-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
  c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

-- client.connect_signal("property::floating", function(c)
--   -- 当窗口从平铺模式变为浮动模式时
--   if c.floating then
--     local new_width = 800 -- 新的宽度
--     local new_height = 600 -- 新的高度

--     -- 获取屏幕的工作区域（不包括任务栏等）
--     local screen_geometry = awful.screen.focused().workarea

--     -- 计算窗口的水平和垂直居中位置
--     local x = screen_geometry.x + (screen_geometry.width - new_width) / 2
--     local y = screen_geometry.y + (screen_geometry.height - new_height) / 2

--     -- 设置窗口的几何位置和使其置顶
--     c:geometry({ x = x, y = y, width = new_width, height = new_height })
--     -- c.ontop = true -- 将窗口置顶
--   end
-- end)



-- 函数：将窗口设置到屏幕正中央并设置大小（仅对浮动窗口有效）
-- 函数：将窗口设置到屏幕正中央并设置大小（仅对浮动窗口有效）
-- 创建一个函数来显示状态栏
-- 监听窗口全屏状态变化事件
client.connect_signal("property::fullscreen", function(c)
  if c.fullscreen then
      -- 当窗口进入全屏时隐藏状态栏
      c.screen.wibox.visible = false
  else
       -- 当窗口退出全屏时显示状态栏
      c.screen.wibox.visible = true
  end
end)
