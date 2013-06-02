--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/8/13
-- Time: 2:51 PM
-- To change this template use File | Settings | File Templates.
--

font_cache = {}

FontGet = function( name, size )
    local loaded_id = string.format( "%s_%d", name, size )
    local loaded_font = font_cache[ loaded_id ]
    if (loaded_font) then return loaded_font end

    local font = UIFont:fontWithName_size( NSStr(name), size )
    --[[
    if CFG.NOPRINT then
        if not font then
            print ('font not found: ' .. name .. '@' .. size )
        else
            print( 'font for ' .. name .. '@' .. size .. ' is:', font )
        end
    end
    --]]

    font_cache[ loaded_id ] = font

    return font
end
