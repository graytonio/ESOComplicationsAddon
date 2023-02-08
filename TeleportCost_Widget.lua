local BAG_ICON = "|t16:16:/esoui/art/tooltips/icon_bag.dds|t "
ESOComplications_TeleportCostWidget = {
    Name = "ESOC_TeleportCostWidget"
}

local function InitEvents()
    EVENT_MANAGER:RegisterForUpdate(ESOComplications_TeleportCostWidget.Name, 5000, ESOComplications_TeleportCostWidget.OnUpdate)
end

local function InitUI()
    ESOComplications_TeleportCostWidget.Widget = WINDOW_MANAGER:CreateControl("ESOC_TeleportCost", ZO_PerformanceMeters, CT_LABEL)
    ESOComplications_TeleportCostWidget.Widget:SetDimensions(75, 40)
    ESOComplications_TeleportCostWidget.Widget:ClearAnchors()
    ESOComplications_TeleportCostWidget.Widget:SetAnchor(LEFT, ESOC_BagSpace, RIGHT, -10, 0)
    ESOComplications_TeleportCostWidget.Widget:SetFont("ZoFontWinT2")
    ESOComplications_TeleportCostWidget.Widget:SetColor(1, 1, 1, 1)
    ESOComplications_TeleportCostWidget.Widget:SetHorizontalAlignment(0)
    ESOComplications_TeleportCostWidget.Widget:SetVerticalAlignment(1)
    ESOComplications_TeleportCostWidget.Widget:SetHidden(false)
end

function ESOComplications_TeleportCostWidget.OnUpdate()
    local cost = GetRecallCost(382)
    ESOComplications_TeleportCostWidget.Widget:SetText(BAG_ICON .. "|cFFFFFF" .. cost .. "|r")
end

function ESOComplications_TeleportCostWidget.Initialize()
    InitUI()
    InitEvents()
    ESOComplications_TeleportCostWidget.OnUpdate()
end

ESOComplications.RegisterWidget("ESOC_TeleportCostWidget", ESOComplications_TeleportCostWidget.Initialize)
