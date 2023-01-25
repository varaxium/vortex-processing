local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

CreateThread(function()
  QBCore.Functions.LoadModel(Config.PedHash)
  local MethPed = CreatePed(0, Config.PedHash, Config.PedPos.x, Config.PedPos.y, Config.PedPos.z-1.0, Config.PedPos.w, false, false)
TaskStartScenarioInPlace(MethPed, 'WORLD_HUMAN_SMOKING_POT', true)
FreezeEntityPosition(MethPed, true)
SetEntityInvincible(MethPed, true)
SetBlockingOfNonTemporaryEvents(MethPed, true)

  exports['qb-target']:AddTargetEntity(MethPed, {
      options = {
          {
              type = "client",
              event = "vortex-processing:client:CheckMethPackage",
              icon = "fas fa-box",
              label = "You Got That Blue Stuff?",
          },
      },
      distance = 1.5
  })
end)

RegisterNetEvent('vortex-processing:client:CheckMethPackage')
AddEventHandler('vortex-processing:client:CheckMethPackage', function()
  local Player = QBCore.Functions.GetPlayerData()
  if QBCore.Functions.HasItem(Config.StartItem, Config.StartItemAmount) then
      TriggerEvent('vortex-processing:client:StartMethPackage')
    else
      QBCore.Functions.Notify('You Dont Have Any Blue Shit', 'error', 5000)
    end
end)

RegisterNetEvent('vortex-processing:client:StartMethPackage', function()
  TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 5000, false)
  QBCore.Functions.Progressbar('package_meth', 'Packing Meth', 7000, false, true, {
      disableMovement = true,
      disableCarMovement = false,
      disableMouse = false,
      disableCombat = true,
  }, {}, {}, {}, function()
    ClearPedTasks(PlayerPedId())
    TriggerServerEvent('vortex-processing:server:reward')
  end)
end)
