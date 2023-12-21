local awful = require("awful")
local gears = require("gears")


-- 定义终端和编辑器
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

local MODKEY = "Mod4"

local keymap = {
  -- 一行一个按键
}


-- 定义一个将当前焦点窗口切换为浮动模式的函数
-- 鼠标事件
-- root.buttons(gears.table.join(
--   awful.button({ }, 3, function () mymainmenu:toggle() end),
--   awful.button({ }, 4, awful.tag.viewnext),
--   awful.button({ }, 5, awful.tag.viewprev)
-- ))

-- 显示/隐藏状态栏
local status_bar_visible = true

-- 定义一个函数以切换状态栏的可见性
local function toggleStatusBar()
    for s in screen do
        s.wibox.visible = not status_bar_visible
    end
    status_bar_visible = not status_bar_visible
end

local globalkeys = gears.table.join(
  -- 在 globalkeys 部分添加一个快捷键来切换状态栏可见性
  awful.key({ MODKEY }, "b", function() toggleStatusBar() end,
  { description = "Toggle Status Bar", group = "awesome" }),

  -- 打开win10
  awful.key({ MODKEY, }, "w", function() awful.spawn("nohup vmware -x /data/vm/win10/win10.vmx >/dev/null 2>&1 &") end,
  { description = "open a terminal", group = "launcher" }),
  awful.key({ MODKEY }, "s", function()
    local client = awful.client.focus.get()
    if client then
      client.floating = not client.floating
    end
  end, { description = "Toggle floating for focused client", group = "client" }),
  awful.key({ MODKEY, }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
  awful.key({ MODKEY, }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
  awful.key({ MODKEY, }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),
  awful.key({ MODKEY, }, "j",
    function()
      awful.client.focus.byidx(1)
    end,
    { description = "focus next by index", group = "client" }
  ),
  awful.key({ MODKEY, }, "k",
    function()
      awful.client.focus.byidx(-1)
    end,
    { description = "focus previous by index", group = "client" }
  ),
  awful.key({ MODKEY, }, "w", function() mymainmenu:show() end,
    { description = "show main menu", group = "awesome" }),
  -- 截图 按键同windows qq
  awful.key({ "Mod1", "Control" }, "a", function()
      awful.spawn("flameshot gui") -- 调整值根据需要修改
    end,
    { description = "screen shot", group = "media" }),
  -- 亮度增加
  awful.key({}, "XF86MonBrightnessUp", function()
      awful.spawn("xbacklight -inc 5") -- 调整值根据需要修改
    end,
    { description = "Increase Brightness", group = "media" }),

  -- 亮度减少
  awful.key({}, "XF86MonBrightnessDown", function()
      awful.spawn("xbacklight -dec 5") -- 调整值根据需要修改
    end,
    { description = "Decrease Brightness", group = "media" }),
  -- Layout manipulation
  awful.key({ MODKEY, "Shift" }, "j", function() awful.client.swap.byidx(1) end,
    { description = "swap with next client by index", group = "client" }),
  awful.key({ MODKEY, "Shift" }, "k", function() awful.client.swap.byidx(-1) end,
    { description = "swap with previous client by index", group = "client" }),
  awful.key({ MODKEY, "Control" }, "j", function() awful.screen.focus_relative(1) end,
    { description = "focus the next screen", group = "screen" }),
  awful.key({ MODKEY, "Control" }, "k", function() awful.screen.focus_relative(-1) end,
    { description = "focus the previous screen", group = "screen" }),
  awful.key({ MODKEY, }, "u", awful.client.urgent.jumpto,
    { description = "jump to urgent client", group = "client" }),
  -- 设置键绑定：循环选中当前窗口
  awful.key({ MODKEY }, "Tab", function()
    awful.client.focus.byidx(1)
    if client.focus then
      client.focus:raise()
    end
  end, { description = "Cycle through windows", group = "client" }),

  awful.key({ MODKEY, }, "g",
    function()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end,
    { description = "go back", group = "client" }),

  -- 打开终端
  awful.key({ MODKEY, }, "Return", function() awful.spawn(terminal) end,
    { description = "open a terminal", group = "launcher" }),
  -- 打开超级权限的终端
  awful.key({ MODKEY, "Shift" }, "Return", function() awful.spawn("sudo " .. terminal) end,
    { description = "open a terminal with sudo", group = "launcher" }),
  -- 打开菜单
  awful.key({ MODKEY, }, "d", function() awful.spawn("rofi -show drun") end,
    { description = "open a terminal", group = "launcher" }),
  awful.key({ MODKEY, }, "c", function() awful.spawn("google-chrome-stable") end,
    { description = "open a terminal", group = "launcher" }),
  awful.key({ MODKEY, "Control" }, "r", awesome.restart,
    { description = "reload awesome", group = "awesome" }),
  awful.key({ MODKEY, "Shift" }, "q", awesome.quit,
    { description = "quit awesome", group = "awesome" }),
  awful.key({ MODKEY, }, ".", function() awful.tag.incmwfact(0.05) end,
    { description = "increase master width factor", group = "layout" }),
  awful.key({ MODKEY, }, ",", function() awful.tag.incmwfact(-0.05) end,
    { description = "decrease master width factor", group = "layout" }),
  awful.key({ MODKEY, "Shift" }, "h", function() awful.tag.incnmaster(1, nil, true) end,
    { description = "increase the number of master clients", group = "layout" }),
  awful.key({ MODKEY, "Shift" }, "l", function() awful.tag.incnmaster(-1, nil, true) end,
    { description = "decrease the number of master clients", group = "layout" }),
  awful.key({ MODKEY, "Control" }, "h", function() awful.tag.incncol(1, nil, true) end,
    { description = "increase the number of columns", group = "layout" }),
  awful.key({ MODKEY, "Control" }, "l", function() awful.tag.incncol(-1, nil, true) end,
    { description = "decrease the number of columns", group = "layout" }),
  awful.key({ MODKEY, "Control" }, "space", function() awful.layout.inc(1) end,
    { description = "select next", group = "layout" }),
  awful.key({ MODKEY, "Shift" }, "space", function() awful.layout.inc(-1) end,
    { description = "select previous", group = "layout" }),

  awful.key({ MODKEY, "Control" }, "n",
    function()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        c:emit_signal(
          "request::activate", "key.unminimize", { raise = true }
        )
      end
    end,
    { description = "restore minimized", group = "client" }),

  -- Prompt
  awful.key({ MODKEY }, "x",
    function()
      awful.prompt.run {
        prompt       = "Run Lua code: ",
        textbox      = awful.screen.focused().mypromptbox.widget,
        exe_callback = awful.util.eval,
        history_path = awful.util.get_cache_dir() .. "/history_eval"
      }
    end,
    { description = "lua execute prompt", group = "awesome" }),
  -- Menubar
  awful.key({ MODKEY }, "p", function() menubar.show() end,
    { description = "show the menubar", group = "launcher" })
)

clientkeys = gears.table.join(
  awful.key({ MODKEY, }, "f",
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    { description = "toggle fullscreen", group = "client" }),
  awful.key({ MODKEY, }, "q", function(c) c:kill() end,
    { description = "close", group = "client" }),
  awful.key({ MODKEY }, "space", awful.client.floating.toggle,
    { description = "toggle floating", group = "client" }),
  awful.key({ MODKEY, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end,
    { description = "move to master", group = "client" }),
  awful.key({ MODKEY, }, "o", function(c) c:move_to_screen() end,
    { description = "move to screen", group = "client" }),
  awful.key({ MODKEY, }, "t", function(c) c.ontop = not c.ontop end,
    { description = "toggle keep on top", group = "client" }),
  awful.key({ MODKEY, }, "n",
    function(c)
      -- The client currently has the input focus, so it cannot be
      -- minimized, since minimized clients can't have the focus.
      c.minimized = true
    end,
    { description = "minimize", group = "client" }),
  awful.key({ MODKEY, "Control" }, "m",
    function(c)
      c.maximized_vertical = not c.maximized_vertical
      c:raise()
    end,
    { description = "(un)maximize vertically", group = "client" }),
  awful.key({ MODKEY, "Shift" }, "m",
    function(c)
      c.maximized_horizontal = not c.maximized_horizontal
      c:raise()
    end,
    { description = "(un)maximize horizontally", group = "client" })
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  globalkeys = gears.table.join(globalkeys,
    -- View tag only.
    awful.key({ MODKEY }, "#" .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end,
      { description = "view tag #" .. i, group = "tag" }),
    -- Toggle tag display.
    awful.key({ MODKEY, "Control" }, "#" .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end,
      { description = "toggle tag #" .. i, group = "tag" }),
    -- Move client to tag.
    awful.key({ MODKEY, "Shift" }, "#" .. i + 9,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end,
      { description = "move focused client to tag #" .. i, group = "tag" }),
    -- Toggle tag on focused client.
    awful.key({ MODKEY, "Control", "Shift" }, "#" .. i + 9,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:toggle_tag(tag)
          end
        end
      end,
      { description = "toggle focused client on tag #" .. i, group = "tag" })
  )
end

clientbuttons = gears.table.join(
  awful.button({}, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
  end),
  awful.button({ MODKEY }, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.move(c)
  end),
  awful.button({ MODKEY }, 3, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.resize(c)
  end)
)


-- taglist标签按钮
local taglist_buttons = gears.table.join(
  awful.button({}, 1, function(t) t:view_only() end),
  awful.button({ MODKEY }, 1, function(t)
    if client.focus then
      client.focus:move_to_tag(t)
    end
  end),
  awful.button({}, 3, awful.tag.viewtoggle),
  awful.button({ MODKEY }, 3, function(t)
    if client.focus then
      client.focus:toggle_tag(t)
    end
  end),
  awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
  awful.button({}, 5, function(t) awful.tag.viewprev(t.screen) end)
)

return {
  globalkeys = globalkeys,
  clientbuttons = clientbuttons,
  clientkeys = clientkeys,
  taglist_buttons = taglist_buttons
}
