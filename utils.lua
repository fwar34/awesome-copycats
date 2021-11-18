local awful = require("awful")

local utils = {}

local function client_status(client)
    local layout = awful.layout.get(mouse.screen)

    if (layout == awful.layout.suit.floating) or (client and client.floating) then
        return "floating"
    end

    if layout == awful.layout.suit.max then
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

return utils

