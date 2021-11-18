local awful = require("awful")
local naughty = require("naughty")

local utils = {}

function utils.log(title, message, type)
    if type == nil then
        naughty.notify({title = title, message = string.format("%d", message), timeout = 5})
    else
        naughty.notify({title = title, message = message, timeout = 5})
    end
end

local function client_status(client)
    local layout = awful.layout.get(mouse.screen)
    if (layout == awful.layout.suit.floating) or (client and client.floating) then
        return "floating"
    elseif layout == awful.layout.suit.max then
        return "max"
    end
    return "other"
end

function utils.resize_client(direction, client)
    local floating_resize_factor = 10
    local master_resize_factor = 0.01
    local client_sts = client_status(client)

    if client_sts == "floating" then
        if direction == "up" then
            client:relative_move(0, floating_resize_factor, 0, -floating_resize_factor * 2)
        elseif direction == "down" then
            client:relative_move()
        end
    end
end

function utils:move_client_to_center(client)
    local screen_geometry = mouse.screen.get_bounding_geometry()
    -- self.log("x", screen_geometry.x)
    -- self.log("y", screen_geometry.y)
    -- self.log("width", screen_geometry.width)
    -- self.log("height", screen_geometry.height)
    local client_geometry = client.geometry(client)
    -- self.log("client.x", client_geometry.x)
    -- self.log("client.y", client_geometry.y)
    -- self.log("client.width", client.width)
    -- self.log("client.height", client.height)
    local client_sts = client_status(client)
    if client_sts ~= "floating" then
        client.floating = true
    end
    local width = screen_geometry.width * 0.75
    local height = screen_geometry.height * 0.95
    local x = (screen_geometry.width - width) / 2
    local y = 40
    client:relative_move(x - client_geometry.x, y - client_geometry.y, width - client_geometry.width, height - client_geometry.height)
end


return utils

