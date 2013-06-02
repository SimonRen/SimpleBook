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
    selected_image = ""
    clicked = function() end
--]]

NewButton = function( param )
    local image         = UIImage:imageNamed( NSStr("data/book/images/"..param.image) )
    
    local selected_image = nil
    if (param.selected_image) then
        selected_image= UIImage:imageNamed( NSStr("data/book/images/"..param.selected_image) )
    end
    
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
        
        if (selected_image) then
        
            scaled_size = CGSize( unpack(param.size or {0,0}) )

            if param.scale then
                scaled_size = CGSize( scaled_size.width * param.scale, scaled_size.height * param.scale )
            end

            UIGraphicsBeginImageContext( scaled_size )
            selected_image:drawInRect( CGRect( CGPoint(0,0), scaled_size ) )
            scaled_image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            selected_image = scaled_image
        end
    end

    local button = UIButton:alloc():initWithFrame( CGRect( CGPoint(unpack(param.pos)), CGSize(unpack(param.size)) ) )
    button:setImage_forState( image, UIControlStateNormal )
    
    if (selected_image) then
        button:setImage_forState( selected_image, UIControlStateSelected )
    end

    if param.clicked then
        local new_click = function()
            local clicked = param.clicked
            return clicked( button )
        end

        button.userInteractionEnabled = true

        -- Block
        local block = GenCallback( new_click, "vv" )
        local block_invocate = BlockInvocation:invocationWithCallbackIdx(block)

        -- action
        button:addTarget_action_forControlEvents( block_invocate, SEL("perform"), UIControlEventTouchUpInside )
    end

    ViewAdd(button, param.panel)

end

