--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/8/13
-- Time: 2:51 PM
-- To change this template use File | Settings | File Templates.
--

local alignment_table =
{
    left = UITextAlignmentLeft,
    center = UITextAlignmentCenter,
    right = UITextAlignmentRight,
}

AlignmentGet = function( alignment )
    local value = alignment_table[ alignment ]
    value = value or UITextAlignmentLeft

    return value
end

