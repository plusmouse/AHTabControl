AHTabControl = {}

function AHTabControl.SetupCommand()
  print("setup")
  SlashCmdList["zAHTabControl"] = AHTabControl.CommandHandler
  SLASH_zAHTabControl1 = "/ahtc"
  SLASH_zAHTabControl2 = "/ahtabcontrol"
end

function AHTabControl.CommandHandler(tabId)
  local num = tonumber(tabId)
  local disabled = AH_TAB_CONTROL_DISABLED_TABS

  if num == nil or num == 0 then
    local tabString = " "
    for _, t in ipairs(disabled) do
      tabString = tabString .. t .. " "
    end
    AHTabControl.Message("Currently hidden tabs: [" .. tabString .. "]")
  else
    local index = AHTabControl.ArrayIndex(disabled, num)

    if index ~= nil then
      AHTabControl.Message("Tab restored " .. num)
      table.remove(disabled, index)
    else
      AHTabControl.Message("Tab hidden " .. num)
      table.insert(disabled, num)
    end

    if AuctionatorAHTabsContainer ~= nil then
      AHTabControlFrame:HideTabs()
    end
  end
end

function AHTabControl.Message(message)
  print("|cc935e0ffAHTabControl|r: " .. message)
end

function AHTabControl.ArrayIndex(list, item)
  for index, cmp in ipairs(list) do
    if cmp == item then
      return index
    end
  end

  return nil
end
