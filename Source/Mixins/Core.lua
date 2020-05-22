AHTabControlFrameMixin = {}

function AHTabControlFrameMixin:OnLoad()
  self:RegisterEvent("VARIABLES_LOADED")
  --Register for event last, probably...
  self:RegisterEvent("AUCTION_HOUSE_SHOW")
end
function AHTabControlFrameMixin:OnEvent(eventName)
  if eventName == "AUCTION_HOUSE_SHOW" then
    self:HideTabs()
    self:UnregisterEvent("AUCTION_HOUSE_SHOW")

  elseif eventName == "VARIABLES_LOADED" then
    AHTabControl.SetupCommand()

    if AH_TAB_CONTROL_DISABLED_TABS == nil then
      AH_TAB_CONTROL_DISABLED_TABS = {1,2,3}
    end
  end
end

function AHTabControlFrameMixin:HideTabs()
  local disable = AH_TAB_CONTROL_DISABLED_TABS

  local left = nil

  for i, tab in ipairs(AuctionHouseFrame.Tabs) do
    tab:Show()

    if tIndexOf(disable, i) ~= nil then
      tab:Hide()
    elseif left == nil then
      if i ~= 1 then
        tab:SetPoint("LEFT", AuctionHouseFrame.Tabs[1], "LEFT", 0, 0)
      end
      left = tab
    else
      tab:SetPoint("LEFT", left, "RIGHT", -15, 0)
      left = tab
    end
  end
end
