--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/10/13
-- Time: 11:04 AM
--

--[[

param = {
    size = {10,20},
    pos = {10,20},
    images = {"img1.png","img2.png",...},
    fmt_images = {"fmt", from_index, toindex},
    anim = "auto", "tap", "swipe"
    interval = 1,
    repeatCount = true,
}

--]]

NewAnim = function( param )
    local image_count
    local duration
    local repeatCount

    local imageArray = {}
    if (param.images) then
        image_count = #param.images
        duration = param.interval * image_count
        repeatCount = param.repeatCount or 1

        for _, image_path in ipairs(param.images) do
            local image = UIImage:imageNamed( NSStr("data/book/images/"..image_path) )
            table.insert( imageArray, image )
        end
    elseif (param.fmt_images) then
        local fmt, from, to = unpack(param.fmt_images)

        image_count = to - from + 1
        duration = param.interval * image_count
        repeatCount = param.repeatCount or 1

        for i = from, to do
            local image_path = string.format( fmt, i )
            local image = UIImage:imageNamed( NSStr("data/book/images/"..image_path) )
            table.insert( imageArray, image )
        end

    else
        assert( false, '[Lua] no images for control anim' )
    end

    local imageview = UIImageView:alloc():initWithImage( imageArray[1] )
    imageview:setCenter( CGPoint(unpack(param.pos)) )
    imageview.animationImages = NSArr( imageArray )
    imageview.animationDuration = duration
    imageview.animationRepeatCount = repeatCount

    if param.anim == 'tap' then

        imageview:stopAnimating()
        imageview.userInteractionEnabled = true

        local currentIdx = 0
        local maxIdx = image_count
        local tap_callback = function()
            currentIdx = currentIdx + 1
            if (currentIdx >= maxIdx) then currentIdx = 0 end

            local allimages = imageview:animationImages()
            local currentImage = allimages:objectAtIndex(currentIdx)
            imageview.image = currentImage
        end

        local tap_block = GenCallback( tap_callback )
        local tap_block_invocate = BlockInvocation:invocationWithCallbackIdx( tap_block )
        local tap_recognizer = UITapGestureRecognizer:alloc():initWithTarget_action( tap_block_invocate, SEL("performWithObject:") )
        tap_recognizer.numberOfTapsRequired = 1
        imageview:addGestureRecognizer( tap_recognizer )

    elseif param.anim == 'swipe' then

        imageview:stopAnimating()
        imageview.userInteractionEnabled = true

        local currentIdx = 0
        local maxIdx = image_count

        local next = function()
            currentIdx = currentIdx + 1
            if (currentIdx >= maxIdx) then currentIdx = 0 end

            local allimages = imageview:animationImages()
            local currentImage = allimages:objectAtIndex(currentIdx)
            imageview.image = currentImage
        end

        local prev = function()
            currentIdx = currentIdx - 1
            if (currentIdx < 0) then currentIdx = maxIdx - 1 end

            local allimages = imageview:animationImages()
            local currentImage = allimages:objectAtIndex(currentIdx)
            imageview.image = currentImage
        end

        -- tap
        local tap_block = GenCallback( next, "v@" )
        local tap_block_invocate = BlockInvocation:invocationWithCallbackIdx( tap_block )
        local tap_recognizer = UITapGestureRecognizer:alloc():initWithTarget_action( tap_block_invocate, SEL("performWithObject:") )
        tap_recognizer.numberOfTapsRequired = 1
        imageview:addGestureRecognizer( tap_recognizer )

        -- swipe left
        local swipeleft_block = GenCallback( prev, "v@" )
        local swipeleft_block_invocate = BlockInvocation:invocationWithCallbackIdx( swipeleft_block )
        local swipeleft_recognizer = UISwipeGestureRecognizer:alloc():initWithTarget_action( swipeleft_block_invocate, SEL("performWithObject:") )
        swipeleft_recognizer.direction = UISwipeGestureRecognizerDirectionLeft
        swipeleft_recognizer.numberOfTouchesRequired = 2
        imageview:addGestureRecognizer( swipeleft_recognizer )

        -- swipe right
        local swiperight_block = GenCallback( next, "v@" )
        local swiperight_block_invocate = BlockInvocation:invocationWithCallbackIdx( swiperight_block )
        local swiperight_recognizer = UISwipeGestureRecognizer:alloc():initWithTarget_action( swiperight_block_invocate, SEL("performWithObject:") )
        swiperight_recognizer.direction = UISwipeGestureRecognizerDirectionRight
        swiperight_recognizer.numberOfTouchesRequired = 2
        imageview:addGestureRecognizer( swiperight_recognizer )

        tap_recognizer:requireGestureRecognizerToFail( swipeleft_recognizer )
        swipeleft_recognizer:requireGestureRecognizerToFail( swiperight_recognizer )

    else -- default is auto
        imageview:startAnimating()
    end

    ViewAdd(imageview, param.panel)
end
