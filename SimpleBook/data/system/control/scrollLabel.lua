--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/9/13
-- Time: 4:35 PM
-- To change this template use File | Settings | File Templates.
--

--[[

param = {
    text = "abc",
    size = {10,20},
    pos = {10,20},
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

NewScrollLabel = function( param )
    local label = UITextView:alloc():initWithFrame( CGRect( CGPoint(unpack(param.pos)), CGSize(unpack(param.size)) ) )
    label:setEditable(false)
    label.backgroundColor = UIColor:clearColor()

    label.text = NSStr( param.text )
    label.font = FontGet(param.font, param.fontSize)
    label.textColor = ColorGet( param.color )

    if (param.shadowColor and param.shadowOffset) then
        label.shadowColor = ColorGet( param.shadowColor )
        label.shadowOffset = BridgeSupport.CGSize( unpack(param.shadowOffset) )
    end

    label.textAlignment = AlignmentGet( param.alignment )

    ViewAdd( label )
end
