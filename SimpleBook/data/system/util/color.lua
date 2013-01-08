--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/8/13
-- Time: 2:50 PM
-- To change this template use File | Settings | File Templates.
--

local gen_color = function( a, r, g, b )
    a = a or 0
    r = r or 0
    g = g or 0
    b = b or 0

    return UIColor:colorWithRed_green_blue_alpha( r, g, b, a )
end

pre_define =
{
    black = gen_color( 255, 0, 0, 0 ),
    white = gen_color( 255, 255, 255, 255 ),
    blud = gen_color( 255, 0, 0, 255 ),
}

ColorGet = function( param )
    if type(param) == 'table' then
        return gen_color( unpack(param) )
    elseif type(param) == 'string' then
        return pre_define[param]
    end

    return nil
end
