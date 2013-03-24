print("i am panel")
NewPanel = function( param )

    local panel = SBPanel:alloc()
    panel:initWithX_y_w_h(50, 50, 700, 700)

    ViewAdd(panel)
    return panel
end 
