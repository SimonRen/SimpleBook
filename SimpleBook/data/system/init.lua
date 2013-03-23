--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/7/13
-- Time: 11:29 PM
-- To change this template use File | Settings | File Templates.
--

require "system.util"
require "system.view"
require "system.control"

OpenUrl = function(url)

    UIApplication:sharedApplication():openURL(NSURL:URLWithString(NSStr(url)))
end