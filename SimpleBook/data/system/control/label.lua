--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/8/13
-- Time: 2:32 PM
-- To change this template use File | Settings | File Templates.
--

--[[

param = {
    text = "abc",
    >>size = {10,20},
    >>pos = {10,20},
    color = {a,r,g,b} or "black", "blue", "white",
    font = "simsun",
    fontSize = 12,
    shadowColor = {a,r,g,b} or "black", "blue", "white",
    shadowOffset = {0,0},
    >>lineSpacing = 0,
    highlightedColor = {a,r,g,b} or "black", "blue", "white",
    highlighted = false,
    alignment = "left, center, right",

    clicked = function() do some thing end,
}

--]]

NewLabel = function( param )
    local dvc = ViewGet()

    local label = UILabel:alloc():init()
    label.text = NSStr( param.text )
    label.font = FontGet(param.font, param.fontSize)
    label.textColor = ColorGet( param.color )
    label.shadowColor = ColorGet( param.shadowColor )
    label.shadowOffset = CGSize(param.shadowOffset or {0,0})
    label.textAlignment = AlignmentGet( param.alignment )
    label.highlightedTextColor = ColorGet( param.highlightedColor )
    label.highlighted = param.hilighted and true or false

    if param.clicked then
        label.userInteractionEnable = true
    end

end