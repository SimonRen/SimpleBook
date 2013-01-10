--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/10/13
-- Time: 5:57 PM
--

local cache = {}

GenCallback = function( cb )
    cache[ #cache + 1 ] = cb
    return #cache
end

CastCallback = function( id )
    local cb = cache[ id ]
    if cb then cb() end
end

PurgeCallback = function()
    cache = {}
end

