local radar = false
local sleep = 650

Citizen.CreateThread(function()
	Citizen.Wait(200)

	while true do
		local ped = PlayerPedId()
		
		if Config.RadarType == 0 then
			SetMinimapType(0)
			sleep = 15000
			Wait(10000)
		elseif not IsPedOnMount(ped) and not IsPedInAnyVehicle(ped) and not radar and Config.DisableRadarOnFoot then
			radar = true
			SetMinimapType(0)
			sleep = 850
		elseif not IsPedOnMount(ped) and not IsPedInAnyVehicle(ped) and not radar and not Config.DisableRadarOnFoot then
			radar = true
			SetMinimapType(Config.RadarType)
			sleep = 2000
		elseif IsPedOnMount(ped) or IsPedInAnyVehicle(ped) and radar then
			radar = false
			SetMinimapType(Config.RadarType)
			sleep = 750
		end

		Wait(sleep)
	end
end)
