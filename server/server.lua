-- Purchase Ticket Event -- 
RegisterNetEvent('qb-trainticket:PurchaseTicket', function(data)
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then return end 

    Player.Functions.AddItem("train_ticket", 1)
    Player.Functions.RemoveMoney("cash", Config.TicketPrice)
end)