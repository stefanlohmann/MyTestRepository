--
-- Created by IntelliJ IDEA.
-- User: S.Lohmann
-- Date: 30.05.13
-- Time: 15:49
-- To change this template use File | Settings | File Templates.
--

local i18n = require('i18n') -- remove this line if on the same file as before

i18n.locales.en = {
    helloWorld = "Hello world",
    loginWarning = "You need to be logged in to do that"
}

i18n.locales.es = {
    helloWorld = "Hola mundo",
    loginWarning = "Debes haber iniciado una sesión para hacer eso"
}

i18n.locales.de = {
    helloWorld = "Hallo Welt",
    loginWarning = "Dazu müssen Sie eingeloggt sein"
}