--[[

     Multicolor Awesome WM theme 2.0
     github.com/lcpz

--]]

local hostname = os.getenv("MYHOSTNAME")

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local beautiful     = require("beautiful") -- Awesome theme module
local dpi   = require("beautiful.xresources").apply_dpi

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.confdir                                   = os.getenv("HOME") .. "/.config/awesome/themes/multicolor"
-- theme.wallpaper                                 = os.getenv("HOME") .. "/.config/awesome/wallpapers/4K-Ultra-HD-Nature-Mountains-Wallpapers-3840X2160-18.jpg"
theme.wallpaper                                 = os.getenv("HOME") .. "/.config/awesome/wallpapers/wallpaper.jpg"
-- theme.font                                      = "Terminus 8"
-- theme.font                                      = "Noto Sans Regular 11"
-- theme.taglist_font                              = "Noto Sans Regular 13"
if hostname == "ubuntu-awesome" then
    theme.font                                      = "JetBrainsMono Nerd Font 11"
    theme.taglist_font                              = "JetBrainsMono Nerd Font 12"
elseif hostname == 'feng-archlinux' then
    theme.font                                      = "JetBrainsMono Nerd Font 12"
    theme.taglist_font                              = "JetBrainsMono Nerd Font 14"
else
    theme.font                                      = "JetBrainsMono Nerd Font 12"
    theme.taglist_font                              = "JetBrainsMono Nerd Font 16"
end
theme.menu_bg_normal                            = "#000000"
theme.menu_bg_focus                             = "#000000"
theme.bg_normal                                 = "#000000"
theme.bg_focus                                  = "#000000"
theme.bg_urgent                                 = "#000000"
theme.fg_normal                                 = "#aaaaaa"
theme.fg_focus                                  = "#ff8c00"
theme.fg_urgent                                 = "#af1d18"
theme.fg_minimize                               = "#ffffff"
-- theme.border_width                              = dpi(1)
theme.border_width                              = dpi(2)
theme.border_normal                             = "#1c2022"
-- theme.border_focus                              = "#606060"
-- theme.border_focus                              = "#5e81ac"
-- theme.border_focus                              = "#ff0000"
theme.border_focus                              = "#ff7f50"
theme.border_marked                             = "#3ca4d8"
theme.menu_border_width                         = 0
-- theme.menu_width                                = dpi(130)
theme.menu_width                                = dpi(260)
theme.menu_height                               = dpi(25)
theme.menu_submenu_icon                         = theme.confdir .. "/icons/submenu.png"
theme.menu_fg_normal                            = "#aaaaaa"
theme.menu_fg_focus                             = "#ff8c00"
theme.menu_bg_normal                            = "#050505dd"
theme.menu_bg_focus                             = "#050505dd"
theme.widget_temp                               = theme.confdir .. "/icons/temp.png"
theme.widget_uptime                             = theme.confdir .. "/icons/ac.png"
theme.widget_cpu                                = theme.confdir .. "/icons/cpu.png"
theme.widget_weather                            = theme.confdir .. "/icons/dish.png"
theme.widget_fs                                 = theme.confdir .. "/icons/fs.png"
theme.widget_mem                                = theme.confdir .. "/icons/mem.png"
theme.widget_note                               = theme.confdir .. "/icons/note.png"
theme.widget_note_on                            = theme.confdir .. "/icons/note_on.png"
theme.widget_netdown                            = theme.confdir .. "/icons/net_down.png"
theme.widget_netup                              = theme.confdir .. "/icons/net_up.png"
theme.widget_mail                               = theme.confdir .. "/icons/mail.png"
theme.widget_batt                               = theme.confdir .. "/icons/bat.png"
theme.widget_clock                              = theme.confdir .. "/icons/clock.png"
theme.widget_vol                                = theme.confdir .. "/icons/spkr.png"
-- taglist_bg_focus 必须与底下 s.mywibox 的 bg 相同，否则有色差
theme.taglist_bg_focus = "#262626"
theme.taglist_squares_sel                       = theme.confdir .. "/icons/square_a.png"
theme.taglist_squares_unsel                     = theme.confdir .. "/icons/square_b.png"
-- https://awesomewm.org/apidoc/widgets/awful.widget.tasklist.html
theme.tasklist_plain_task_name                  = false
theme.tasklist_disable_icon                     = false
-- theme.tasklist_disable_task_name                = true
-- theme.useless_gap                            = 0
theme.useless_gap                               = 5
theme.layout_tile                               = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps                           = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft                           = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.confdir .. "/icons/dwindle.png"
theme.layout_max                                = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.confdir .. "/icons/floating.png"
theme.titlebar_close_button_normal              = theme.confdir .. "/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.confdir .. "/icons/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.confdir .. "/icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.confdir .. "/icons/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.confdir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.confdir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.confdir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.confdir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.confdir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.confdir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.confdir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.confdir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.confdir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.confdir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.confdir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.confdir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.confdir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.confdir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.confdir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.confdir .. "/icons/titlebar/maximized_focus_active.png"

-- Hotkeys popup
theme.hotkeys_bg = '#37395E'
theme.hotkeys_fg = '#ECBDF6'
theme.hotkeys_opacity = '0.9'
theme.hotkeys_border_width = 3
theme.hotkeys_border_color = '#48FFDC'
theme.hotkeys_modifiers_fg = '#1DFF79'
theme.hotkeys_label_fg = '#1B1D27'
-- theme.hotkeys_font = 'Iosevka 10'
-- theme.hotkeys_font = "Noto Sans Regular 10"
-- theme.hotkeys_description_font = 'Fira Code 10'
-- theme.hotkeys_description_font = 'Iosevka 10'
if hostname == 'ubuntu-awesome' or hostname == 'feng-archlinux' then
    theme.hotkeys_font = 'JetBrainsMono Nerd Font 11'
    theme.hotkeys_description_font = 'JetBrainsMono Nerd Font 11'
else
    theme.hotkeys_font = 'JetBrainsMono Nerd Font 11'
    theme.hotkeys_description_font = 'JetBrainsMono Nerd Font 11'
end
theme.hotkeys_group_margin = 20

local markup = lain.util.markup

-- Textclock
os.setlocale(os.getenv("LANG")) -- to localize the clock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
-- local mytextclock = wibox.widget.textclock(markup("#7788af", "%A %d %B ") .. markup("#ab7367", ">") .. markup("#de5e1e", " %H:%M "))
-- local mytextclock = wibox.widget.textclock(markup("#7788af", "%A %d %B ") .. markup("#535f7a", ">") .. markup("#de5e1e", " %H:%M "))
local mytextclock = wibox.widget.textclock(markup("#de5e1e", "%H:%M "))
mytextclock.font = theme.font

local function calender_font()
    if hostname == 'ubuntu-awesome' or hostname == 'feng-archlinux' then
        return "JetBrainsMono Nerd Font 11"
    else
        return "JetBrainsMono Nerd Font 12"
    end
end
-- Calendar
theme.cal = lain.widget.cal({
    attach_to = { mytextclock },
    notification_preset = {
        -- font = "Terminus 10",
        -- font = "Noto Sans Mono Medium 10",
        font = calender_font(),
        fg   = theme.fg_normal,
        bg   = theme.bg_normal
    }
})

-- Weather
local weathericon = wibox.widget.imagebox(theme.widget_weather)
theme.weather = lain.widget.weather({
    APPID='6ceb7234f8f23be627eaea880ce52f8',
    city_id = 1790630,
    notification_preset = { font = "Terminus 10", fg = theme.fg_normal },
    weather_na_markup = markup.fontfg(theme.font, "#eca4c4", "N/A "),
    settings = function()
        descr = weather_now["weather"][1]["description"]:lower()
        units = math.floor(weather_now["main"]["temp"])
        widget:set_markup(markup.fontfg(theme.font, "#eca4c4", descr .. " @ " .. units .. "°C "))
    end
})

-- / fs
-- commented because it needs Gio/Glib >= 2.54
local fsicon = wibox.widget.imagebox(theme.widget_fs)
theme.fs = lain.widget.fs({
    -- notification_preset = { font = "Terminus 10", fg = theme.fg_normal },
    notification_preset = { font = "JetBrainsMono Nerd Font 12", fg = theme.fg_normal },
    settings  = function()
        widget:set_markup(markup.fontfg(theme.font, "#80d9d8", string.format("%.1f", fs_now["/"].used) .. "% "))
    end
})

-- Mail IMAP check
--[[ to be set before use
local mailicon = wibox.widget.imagebox()
theme.mail = lain.widget.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "keyring get mail",
    settings = function()
        if mailcount > 0 then
            mailicon:set_image(theme.widget_mail)
            widget:set_markup(markup.fontfg(theme.font, "#cccccc", mailcount .. " "))
        else
            widget:set_text("")
            --mailicon:set_image() -- not working in 4.0
            mailicon._private.image = nil
            mailicon:emit_signal("widget::redraw_needed")
            mailicon:emit_signal("widget::layout_changed")
        end
    end
})
--]]

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#e33a6e", cpu_now.usage .. "% "))
    end
})

-- local cpu_widget = require("awesome-wm-widgets.cpu-widget.cpu-widget")
-- local cpu2 = cpu_widget({
--         width = 70,
--         step_width = 2,
--         step_spacing = 0,
--         color = '#434c5e'
-- })

-- local logout_menu_widget = require("awesome-wm-widgets.logout-menu-widget.logout-menu")
-- local logout = logout_menu_widget{
--     font = theme.font,
--     onlock = function() awful.spawn.with_shell('i3lock-fancy') end
-- }

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#f1af5f", coretemp_now .. "°C "))
    end
})
local function coretempicon()
    if hostname ~= "ubuntu-awesome" and hostname ~= "feng-archlinux" then
        return tempicon
    end
end
local function coretemp()
    if hostname ~= "ubuntu-awesome" and hostname ~= "feng-archlinux" then
        return temp
    end
end


-- Battery
local baticon = wibox.widget.imagebox(theme.widget_batt)
local bat = lain.widget.bat({
    settings = function()
        local perc = bat_now.perc ~= "N/A" and bat_now.perc .. "%" or bat_now.perc

        if bat_now.ac_status == 1 then
            perc = perc .. " plug"
        end

        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, perc .. " "))
    end
})
local function battery()
    if hostname ~= "ubuntu-awesome" then
        return volicon
    end
end

-- ALSA volume
local volicon = wibox.widget.imagebox(theme.widget_vol)
theme.volume = lain.widget.alsa({
    settings = function()
        if volume_now.status == "off" then
            volume_now.level = volume_now.level .. "M"
        end

        widget:set_markup(markup.fontfg(theme.font, "#7493d2", volume_now.level .. "% "))
    end
})
local function alsavolume()
    if hostname ~= "ubuntu-awesome" then
        return volicon
    end
end

local function net_device()
    if hostname == "ubuntu-awesome" then
        return "eth0"
    end
end

-- Net
local netdownicon = wibox.widget.imagebox(theme.widget_netdown)
local netdowninfo = wibox.widget.textbox()
local netupicon = wibox.widget.imagebox(theme.widget_netup)
local netupinfo = lain.widget.net({
    iface = net_device(),
    settings = function()
        --[[ uncomment if using the weather widget
        if iface ~= "network off" and
           string.match(theme.weather.widget.text, "N/A")
        then
            theme.weather.update()
        end
        --]]

        widget:set_markup(markup.fontfg(theme.font, "#e54c62", net_now.sent .. " "))
        netdowninfo:set_markup(markup.fontfg(theme.font, "#87af5f", net_now.received .. " "))
    end
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local memory = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#e0da37", mem_now.used .. "M "))
    end
})

-- MPD
local mpdicon = wibox.widget.imagebox()
theme.mpd = lain.widget.mpd({
    settings = function()
        mpd_notification_preset = {
            text = string.format("%s [%s] - %s\n%s", mpd_now.artist,
                   mpd_now.album, mpd_now.date, mpd_now.title)
        }

        if mpd_now.state == "play" then
            artist = mpd_now.artist .. " > "
            title  = mpd_now.title .. " "
            mpdicon:set_image(theme.widget_note_on)
        elseif mpd_now.state == "pause" then
            artist = "mpd "
            title  = "paused "
        else
            artist = ""
            title  = ""
            --mpdicon:set_image() -- not working in 4.0
            mpdicon._private.image = nil
            mpdicon:emit_signal("widget::redraw_needed")
            mpdicon:emit_signal("widget::layout_changed")
        end
        widget:set_markup(markup.fontfg(theme.font, "#e54c62", artist) .. markup.fontfg(theme.font, "#b2b2b2", title))
    end
})

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts)

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    -- s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)
    s.mytasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = awful.util.tasklist_buttons,
        style = {
            icon_size = 20,
        }
    }

    -- Create a tasklist widget
    -- holo
    -- s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons, { bg_focus = theme.bg_focus, shape = gears.shape.rectangle, shape_border_width = 5, shape_border_color = theme.tasklist_bg_normal, align = "center" })

    beautiful.tasklist_bg_normal = "#ffffff00"
    beautiful.tasklist_bg_focus = "#ffffff00"
    -- beautiful.tasklist_bg_focus = "#708090"
    -- beautiful.tasklist_bg_focus = "#ffe4e1"
    if hostname == 'ubuntu-awesome' then
        beautiful.tasklist_font = "JetBrainsMono Nerd Font 11"
    elseif hostname == 'feng-archlinux' then
        beautiful.tasklist_font = "JetBrainsMono Nerd Font 12"
    else
        beautiful.tasklist_font = "JetBrainsMono Nerd Font 12"
    end

    -- Create the wibox
    -- s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(22), bg = theme.bg_normal, fg = theme.fg_normal })
    if hostname == 'feng-archlinux' then
        s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(22), bg = "#262626", fg = theme.fg_normal })
    else
        s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(22), bg = "#262626", fg = theme.fg_normal })
    end

    local myspace = wibox.widget.textbox()
    -- myspace:set_markup(markup.fontfg(theme.font, "#87af5f", "  "))
    myspace:set_markup_silently("  ")


    local myspace2 = wibox.widget.textbox()
    myspace2:set_markup_silently(" ")
    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            -- s.mylayoutbox,
            s.mytaglist,
            s.mypromptbox,
            mpdicon,
            theme.mpd.widget,
        },
        -- s.mytasklist, -- Middle widget
        nil,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            -- myspace,
            wibox.widget.systray(),
            --mailicon,
            --theme.mail.widget,
            netdownicon,
            netdowninfo,
            netupicon,
            netupinfo.widget,
            -- volicon,
            alsavolume(),
            theme.volume.widget,
            memicon,
            memory.widget,
            cpuicon,
            cpu.widget,
            -- cpu2,
            fsicon,
            theme.fs.widget,
            -- weathericon,
            -- theme.weather.widget,
            coretempicon(),
            coretemp(),
            -- tempicon,
            -- temp.widget,
            baticon,
            bat.widget,
            clockicon,
            mytextclock,
            -- logout,
            -- myspace2,
            -- s.mylayoutbox,
        },
    }

    -- Create the bottom wibox
    -- s.mybottomwibox = awful.wibar({ position = "bottom", screen = s, border_width = 0, height = dpi(20), bg = theme.bg_normal, fg = theme.fg_normal })
    -- s.mybottomwibox = awful.wibar({ position = "bottom", screen = s, border_width = 0, height = dpi(21), bg = "#ffffff00", fg = theme.fg_normal })
    if hostname == 'feng-archlinux' then
        s.mybottomwibox = awful.wibar({ position = "bottom", screen = s, border_width = 0, height = dpi(21), bg = "#262626", fg = theme.fg_normal })
    else
        s.mybottomwibox = awful.wibar({ position = "bottom", screen = s, border_width = 0, height = dpi(21), bg = "#262626", fg = theme.fg_normal })
    end

    -- Add widgets to the bottom wibox
    s.mybottomwibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
        },
        s.mytasklist, -- Middle widget
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            s.mylayoutbox,
        },
    }
end

return theme
