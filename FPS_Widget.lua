ESOComplications_FPSWidget = {
    Name = "EOS_FPSWidget",
    Width = 60,
    Order = 0,
}

function ESOComplications_FPSWidget.InitUI()
    ESOComplications_FPSWidget.Widget = ZO_PerformanceMetersFramerateMeter
    ESOComplications_FPSWidget.Widget:SetDimensions(ESOComplications_FPSWidget.Width, 40)
    ESOComplications_FPSWidget.Widget:SetHidden(false)
end

function ESOComplications_FPSWidget.Initialize()
    ESOComplications_FPSWidget.InitUI()
end

ESOComplications.RegisterWidget(ESOComplications_FPSWidget.Name, ESOComplications_FPSWidget)