local BAG_ICON = "|t16:16:/esoui/art/currency/gold_mipmap.dds|t "
ESOComplications_GoldWidget = {
    Name = "ESOC_GoldWidget",
    Width = 70,
    Order = 5
}

function ESOComplications_GoldWidget.InitEvents()
    EVENT_MANAGER:RegisterForEvent(ESOComplications_GoldWidget.Name, EVENT_LOOT_RECEIVED, ESOComplications_GoldWidget.OnUpdate)
    EVENT_MANAGER:RegisterForEvent(ESOComplications_GoldWidget.Name, EVENT_CLOSE_BANK, ESOComplications_GoldWidget.OnUpdate)
    EVENT_MANAGER:RegisterForEvent(ESOComplications_GoldWidget.Name, EVENT_CLOSE_GUILD_BANK, ESOComplications_GoldWidget.OnUpdate)
    EVENT_MANAGER:RegisterForEvent(ESOComplications_GoldWidget.Name, EVENT_CLOSE_STORE, ESOComplications_GoldWidget.OnUpdate)
    EVENT_MANAGER:RegisterForEvent(ESOComplications_GoldWidget.Name, EVENT_CLOSE_TRADING_HOUSE, ESOComplications_GoldWidget.OnUpdate)
    EVENT_MANAGER:RegisterForEvent(ESOComplications_GoldWidget.Name, EVENT_INVENTORY_ITEM_USED, ESOComplications_GoldWidget.OnUpdate)
end

function ESOComplications_GoldWidget.InitUI() 
    ESOComplications_GoldWidget.Widget = WINDOW_MANAGER:CreateControl(ESOComplications_GoldWidget.Name, ZO_PerformanceMeters, CT_LABEL)
    ESOComplications_GoldWidget.Widget:SetDimensions(ESOComplications_GoldWidget.Width, 40)
    ESOComplications_GoldWidget.Widget:SetFont("ZoFontWinT2")
    ESOComplications_GoldWidget.Widget:SetColor(1, 1, 1, 1)
    ESOComplications_GoldWidget.Widget:SetHorizontalAlignment(0)
    ESOComplications_GoldWidget.Widget:SetVerticalAlignment(1)
    ESOComplications_GoldWidget.Widget:SetHidden(false)
end

local function formattedCurrency(n)
    if n >= 10^6 then
        return string.format("%.2fm", n / 10^6)
    elseif n >= 10^3 then
        return string.format("%.2fk", n / 10^3)
    else
        return tostring(n)
    end
  end

function ESOComplications_GoldWidget.OnUpdate()
    local gold = GetCurrencyAmount(CURT_MONEY, CURRENCY_LOCATION_CHARACTER)
    ESOComplications_GoldWidget.Widget:SetText(BAG_ICON .. "|cFFFFFF" .. formattedCurrency(gold) .. "|r")
end

function ESOComplications_GoldWidget.Initialize()
    ESOComplications_GoldWidget.InitUI()
    ESOComplications_GoldWidget.InitEvents()
    ESOComplications_GoldWidget.OnUpdate()
   end

ESOComplications.RegisterWidget(ESOComplications_GoldWidget.Name, ESOComplications_GoldWidget)