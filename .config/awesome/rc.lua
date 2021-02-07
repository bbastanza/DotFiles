--[[
     _                        _  ___  
 ___| |_ __ _ _ __  _____   _/ |/ _ \ 
/ __| __/ _` | '_ \|_  / | | | | | | |
\__ \ || (_| | | | |/ /| |_| | | |_| |
|___/\__\__,_|_| |_/___|\__,_|_|\___/ 

 full stack web developer
 www.brianbastanza.me
 https://github.com/bbastanza 
--

--]]

-- {{{ Required libraries
local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

local APW           = require("apw/widget")
local gears         = require("gears")
local awful         = require("awful")
                      require("awful.autofocus")
local wibox         = require("wibox")
local beautiful     = require("beautiful")
local naughty       = require("naughty")
local lain          = require("lain")
local freedesktop   = require("freedesktop")
local hotkeys_popup = require("awful.hotkeys_popup").widget
                      require("awful.hotkeys_popup.keys")
local my_table      = awful.util.table or gears.table -- 4.{0,1} compatibility
local dpi           = require("beautiful.xresources").apply_dpi
-- }}}

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "You done fucked up.",
                     position = "bottom_right",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         position = "bottom_right",
                         title = "You done fucked up.",
                         text = tostring(err) })
        in_error = false
    end)
end
-- }}}

-- {{{ Autostart windowless processes

-- This function will run once every time Awesome is started
local function run_once(cmd_arr)
    for _, cmd in ipairs(cmd_arr) do
        awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
    end
end

run_once({ "urxvtd", "unclutter -root" }) -- entries must be separated by commas

local themes = {
    "blackburn",       -- 1
    "copland",         -- 2
    "dremora",         -- 3
    "holo",            -- 4
    "multicolor",      -- 5
    "powerarrow",      -- 6
    "powerarrow-dark", -- 7
    "rainbow",         -- 8
    "steamburn",       -- 9
    "vertex",          -- 10
    "stanzu",          -- 11
}

local chosen_theme = themes[11]
local modkey       = "Mod4"
local altkey       = "Mod1"
local terminal     = "kitty"
local vi_focus     = false -- vi-like client focus - https://github.com/lcpz/awesome-copycats/issues/275
local cycle_prev   = true -- cycle trough all previous client or just the first -- https://github.com/lcpz/awesome-copycats/issues/274
local editor       = os.getenv("nvim") or "nvim"
local gui_editor   = os.getenv("code") or "emacs"
local browser      = os.getenv("Brave-browser") or "firefox"
local scrlocker    = "slock"

awful.util.terminal = terminal
awful.util.tagnames = { "  ", " ‹∕› ", " 球 ", "  ", "  ", " ♫ ", "  " }
awful.layout.layouts = {
    awful.layout.suit.corner.nw,
    --awful.layout.suit.corner.ne,
    --awful.layout.suit.corner.sw,
    --awful.layout.suit.corner.se,
    awful.layout.suit.tile,
    --awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.fair,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    --awful.layout.suit.max.fullscreen,
    --awful.layout.suit.magnifier,
    awful.layout.suit.floating,
    --lain.layout.cascade,
    --lain.layout.cascade.tile,
    --lain.layout.centerwork,
    --lain.layout.centerwork.horizontal,
    --lain.layout.termfair,
    --lain.layout.termfair.center,
}

awful.util.taglist_buttons = my_table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

awful.util.tasklist_buttons = my_table.join(
    awful.button({ }, 1, function (c)
        if c == client.focus then
            c.minimized = true
        else
            --c:emit_signal("request::activate", "tasklist", {raise = true})<Paste>

            -- Without this, the following
            -- :isvisible() makes no sense
            c.minimized = false
            if not c:isvisible() and c.first_tag then
                c.first_tag:view_only()
            end
            -- This will also un-minimize
            -- the client, if needed
            client.focus = c
            c:raise()
        end
    end),
    awful.button({ }, 2, function (c) c:kill() end),
    awful.button({ }, 3, function ()
        local instance = nil

        return function ()
            if instance and instance.wibox.visible then
                instance:hide()
                instance = nil
            else
                instance = awful.menu.clients({theme = {width = dpi(250)}})
            end
        end
    end),
    awful.button({ }, 4, function () awful.client.focus.byidx(1) end),
    awful.button({ }, 5, function () awful.client.focus.byidx(-1) end)
)

lain.layout.termfair.nmaster           = 3
lain.layout.termfair.ncol              = 1
lain.layout.termfair.center.nmaster    = 3
lain.layout.termfair.center.ncol       = 1
lain.layout.cascade.tile.offset_x      = dpi(2)
lain.layout.cascade.tile.offset_y      = dpi(32)
lain.layout.cascade.tile.extra_padding = dpi(5)
lain.layout.cascade.tile.nmaster       = 5
lain.layout.cascade.tile.ncol          = 2

beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))
-- }}}

-- {{{ Menu
local myawesomemenu = {
    { "hotkeys", function() return false, hotkeys_popup.show_help end },
    { "manual", terminal .. " -e man awesome" },
    { "edit config", string.format("%s -e %s %s", terminal, editor, awesome.conffile) },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end }
}
awful.util.mymainmenu = freedesktop.menu.build({
    icon_size = beautiful.menu_height or dpi(20),
    before = {
        { "Awesome", myawesomemenu, beautiful.awesome_icon },
        -- other triads can be put here
    },
    after = {
        { "Open terminal", terminal },
        -- other triads can be put here
    }
})

-- {{{ Screen
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", function(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)

-- No borders when rearranging only 1 non-floating or maximized client
screen.connect_signal("arrange", function (s)
    local only_one = #s.tiled_clients == 1
    for _, c in pairs(s.clients) do
        if only_one and not c.floating or c.maximized then
            c.border_width = 0
        else
            c.border_width = beautiful.border_width
        end
    end
end)

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s) beautiful.at_screen_connect(s) end)
-- }}}

-- {{{ Mouse bindings
root.buttons(my_table.join(
    awful.button({ }, 1, function () awful.util.mymainmenu:hide() end),
    awful.button({ }, 3, function () awful.util.mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = my_table.join(
    -- Hotkeys
    awful.key({ modkey, "Control" }, "s",      hotkeys_popup.show_help,
              {description = "show help", group="awesome"}),

    -- Tag browsing
    awful.key({ modkey }, "h",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),

    awful.key({ modkey }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),

    awful.key({ modkey }, "l",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),

    awful.key({ modkey }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),

    awful.key({ altkey }, "Escape", awful.tag.history.restore,
              {description = "go back", group = "tag"}),

    -- Non-empty tag browsing
    awful.key({ altkey }, "Left", function () lain.util.tag_view_nonempty(-1) end,
              {description = "view previous nonempty", group = "tag"}),

    awful.key({ altkey }, "Right", function () lain.util.tag_view_nonempty(1) end,
              {description = "view next nonempty", group = "tag"}),

    awful.key({ altkey, "Shift" }, "Tab", function () lain.util.tag_view_nonempty(1) end,
              {description = "view next nonempty", group = "tag"}),

    -- By direction client focus
    awful.key({ altkey }, "j",
        function()
            awful.client.focus.global_bydirection("down")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus down", group = "client"}),

    awful.key({ altkey }, "k",
        function()
            awful.client.focus.global_bydirection("up")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus up", group = "client"}),

    awful.key({ altkey }, "h",
        function()
            awful.client.focus.global_bydirection("left")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus left", group = "client"}),

    awful.key({ altkey }, "l",
        function()
            awful.client.focus.global_bydirection("right")
            if client.focus then client.focus:raise() end
        end,
        {description = "focus right", group = "client"}),

    -- Layout manipulation
    awful.key({ altkey, "Control"   }, "l", function () awful.client.swap.byidx(  1)    end,
              {description = "swap with next client by index", group = "client"}),

    awful.key({ altkey, "Control"   }, "h", function () awful.client.swap.byidx( -1)    end,
              {description = "swap with previous client by index", group = "client"}),

    awful.key({ altkey }, "o", function () awful.screen.focus_relative( 1) end,
              {description = "focus the next screen", group = "screen"}),

    awful.key({ altkey,           }, "Tab",
        function ()
            awful.client.focus.byidx(1)
            if client.focus then
                client.focus:raise()
            end
        end,
        {description = "cycle next window", group = "client"}),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),

    awful.key({ modkey, "Control"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),

-- width
    awful.key({ altkey, "Shift"   }, "l",     function () awful.tag.incmwfact( 0.05)          end,
              {description = "increase master width factor", group = "layout"}),

    awful.key({ altkey, "Shift"   }, "h",     function () awful.tag.incmwfact(-0.05)          end,
              {description = "decrease master width factor", group = "layout"}),
    
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1, nil, true)    end,
              {description = "increase the number of columns", group = "layout"}),

    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1, nil, true)    end,
              {description = "decrease the number of columns", group = "layout"}),

    awful.key({ altkey,           }, "space", function () awful.layout.inc( 1)                end,
              {description = "select next layout", group = "layout"}),
    
    awful.key({ altkey, "Shift"   }, "space", function () awful.layout.inc(-1)                end,
              {description = "select previous layout", group = "layout"}),

    awful.key({ altkey, "Control" }, "n",
              function ()
                  local c = awful.client.restore()
                  -- Focus restored client
                  if c then
                      client.focus = c
                      c:raise()
                  end
              end,
              {description = "restore minimized", group = "client"}),

    -- Show/Hide Wibox
    awful.key({ altkey }, "F11", function ()
            for s in screen do
                if s.mybottomwibox then
                    s.mybottomwibox.visible = not s.mybottomwibox.visible
                end
            end
        end,
        {description = "toggle wibox", group = "awesome"}),

    -- Brightness
    awful.key({ }, "XF86MonBrightnessDown", function () os.execute("xbacklight -dec 7") end,
              {description = "Brightness Down(alternate)", group = "display"}),

    awful.key({ }, "XF86MonBrightnessUp", function () os.execute("xbacklight -inc 7") end,
              {description = "Brightness Up", group = "display"}),

    awful.key({ modkey }, "F11", function () os.execute("xbacklight -dec 7") end,
              {description = "Brightness Down(alternate)", group = "display"}),

    awful.key({ modkey }, "F12", function () os.execute("xbacklight -inc 7") end,
              {description = "Brightness Up", group = "display"}),

    -- APW Hotkeys (Audio Volume)
    awful.key({ }, "XF86AudioRaiseVolume", APW.Up,
      {description = "volume up", group = "hotkeys"}),
    
    awful.key({ }, "F7", APW.Up,
          {description = "volume up(alternate)", group = "hotkeys"}),

    awful.key({ }, "XF86AudioLowerVolume", APW.Down,
        {description = "volume down", group = "hotkeys"}),

    awful.key({ }, "F6", APW.Down,
        {description = "volume down(alternate)", group = "hotkeys"}),

    awful.key({ }, "XF86AudioMute", APW.ToggleMute,
        {description = "toggle mute", group = "hotkeys"}),

    -- X screen locker
    awful.key({ modkey, altkey }, "l", function () os.execute(scrlocker) end,
              {description = "lock screen", group = "user apps"}),

    -- User programs
    awful.key({ modkey, altkey }, "k", function () awful.util.spawn("xkill") end,  
              {description = "launch xkill", group = "user apps"}),

    awful.key({ modkey }, "q", function () awful.util.spawn("qutebrowser 'https://soundcloud.com'") end,  
              {description = "launch soundcloud(qutebrowser)", group = "user apps"}),

    awful.key({ modkey, altkey }, "space", function () awful.util.spawn("rofi -show run -desktop -display-run 'term'") end, -- 
              {description = "launch Rofi", group = "user apps"}),

    awful.key({ modkey }, "Tab", function () awful.util.spawn("rofi -show window -show-icons -config ~/.config/rofi/themes/dt-center.rasi") end, -- 
              {description = "launch Rofi(window)", group = "user apps"}),

    awful.key({ modkey }, "space", function () awful.util.spawn("rofi -show drun") end, -- 
              {description = "launch Rofi(drun)", group = "user apps"}),

    awful.key({ modkey }, "v", function () awful.spawn("code") end,
              {description = "launch Visual Studio Code", group = "user apps"}),

    awful.key({ modkey }, "g", function () awful.spawn("/home/stanzu10/Setup/AppImages/Goneovim-0.4.9-linux/goneovim") end,
              {description = "launch Goneovim", group = "user apps"}),

    awful.key({ modkey }, "r", function () awful.spawn("rider") end,
              {description = "launch Rider", group = "user apps"}),
    
    awful.key({ modkey }, "e", function () awful.spawn("emacs") end,
              {description = "launch Doom Emacs", group = "user apps"}),

    awful.key({ modkey }, "s", function () awful.spawn("slack") end,
              {description = "launch Slack", group = "user apps"}),
    
    awful.key({ modkey }, "z", function () awful.spawn("zoom") end,
              {description = "launch Zoom", group = "user apps"}),
    
    awful.key({ modkey }, "b", function () awful.spawn("brave-browser") end,
              { description = "launch Brave", group = "user apps"}),

    awful.key({ modkey }, "t", function () awful.spawn("tidal-hifi") end,
              {description = "launch Tidal Client", group = "user apps"}),

    awful.key({ modkey }, "m", function () awful.spawn("gnome-terminal -e mocp") end,
              {description = "launch MOC(gnome-terminal)", group = "user apps"}),

    awful.key({ modkey, "Control" }, "m", function () os.execute("mocp -x") end,
              {description = "kill MOC server", group = "user apps"}),

    awful.key({ modkey }, "p", function () awful.spawn("pcmanfm") end,
              {description = "launch Pcmanfm", group = "user apps"}),

    awful.key({ modkey }, "Print", function () awful.spawn("gnome-screenshot -a") end,
              {description = "Screenshot(area)", group = "user apps"}),

    awful.key({ modkey, "Control" }, "Print", function () awful.spawn("gnome-screenshot -i") end,
              {description = "Screenshot(interactive)", group = "user apps"})
)    

clientkeys = my_table.join(
    awful.key({ altkey, "Control"   }, "m",      lain.util.magnify_client,
              {description = "magnify client", group = "client"}),

    awful.key({ altkey }, "F12",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        {description = "toggle fullscreen", group = "client"}),

    awful.key({ altkey }, "BackSpace",      function (c) c:kill()                         end,
              {description = "close", group = "client"}),

    awful.key({ modkey, altkey, "Control" }, "space",  awful.client.floating.toggle                     ,
              {description = "toggle floating", group = "client"}),

    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end,
              {description = "move to master", group = "client"}),

    awful.key({ altkey, "Control" }, "o",      function (c) c:move_to_screen()               end,
              {description = "move to screen", group = "client"}),

    awful.key({ altkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end ,
        {description = "minimize", group = "client"}),

    awful.key({ modkey,           }, "=",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end ,
        {description = "maximize", group = "client"})
)

-- bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    -- Hack to only show tags 1 and 9 in the shortcut window (mod+s)
    local descr_view, descr_toggle, descr_move, descr_toggle_focus, descr_move_and_focus
    if i == 1 or i == 9 then
        descr_view = {description = "view tag #", group = "tag"}
        descr_move = {description = "move focused client to tag #", group = "tag"}
        descr_move_and_focus = {description = "move focused client to tag # and view", group = "tag"}
    end
    globalkeys = my_table.join(globalkeys,
        -- View tag only.
        awful.key({ altkey }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  descr_view),
        -- Move client to tag.
        awful.key({ altkey, "Control" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  descr_move),
        -- Move Client to tag and view
        awful.key({ modkey, altkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         client.focus:move_to_tag(tag)
                         tag:view_only()
                      end
                  end,
                  descr_move_and_focus)
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),

    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),

    awful.button({ altkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)

awful.button({ modkey }, 1,
    function (c)
         c.maximized_horizontal = false
         c.maximized_vertical   = false
         c.maximized            = false
         c.fullscreen           = false
         awful.mouse.client.move(c)
    end)

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     screen = awful.screen.preferred,
                     awful.client.setslave,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen+awful.placement.right,
                     size_hints_honor = false
                   }
    },
    
-- find the wm instance with : xprop WM_CLASS

-- Titlebars
    { rule_any = { type = { "dialog", "normal" } },
      properties = { titlebars_enabled = false } },

-- Floating windows
    { rule = { floating = true },
      properties = { ontop = true, x = 600, y = 300 } },

-- gnome-calculator
    { rule = { instance = "gnome-calculator" },
     properties = { floating = true, ontop = true } },

-- gnome-calculator
    { rule = { instance = "screenrec" },
     properties = { floating = true, ontop = false } },

-- kcolorchooser
    { rule = { instance = "kcolorchooser" },
     properties = { floating = true, ontop = true } },

-- eog
    { rule = { instance = "eog" },
     properties = { floating = true, ontop = true } },

-- pavumanager         
    { rule = { instance = "pavucontrol" },
      properties = { screen = 1, tag = awful.util.tagnames[7], switchtotag = true  } },

-- tidal         
    { rule = { instance = "tidal-hifi" },
      properties = { screen = 1, tag = awful.util.tagnames[6], switchtotag = true  } },

-- soundcloud(qutebrowser)         
    { rule = { instance = "qutebrowser" },
      properties = { screen = 1, tag = awful.util.tagnames[6], switchtotag = true  } },

-- mocp         
    { rule = { instance = "gnome-terminal-server" },
      properties = { screen = 1, tag = awful.util.tagnames[6], switchtotag = true  } },

-- slack         
    { rule = { instance = "slack" },
      properties = { tag = awful.util.tagnames[4], switchtotag = true  } },

-- zoom         
    { rule = { instance = "zoom" },
      properties = { tag = awful.util.tagnames[5], switchtotag = true  } },

-- brave         
    { rule = { instance = "brave-browser" },
      properties = { tag = awful.util.tagnames[3], switchtotag = true  } },

-- vscode         
    { rule = { instance = "code" },
      properties = { tag = awful.util.tagnames[2], switchtotag = true  } },

-- goneovim         
    { rule = { instance = "goneovim" },
      properties = { tag = awful.util.tagnames[2], switchtotag = true  } },

-- rider         
    { rule = { instance = "rider" },
      properties = { tag = awful.util.tagnames[2], switchtotag = true  } },

-- blueman-manager          
    { rule = { instance = "blueman-manager" },
      properties = { screen = 1, tag = awful.util.tagnames[7], switchtotag = true } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup and
      not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)
    -- Custom
    if beautiful.titlebar_fun then
        beautiful.titlebar_fun(c)
        return
    end

    -- Default
    -- buttons for the titlebar
    local buttons = my_table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 2, function() c:kill() end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c, {size = dpi(14), position = "bottom"}) : setup {
        { -- Left
--            buttons = buttons,
            nil,
            layout  = wibox.layout.fixed.horizontal
        },
        { -- Middle
--            { -- Title
--                align  = "center",
--                widget = awful.titlebar.widget.titlewidget(c)
--            },
--            buttons = buttons,
            nil,
            layout  = wibox.layout.flex.horizontal
        },
        { -- Right
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.maximizedbutton(c),
            --awful.titlebar.widget.stickybutton   (c),
            --awful.titlebar.widget.ontopbutton    (c),
            --awful.titlebar.widget.closebutton    (c),
            awful.titlebar.widget.iconwidget(c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)

--Autostart
awful.spawn.with_shell(terminal)
awful.spawn.with_shell("compton --config ~/.config/compton/compton.conf")
awful.spawn.with_shell("libinput-gestures")
awful.spawn.with_shell("setxkbmap -option caps:swapescape")
awful.spawn.with_shell("blueman-applet")
awful.spawn.with_shell("nm-applet")
APWTimer = timer({ timeout = 5 }) -- set update interval in s
APWTimer:connect_signal("timeout", APW.Update)
APWTimer:start()
