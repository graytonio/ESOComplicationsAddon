local BAG_ICON = "|t16:16:/esoui/art/tooltips/icon_bag.dds|t "
ESOComplications = {
    name = "ESOComplications",
    version = "0.0.1",
    settingName = "ESOComplications",
    settingDisplayName = "ESOComplications",
    author = "graytonio",
    Inited = false,
}

ESOComplications.Widgets = {}

function ESOComplications.RegisterWidget(name, widget)
    if not widget.Initialize then return end
    table.insert(ESOComplications.Widgets, widget)

    if ESOComplications.Inited then
        widget.Initialize()
        ESOComplications.OrderUIWidgets()
    end
end

function ESOComplications.OrderUIWidgets()
    local margin = 25
    local totalWidth = margin
    local gap = 2
    
    table.sort(ESOComplications.Widgets, function(a,b)
        return a.Order < b.Order
    end)

    for name, widget in pairs(ESOComplications.Widgets) do
        widget.Widget:ClearAnchors()
        widget.Widget:SetAnchor(LEFT, ZO_PerformanceMeters, LEFT, totalWidth, 0)
        totalWidth = totalWidth + widget.Width + gap
    end

    ZO_PerformanceMeters:ClearAnchors()
    ZO_PerformanceMeters:SetAnchor(BOTTOMLEFT, GuiRoot, BOTTOMLEFT, 0, 20)
    ZO_PerformanceMeters:SetDimensions(totalWidth + margin, 70)
end

function ESOComplications.LoadWidgets()
    if ESOComplications.Inited then
        return
    end

    ESOComplications.Inited = true
    for name, widget in pairs(ESOComplications.Widgets) do
        if widget.Initialize then
            widget.Initialize()
        end
    end
    ESOComplications.OrderUIWidgets()
end

function ESOComplications.OnAddOnLoaded(event, addonName)
    if addonName ~= ESOComplications.name then
        return
    end
    EVENT_MANAGER:UnregisterForEvent(ESOComplications.name, EVENT_ADD_ON_LOADED)
    
    ESOComplications.LoadWidgets()
    
end

EVENT_MANAGER:RegisterForEvent(ESOComplications.name, EVENT_ADD_ON_LOADED, ESOComplications.OnAddOnLoaded)

SLASH_COMMANDS["/rlesoc"] = ESOComplications.OrderUIWidgets
