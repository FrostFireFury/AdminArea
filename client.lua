local adminBlip = nil
local adminArea = nil

RegisterNetEvent("CreateAdminBlip")
AddEventHandler("CreateAdminBlip", function(x, y, z)
    adminBlip = AddBlipForCoord(x, y, z)
    SetBlipColour(adminBlip, 1)
    SetBlipAlpha(adminBlip, 255)
    SetBlipScale(adminBlip, 0.8)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Staff Area")
    EndTextCommandSetBlipName(adminBlip)

    adminArea = AddBlipForRadius(x, y, z, 50.0)
    SetBlipColour(adminArea, 1)
    SetBlipAlpha(adminArea, 100)
end)

RegisterNetEvent("RemoveAdminBlip")
AddEventHandler("RemoveAdminBlip", function()
    if adminBlip ~= nil then
        RemoveBlip(adminBlip)
        adminBlip = nil
    end

    if adminArea ~= nil then
        RemoveBlip(adminArea)
        adminArea = nil
    end
end)

RegisterCommand("setada", function(source, args, rawCommand)
    local password = args[1] 
    if password == "PUTYOURPASSWORDHERE" then
        local playerCoords = GetEntityCoords(PlayerPedId())
        TriggerServerEvent("SetAdminBlip", playerCoords.x, playerCoords.y, playerCoords.z)
    else
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"Error", "Incorrect password."}
        })
    end
end, false)

RegisterCommand("remada", function(source, args, rawCommand)
    local password = args[1] 
    if password == "PUTYOURPASSWORDHERE" then
        TriggerServerEvent("RemoveAdminBlip")
    else
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"Error", "Incorrect password."}
        })
    end
end, false)
