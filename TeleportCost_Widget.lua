local BAG_ICON = "|t24:24:/esoui/art/icons/poi/poi_wayshrine_complete.dds|t "
ESOComplications_TeleportCostWidget = {
    Name = "ESOC_TeleportCostWidget",
    Width = 60,
    Order = 3,
}

function ESOComplications_TeleportCostWidget.InitEvents()
    EVENT_MANAGER:RegisterForUpdate(ESOComplications_TeleportCostWidget.Name, 5000, ESOComplications_TeleportCostWidget.OnUpdate)
end

function ESOComplications_TeleportCostWidget.InitUI()
    ESOComplications_TeleportCostWidget.Widget = WINDOW_MANAGER:CreateControl(ESOComplications_TeleportCostWidget.Name, ZO_PerformanceMeters, CT_LABEL)
    ESOComplications_TeleportCostWidget.Widget:SetDimensions(ESOComplications_TeleportCostWidget.Width, 40)
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
    ESOComplications_TeleportCostWidget.InitUI()
    ESOComplications_TeleportCostWidget.InitEvents()
    ESOComplications_TeleportCostWidget.OnUpdate()
end

ESOComplications.RegisterWidget(ESOComplications_TeleportCostWidget.Name, ESOComplications_TeleportCostWidget)
