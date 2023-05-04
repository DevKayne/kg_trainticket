-- Server File --
-- Version 1.0 --
local QBCore = exports["qb-core"]:GetCoreObject()

-- Check Balance Event -- 
QBCore.Functions.CreateCallback("qb-trainticket:CheckBalance", function(source, cb, args)
    Player = QBCore.Functions.GetPlayer(source)
    Balance = Player.Functions.GetMoney('cash')
    HasEnough = false 

    if not Player then return end 

    if Balance > Config.TicketPrice - 1 then 
        HasEnough = true 
    else 
        HasEnough = false 
    end
    
    cb(HasEnough)
end)

-- Purchase Ticket Event -- 
RegisterNetEvent('qb-trainticket:PurchaseTicket', function(source)

    if not Player then return end 

    Player.Functions.AddItem("train_ticket", 1)
    Player.Functions.RemoveMoney("cash", Config.TicketPrice)
end)
