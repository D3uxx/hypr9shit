local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_hypr9shit")

-- I love memes.

RegisterServerEvent('hypr9shit:desguazar')
AddEventHandler('hypr9shit:desguazar', function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	if vRP.hasGroup({user_id,'Police Officer'}) then
		TriggerClientEvent('hypr9shit:desguazarCoche', player)
		else
		TriggerClientEvent('hypr9shit:noPuedesDesguazar', player)
	end
end)

RegisterServerEvent('hypr9shit:cobrarDesguace')
AddEventHandler('hypr9shit:cobrarDesguace', function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	local dineritos = math.random(10000,100000)
	vRP.giveMoney({user_id,dineritos})
end)
