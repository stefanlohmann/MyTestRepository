--
-- Created by IntelliJ IDEA.
-- User: S.Lohmann
-- Date: 28.05.13
-- Time: 13:40
-- To change this template use File | Settings | File Templates.
--
-- found on https://gist.github.com/jonbeebe/1761681

for i = 1, 10, 1 do
    print()
end

display.setStatusBar( display.DefaultStatusBar )

local widget = require "widget"
local sbHeight = display.statusBarHeight
local tbHeight = 44
local top = sbHeight + tbHeight

-- forward declarations
local titleField, noteText, loadSavedNote, saveNote

-- create background for the app
local bg = display.newImageRect( "stripes.jpg", display.contentWidth, display.contentHeight )
bg:setReferencePoint( display.TopLeftReferencePoint )
bg.x, bg.y = 0, 0

-- create a gradient for the top-half of the toolbar
local toolbarGradient = graphics.newGradient( {168, 181, 198, 255 }, {139, 157, 180, 255}, "down" )

-- create toolbar to go at the top of the screen
local titleBar = widget.newTabBar{
    top = sbHeight,
    gradient = toolbarGradient,
    bottomFill = { 117, 139, 168, 255 },
    height = 44
}

-- create embossed text to go on toolbar
local titleText = display.newEmbossedText( "NOTE", 0, 0, native.systemFontBold, 20 )
titleText:setReferencePoint( display.CenterReferencePoint )
titleText:setTextColor( 255 )
titleText.x = 160
titleText.y = titleBar.y

-- create a shadow underneath the titlebar (for a nice touch)
local shadow = display.newImage( "shadow.png" )
shadow:setReferencePoint( display.TopLeftReferencePoint )
shadow.x, shadow.y = 0, top
shadow.xScale = 320 / shadow.contentWidth
shadow.yScale = 0.25

-- create load button (top left)
local loadBtn = widget.newButton{
    label = "Load",
    labelColor = { default={255}, over={255} },
    font = native.systemFontBold,
    xOffset=2, yOffset=-1,
    default = "load-default.png",
    over = "load-over.png",
    width=60, height=30,
    left=10, top=28
}

-- onRelease listener callback for loadBtn
local function onLoadRelease( event )
    loadSavedNote()
end
loadBtn.onRelease = onLoadRelease	-- set as loadBtn's onRelease listener

-- create save button (top right)
local saveBtn = widget.newButton{
    label = "Save",
    labelColor = { default={255}, over={255} },
    font = native.systemFontBold,
    xOffset=2, yOffset=-1,
    default = "save-default.png",
    over = "save-over.png",
    width=60, height=30,
    left=display.contentWidth-70, top=28
}

-- onRelease listener callback for saveBtn
local function onSaveRelease( event )
    saveNote()
end
saveBtn.onRelease = onSaveRelease	-- set as saveBtn's onRelease listener

-- display warning that will show at the bottom of screen
local warning = display.newImageRect( "warning.png", 300, 180 )
warning:setReferencePoint( display.BottomCenterReferencePoint )
warning.x = display.contentWidth * 0.5
warning.y = display.contentHeight - 28