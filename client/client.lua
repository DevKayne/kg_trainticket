-- Client File --
-- Version 1.0 -- 

-- Variables -- 
local QBCore = exports['qb-core']:GetCoreObject()

-- Buy Ticket Machines -- 
for _, TicketMachine in pairs(Config.BuyTicketLocations) do 
    exports['qb-target']:AddBoxZone('ticketmachines', TicketMachine.x, TicketMachine.y, TicketMachine.z, 1.0, 0.2, {
        name = "ticketmachines",
        heading = TicketMachine.w,
        debugPoly = false,
    }, {
        options = {
            {
                label = "Buy Ticket" .. "$ " .. Config.TicketPrice,
                icon = "fas fa-ticket",
                action = function(entity)
                    local Player = QBCore.Functions.GetPlayer(entity)
                    local Balance = Player.Functions.GetMoney('cash')
                    if not Player then return end
                    if Balance > Config.TicketPrice - 1 then 
                        TriggerEvent('qb-trainticket:PurchaseTicket')
                        Wait(100)
                        QBCore.Functions.Notify('You have purchased a Ticket', 'success', 7000)
                    else 
                        QBCore.Functions.Notify("You have insufficient funds for a Ticket", 'error', 7000)
                end,
            }
        },
        distance = 2.5,
    })
end 

-- Tag On/Off Machines --
for _, TagMachines in pairs(Config.MachineLocations) do 
    exports['qb-target']:AddBoxZone("tagmachines", TagMachines.x, TagMachines.y, TagMachines.z, 1.0, 0.2, {
        name = "tagmachines",
        heading = TagMachines.w,
        debugPoly = false,
    }, {
        options = {
            {
                label = "Tag On/Off",
                icon = "fas fa-train",
                item = "train_ticket",
                action = function()
                    local TaggedOn = false 

                    if TaggedOn == true then 
                        QBCore.Functions.Notify('You have Tagged Off!', 'success', 7000)
                    else 
                        QBCore.Functions.Notify('You have Tagged On', 'success', 7000)
                    end 
            }
        },
        distance = 2.5,
    })
end 