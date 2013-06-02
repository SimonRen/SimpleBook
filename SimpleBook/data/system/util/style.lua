--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/8/13
-- Time: 2:51 PM
-- To change this template use File | Settings | File Templates.
--

local label_style = {
    example_style = {
        color = "black",
        font = "ArialHebrew",
        fontSize = 12,
        shadowColor = "blue",
        alignment = "left",
    },

    default_style = {
        color = "black",
        font = "Cochin-BoldItalic",
        fontSize = 20,
        alignment = "left",
    },
}

GetLabelStyle = function( name )
    return label_style[ name ] or {}
end
