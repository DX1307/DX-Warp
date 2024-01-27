ESX = exports.es_extended:getSharedObject()

ESX.RegisterServerCallback('DX-Warp:Bypass', function(source, cb, v)
    local xPlayer = ESX.GetPlayerFromId(source)
    if Config.NewESXVersion then
        getMoney = xPlayer.getAccount(v.bypassMoney.type).money
    else
        getMoney = xPlayer.getMoney()
    end
    local getItems = xPlayer.getInventoryItem(v.bypassItems.items)
    if v.bypassItems.enable then
        if getItems.count > 0 then
            if v.bypassItems.remove then xPlayer.removeInventoryItem(v.bypassItems.items, 1) end
            cb(true)
        else
            if v.bypassMoney.enable then
                if getMoney >= v.bypassMoney.amount then
                    if Config.NewESXVersion then
                        xPlayer.removeAccountMoney(v.bypassMoney.type, v.bypassMoney.amount)
                    else
                        xPlayer.removeMoney(v.bypassMoney.amount)
                    end
                    cb(true)
                else
                    local m = v.bypassMoney.amount - getMoney
                    TriggerClientEvent('DX-Warp:Notification', source, 'แจ้งเตือน', 'คุณมีเงินไม่เพียงพอต้องการอีก '.. m ..' บาท', 5000, 'error')
                    cb(false)
                end
            else
                cb(true)
            end
        end
    else
        if v.bypassMoney.enable then
            if getMoney >= v.bypassMoney.amount then
                if Config.NewESXVersion then
                    xPlayer.removeAccountMoney(v.bypassMoney.type, v.bypassMoney.amount)
                else
                    xPlayer.removeMoney(v.bypassMoney.amount)
                end
                cb(true)
            else
                local m = v.bypassMoney.amount - getMoney
                TriggerClientEvent('DX-Warp:Notification', source, 'แจ้งเตือน', 'คุณมีเงินไม่เพียงพอต้องการอีก '.. m ..' บาท', 5000, 'error')
                cb(false)
            end
        else
            cb(true)
        end
    end
end)