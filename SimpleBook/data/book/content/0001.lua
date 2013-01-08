--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/7/13
-- Time: 11:34 PM
-- To change this template use File | Settings | File Templates.
--

return function()
    local dvc = ViewGet()
    dvc:dataLabel().text = NSStr( "Content" .. math.random(1,100) )
end
