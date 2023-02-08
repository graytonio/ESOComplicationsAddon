local BAG_ICON = "|t16:16:/esoui/art/tooltips/icon_bag.dds|t "
ESOComplications_InventoryWidget = {
    Name = "ESOC_InventoryWidget",
}

local function InitEvents()
    EVENT_MANAGER:RegisterForEvent(ESOComplications_InventoryWidget.Name, EVENT_LOOT_RECEIVED, ESOComplications_InventoryWidget.OnUpdate)
    EVENT_MANAGER:RegisterForEvent(ESOComplications_InventoryWidget.Name, EVENT_CLOSE_BANK, ESOComplications_InventoryWidget.OnUpdate)
    EVENT_MANAGER:RegisterForEvent(ESOComplications_InventoryWidget.Name, EVENT_CLOSE_GUILD_BANK, ESOComplications_InventoryWidget.OnUpdate)
    EVENT_MANAGER:RegisterForEvent(ESOComplications_InventoryWidget.Name, EVENT_CLOSE_STORE, ESOComplications_InventoryWidget.OnUpdate)
    EVENT_MANAGER:RegisterForEvent(ESOComplications_InventoryWidget.Name, EVENT_CLOSE_TRADING_HOUSE, ESOComplications_InventoryWidget.OnUpdate)
    EVENT_MANAGER:RegisterForEvent(ESOComplications_InventoryWidget.Name, EVENT_INVENTORY_ITEM_USED, ESOComplications_InventoryWidget.OnUpdate)
end

local function InitUI() 
    ESOComplications_InventoryWidget.Widget = WINDOW_MANAGER:CreateControl("ESOC_BagSpace", ZO_PerformanceMeters, CT_LABEL)
    ESOComplications_InventoryWidget.Widget:SetDimensions(75, 40)
    ESOComplications_InventoryWidget.Widget:ClearAnchors()
    ESOComplications_InventoryWidget.Widget:SetAnchor(LEFT, ZO_PerformanceMetersLatencyMeter, RIGHT, -10, 0)
    ESOComplications_InventoryWidget.Widget:SetFont("ZoFontWinT2")
    ESOComplications_InventoryWidget.Widget:SetColor(1, 1, 1, 1)
    ESOComplications_InventoryWidget.Widget:SetHorizontalAlignment(0)
    ESOComplications_InventoryWidget.Widget:SetVerticalAlignment(1)
    ESOComplications_InventoryWidget.Widget:SetHidden(false)
end

function ESOComplications_InventoryWidget.OnUpdate()
    local used, available = GetNumBagUsedSlots(1), GetBagUseableSize(1)
    local color = (used > available - 5) and "|cCC2222" or "|cFFFFFF"
    ESOComplications_InventoryWidget.Widget:SetText(BAG_ICON .. color .. used .. "|cCCCCAA/" .. available .. "|r")
end

function ESOComplications_InventoryWidget.Initialize()
    InitUI()
    InitEvents()
    ESOComplications_InventoryWidget.OnUpdate()
   end

ESOComplications.RegisterWidget("ESOC_InventoryWidget", ESOComplications_InventoryWidget.Initialize)