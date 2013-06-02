--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/8/13
-- Time: 2:32 PM
-- To change this template use File | Settings | File Templates.
--

--[[

Full IOS font list:
http://iosfonts.com/

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

NewLabel = function( param )

    if param.style then
        meta = {
            __index = GetLabelStyle(param.style)
        }

        setmetatable( param, meta )
    end

    local label = UILabel:alloc():initWithFrame( CGRect( CGPoint(unpack(param.pos)), CGSize(unpack(param.size)) ) )
    label.numberOfLines = 0
    label.lineBreakMode = UILineBreakModeWordWrap
    label.backgroundColor = UIColor:clearColor()

    label.text = NSStr( param.text )
    label.font = FontGet(param.font, param.fontSize)
    label.textColor = ColorGet( param.color )

    if (param.shadowColor and param.shadowOffset) then
        label.shadowColor = ColorGet( param.shadowColor )
        label.shadowOffset = BridgeSupport.CGSize( unpack(param.shadowOffset) )
    end

    label.textAlignment = AlignmentGet( param.alignment )
    label.highlightedTextColor = ColorGet( param.highlightedColor )
    label.highlighted = param.hilighted and true or false

    if param.clicked then
        label.userInteractionEnabled = true

        -- Block
        local block = GenCallback( param.clicked, "v@" )
        block_invocate = BlockInvocation:invocationWithCallbackIdx(block)

        -- Recognizer
        local recognizer = UITapGestureRecognizer:alloc():initWithTarget_action( block_invocate, SEL("performWithObject:") )
        recognizer.numberOfTapsRequired = 1
        label:addGestureRecognizer( recognizer )
    end

    ViewAdd(label, param.panel)
end
