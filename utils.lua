local awful = require("awful")
local naughty = require("naughty")

local utils = {}

function utils.log(title, message, type)
    if type == nil then
        naughty.notify({title = title, message = string.format("%d", message), timeout = 2})
    else
        naughty.notify({title = title, message = message, timeout = 2})
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
    local geometry = mouse.screen.get_bounding_geometry()
    self.log("x", geometry.x)
    self.log("y", geometry.y)
    self.log("width", geometry.width)
    self.log("height", geometry.height)

    self.log("client.width", client.width)
    self.log("client.height", client.height)
end


return utils

