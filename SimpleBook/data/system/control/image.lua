--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/9/13
-- Time: 2:15 PM
-- To change this template use File | Settings | File Templates.
--

--[[
param = {
    size = {10,20},
    pos = {10,20},
    image = "path_to_image.png" | png or jpg, load from main bundle
    scale = 1.0(default),
    orientation = up(default), down, left, right, up_mirror, down_mirror, left_mirror, right_mirror
    clicked = function() end
--]]

NewImage = function( param )
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

    if param.orientation and orientation ~= 'up' then
    end

    local imageview = UIImageView:alloc():initWithImage( image )
    imageview:setCenter( CGPoint(unpack(param.pos)) )

    if param.clicked then
        imageview.userInteractionEnabled = true

        -- Block
        local block = GenCallback( param.clicked, "v@" )
        local block_invocate = BlockInvocation:invocationWithCallbackIdx(block)

        -- Recognizer
        local recognizer = UITapGestureRecognizer:alloc():initWithTarget_action( block_invocate, SEL("performWithObject:") )
        recognizer.numberOfTapsRequired = 1
        imageview:addGestureRecognizer( recognizer )
    end

    ViewAdd(imageview, param.panel)
end
