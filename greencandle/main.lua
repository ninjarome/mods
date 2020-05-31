--Mod: GreenCandle, Version 1
local GreenCandle = RegisterMod("GreenCandle", 1)


GreenCandle.COLLECTIBLE_GREEN_CANDLE = Isaac.GetItemIdByName("Green Candle")

--
function GreenCandle:onUpdate()
    -- Beginning of run initialization
    if Game():GetFrameCount() == 1 then
        GreenCandle.HasGreenCandle = false
        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, GreenCandle.COLLECTIBLE_GREEN_CANDLE, Vector(320,300), Vector(0,0), nil)
    end

    -- Check for amount of players
    for playerNum = 1, Game():GetNumPlayers() do
        local player = Game():GetPlayer(playerNum)
        --Check if player has Green Candle
        if player:HasCollectible(GreenCandle.COLLECTIBLE_GREEN_CANDLE) then
            if not GreenCandle.HasGreenCandle then --Initial pickup
                player:AddSoulHearts(2)
                GreenCandle.HasGreenCandle = true
            end
            if not GrennCandle.HasGreenCandle then
            --Check if there are enemies
            for i, entity in pairs(Isaac.GetRoomEntities()) do --Ongoing
                --random can be changed to luck stat
                if entity:IsVulnerableEnemy() and math.random(500) < 3 then
                    entity:AddPoison(EntityRef(player), 100, 3.5)
                end
            end
        end
    end
end

Isaac.DebugString("Hello world!")
--method is called after game uptades
GreenCandle:AddCallback(ModCallbacks.MC_POST_UPDATE, GreenCandle.onUpdate)