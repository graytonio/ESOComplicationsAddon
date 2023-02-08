local BAG_ICON = "|t16:16:/esoui/art/tooltips/icon_bag.dds|t "
ESOComplications = {
    name = "ESOComplications",
    version = "0.0.1",
    settingName = "ESOComplications",
    settingDisplayName = "ESOComplications",
    author = "graytonio"
}

ESOComplications.Widgets = {}

function ESOComplications.RegisterWidget(name, initfunc)
    if not initfunc or type(initfunc) ~= "function" then return end

    ESOComplications.Widgets[name] = initfunc
    initfunc()
end

local function InitUI()
    ZO_PerformanceMeters:SetWidth(220)
    ZO_PerformanceMetersFramerateMeter:ClearAnchors()
    ZO_PerformanceMetersFramerateMeter:SetAnchor(LEFT, ZO_PerformanceMeters, LEFT, 18, 0)
    ZO_PerformanceMetersLatencyMeter:ClearAnchors()
    ZO_PerformanceMetersLatencyMeter:SetAnchor(LEFT, ZO_PerformanceMetersFramerateMeter, RIGHT, 0, 0)
end

function ESOComplications.OnAddOnLoaded(event, addonName)
    if addonName == ESOComplications.name then
        InitUI()
        EVENT_MANAGER:UnregisterForEvent(ESOComplications.name, EVENT_ADD_ON_LOADED)
    end
end

EVENT_MANAGER:RegisterForEvent(ESOComplications.name, EVENT_ADD_ON_LOADED, ESOComplications.OnAddOnLoaded)
