local currentLocale = {}

local function FixMissingTranslations(incomplete, locale)
  if locale == "enUS" then
    return
  end

  local enUS = AH_TAB_CONTROL_LOCALES["enUS"]()
  for key, val in pairs(enUS) do
    if incomplete[key] == nil then
      incomplete[key] = val
    end
  end
end

if AH_TAB_CONTROL_LOCALES[GetLocale()] ~= nil then
  currentLocale = AH_TAB_CONTROL_LOCALES[GetLocale()]()

  FixMissingTranslations(currentLocale, GetLocale())
else
  currentLocale = AH_TAB_CONTROL_LOCALES["enUS"]()
end

-- Export constants into the global scope (for XML frames to use)
for key, value in pairs(currentLocale) do
  _G["AH_TAB_CONTROL_L_"..key] = value
end
