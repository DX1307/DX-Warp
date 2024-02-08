ESX = exports.es_extended:getSharedObject()

-- @ลูปวาป
CreateThread(function()
	while true do
		for k, v in pairs(Config.TeleportList) do
            local PlayerId  = PlayerPedId()
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerId), v.coords, true) < v.marker.distance then
                DrawMarker(v.marker.type, v.coords.x, v.coords.y, v.coords.z, 0, 0, 0, 0, 0, 0, v.marker.size.x, v.marker.size.y, v.marker.size.z, v.marker.color.r, v.marker.color.g, v.marker.color.b, 100, false, true, 2, false, false, false, false)
            end
		end
        Wait(7)
	end
end)


CreateThread(function()
	while true do
        local sleep = true
		Wait(12)
        local PlayerPed = GetPlayerPed(-1)
		for k, v in pairs(Config.TeleportList) do
			if GetDistanceBetweenCoords(GetEntityCoords(PlayerId), v.coords, true) < 2.0 then
                sleep = false
                DrawText3Ds(v.coords.x, v.coords.y, v.coords.z + Config.HighText, '<font face="'.. Config.Fonts ..'">'.. v.title ..'</font>')
                if IsControlJustReleased(0, 38) then
                    if not IsPedInAnyVehicle(PlayerPed, true) and not v.enableVehicle then
                        ESX.TriggerServerCallback("DX-Warp:Bypass", function(result)
                            if result then
                                Teleport(v)
                            end
                        end, v)
                    else
                        Config.Notification('แจ้งเตือน', 'ไม่อนุญาติให้นำรถไป', 5000, 'error')
                    end
                end
            end
		end
        if sleep then
            Wait(100)
        end
	end
end)

-- @ฟังชั่นวาป
function Teleport(data)
    local PlayerPed = GetPlayerPed(-1)
    FreezeEntityPosition(PlayerPed, true)
    SetEntityCoords(PlayerPed, data.gotocoords)
    TriggerEvent("mythic_progbar:client:progress", {
        name = "unique_action_name",
        duration = data.time * 1000,
        label = data.progress,
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        }, function(status)
        if not status then
            -- @เมื่อโหลดเสร็จ
            FreezeEntityPosition(PlayerPed, false)
            Config.Notification('แจ้งเตือน', 'คุณมาถึงแล้ว', 5000, 'success')
        end
    end)
end

-- @แจ้งเตือนรับจาก Server
RegisterNetEvent('DX-Warp:Notification')
AddEventHandler('DX-Warp:Notification', function(title, text, time, type)
    Config.Notification(title, text, time, type)
end)

-- @Text3D
function DrawText3Ds(x,y,z, text)
	local onScreen, _x, _y = World3dToScreen2d(x,y,z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
  
	SetTextScale(0.5, 0.5)
	SetTextFont(0)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(1)
	SetTextColour(255, 255, 255, 255)
	SetTextOutline()
  
	AddTextComponentString(text)
	DrawText(_x, _y)
end
