vRP = Proxy.getInterface("vRP")

-- I love memes.

local blips = {
	{title="Desguace", colour=1, id=380, x=-494.37762451172, y=-935.61315917969, z=23.964023590088}
}


Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 5)
      SetBlipScale(info.blip, 1)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

function DrawSpecialText(m_text, showtime)
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
				DrawMarker(31, -494.37762451172,-935.61315917969,24.964023590088, 0, 0, 0, 0, 0, 0, 4.0, 6.0, 4.0, 13, 122, 255, 155, 0, 0, 2, 0, 0, 0, 0)
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -494.37762451172,-935.61315917969,23.164023590088, true ) < 5 then
					DrawSpecialText("Pulsa [~g~E~s~] para desguazar un coche.")
				if IsControlJustPressed(1, 38) then
				  if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
					TriggerServerEvent('hypr9shit:desguazar')
				else
					TriggerEvent('hypr9shit:desguaceSinCoche')
				end
			end
		end
	end
end)

RegisterNetEvent('hypr9shit:desguazarCoche')
AddEventHandler('hypr9shit:desguazarCoche', function()
	vRP.notify({"~g~Estas desguazando el coche.. esto llevara un rato."})
	local jug = GetPlayerPed(-1)
	local veh = GetVehiclePedIsIn(jug, false)
	SetEntityAsMissionEntity(veh, true, true)
	Citizen.Trace("asignado vehiculo como entidad mision")
	SetVehicleUndriveable(veh, false)
	SetVehicleNumberPlateText(veh, "keklmao")
	SetVehicleIndicatorLights(veh, 1, true)
	SetVehicleIndicatorLights(veh, 0, true)
	Citizen.Wait(5000)
	SetVehicleDoorOpen(veh, 0, false)
	Citizen.Wait(10000)
	SetVehicleDoorOpen(veh, 1, false)
	Citizen.Wait(10000)
	SetVehicleDoorOpen(veh, 2, false)
	Citizen.Wait(10000)
	SetVehicleDoorOpen(veh, 3, false)
	Citizen.Wait(10000)
	SetVehicleDoorOpen(veh, 4, false)
	Citizen.Wait(10000)
	SetVehicleDoorOpen(veh, 5, false)
	Citizen.Wait(10000)
	DeleteVehicle(veh)
	TriggerServerEvent('hypr9shit:cobrarDesguace')
end)

RegisterNetEvent('hypr9shit:noPuedesDesguazar')
AddEventHandler('hypr9shit:noPuedesDesguazar', function()
	vRP.notify({"~r~No puedes desguazar vehículos."})
end)

RegisterNetEvent('hypr9shit:desguaceSinCoche')
AddEventHandler('hypr9shit:desguaceSinCoche', function()
	vRP.notify({"~r~Vuelve cuando tengas un coche."})
end)