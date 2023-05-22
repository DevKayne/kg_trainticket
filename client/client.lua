-- Client File --
-- Version 1.0 -- 

-- Variables -- 
local QBCore = exports['qb-core']:GetCoreObject()

-- Buy Ticket Machines -- 
-- Strawberry Lower Machine --
exports['qb-target']:AddBoxZone('ticketmachines', vector3(253.47, -1207.96, 29.29), 1.0, 0.2, {
        name = "ticketmachines",
        heading = 9.78,
        debugPoly = false,
    }, {
        options = {
            {
                label = "Buy Ticket" .. "$ " .. Config.TicketPrice,
                icon = "fas fa-ticket",
                action = function(entity)
                    --     CheckBalance()
                    --     TriggerEvent('qb-trainticket:PurchaseTicket')
                    --     Wait(100)
                    --     QBCore.Functions.Notify('You have purchased a Ticket', 'success', 7000)
                    -- else 
                    --     QBCore.Functions.Notify("You have insufficient funds for a Ticket", 'error', 7000)
                    -- end 
                    QBCore.Functions.TriggerCallback("qb-trainticket:CheckBalance", function(HasEnough)
                        if HasEnough then 
                           TriggerServerEvent('qb-trainticket:PurchaseTicket')
                        else 
                            QBCore.Functions.Notify("You have insufficient funds!", 'error', 5000)
                        end
                    end)
                end 
            },
        },
        distance = 2.5,
    })

-- Tag On/Off Machines --
-- Upper Strawberry --
    exports['qb-target']:AddBoxZone("tagmachines",vector3(299.22, -1203.12, 38.89), 1.0, 0.2, {
        name = "tagmachines",
        heading = 184.25,
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
                        TaggedOn = true 
                    end 
                end
            }
        },
        distance = 2.5,
    })
