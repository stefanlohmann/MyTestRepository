--
-- Created by IntelliJ IDEA.
-- User: S.Lohmann
-- Date: 30.05.13
-- Time: 15:48
-- To change this template use File | Settings | File Templates.
--

local i18n = { locales = {} }

local currentLocale = 'en' -- the default language

function i18n.setLocale(newLocale)
    currentLocale = newLocale
    assert(i18n.locales[currentLocale], ("The locale %q was unknown"):format(newLocale))
end

local function translate(id)

    print("id: ", id)
    print("currentLocale: ", currentLocale)

    local result = i18n.locales[currentLocale][id]

    if (id == nil) then print("isNil") end
    if (id == "") then print("isEmpty") end
print(result)

    assert(result, ("The id %q was not found in the current locale (%q)"):format(id, currentLocale))
    return result
end

i18n.translate = translate

setmetatable(i18n, {__call = function(_,...) return translate(id) end})

return i18n