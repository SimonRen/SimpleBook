print("i am panel")
NewPanel = function( param )

    local x = param.pos[1]
    local y = param.pos[2]
    
    local w = param.size[1]
    local h = param.size[2]
    
    local panel = SBPanel:alloc()
    panel:initWithX_y_w_h(x, y, w, h)

    ViewAdd(panel)
    return panel
end 
