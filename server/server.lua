local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('vortex-processing:server:reward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(Config.StartItem, Config.StartItemAmount) then
        if Player.Functions.AddItem(Config.RewardItem, Config.RewardItemAmount) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.StartItem], "remove")
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RewardItem], "add")
            TriggerClientEvent('QBCore:Notify', src, 'You Just Made The 9s', 'success')
        else
            TriggerClientEvent('QBCore:Notify', src, 'Inventory is full', 'error')
        end
    end
end)





