local Crakhed = RegisterMod("Crakhed", 1)

function Crakhed:immortality(_Crakhed)
	local player = Isaac.GetPlayer(0)
	player:SetFullHearts()
	Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_LIL_BATTERY, 1, player.Position, player.Velocity, player)
end

Crakhed:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, Crakhed.immortality, EntityType.ENTITY_PLAYER)