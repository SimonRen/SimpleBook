--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/7/13
-- Time: 11:29 PM
-- To change this template use File | Settings | File Templates.
--

local currentView
local currentDefaultView

ViewChange = function( view )
    currentView = view
    currentDefaultView = currentView:defaultView()
end

ViewReset = function()
    local views = currentDefaultView:subviews()
    local count = views:count()

    for index = 0, count - 1 do
        local subview = views:objectAtIndex(index)
        subview:removeFromSuperview()
    end
end

ViewShow = function()
end

ViewGet = function()
    return currentDefaultView
end

ViewAdd = function( control )
    currentDefaultView:addSubview( control )
end

