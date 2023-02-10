ESOComplications_PingWidget = {
    Name = "EOS_PingWidget",
    Width = 50,
    Order = 1,
}

function ESOComplications_PingWidget.InitUI()
    ESOComplications_PingWidget.Widget = ZO_PerformanceMetersLatencyMeter
    ESOComplications_PingWidget.Widget:SetDimensions(ESOComplications_PingWidget.Width, 40)
    ESOComplications_PingWidget.Widget:SetHidden(false)
end

function ESOComplications_PingWidget.Initialize()
    ESOComplications_PingWidget.InitUI()
end

ESOComplications.RegisterWidget(ESOComplications_PingWidget.Name, ESOComplications_PingWidget)