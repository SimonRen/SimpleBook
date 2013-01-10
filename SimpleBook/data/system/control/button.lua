--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/9/13
-- Time: 2:15 PM
--

--[[
param = {
    size = {10,20},
    pos = {10,20},
    image = "path_to_image.png" | png or jpg, load from main bundle

    clicked = function() end
--]]

NewButton = function( param )
    local image = UIImage:imageNamed( NSStr("data/book/images/"..param.image) )

    if (param.size or param.scale) then
        local scaled_size = CGSize( unpack(param.size or {0,0}) )

        if param.scale then
            scaled_size = CGSize( scaled_size.width * param.scale, scaled_size.height * param.scale )
        end

        UIGraphicsBeginImageContext( scaled_size )
        image:drawInRect( CGRect( CGPoint(0,0), scaled_size ) )
        local scaled_image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        image = scaled_image
    end

    local button = UIButton:alloc():initWithFrame( CGRect( CGPoint(unpack(param.pos)), CGSize(unpack(param.size)) ) )
    button:setImage_forState( image, UIControlStateNormal )

    if param.clicked then
        button.userInteractionEnabled = true

        -- Block
        local block = createBlock( param.clicked, "vv" )
        local block_invocate = BlockInvocation:invocationWithBlock(block)

        -- action
        button:addTarget_action_forControlEvents( block_invocate, SEL("perform"), UIControlEventTouchUpInside )
    end

    ViewAdd( button )
end

