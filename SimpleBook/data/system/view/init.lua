--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/7/13
-- Time: 11:29 PM
-- To change this template use File | Settings | File Templates.
--

local currentView
local currentDefaultView

local current_root_view_ctl

ViewChange = function( view )
    currentView = view
    currentDefaultView = currentView:defaultView()
    current_root_view_ctl = view:rootViewControl()
end

ViewReset = function()
    local views = currentDefaultView:subviews()
    local count = views:count()
    
    print(count)

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

ViewCtlAdd = function(viewctl)
    currentView:addChildViewController(viewctl)
end

PushViewCtl = function(viewctl)
        
    current_root_view_ctl.navigationBarHidden = false;
    current_root_view_ctl:pushViewController_animated(viewctl, false)
end

PageGoto = function(page)
    current_root_view_ctl:pageGoto(page)
end

