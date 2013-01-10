package.path = package.path .. ';?/init.lua;../?.lua;./data/?/init.lua;./data/?.lua;'
--------------------------------------------------------------------------------

-- ObjC
local objc = require "objc"
setmetatable(_G, {__index=objc})

-- Bridge Support
local bs = require "objc.BridgeSupport"
bs.loadFramework( "System/Library/Frameworks/Foundation.framework", true, true )
bs.loadFramework( "System/Library/Frameworks/CoreGraphics.framework", true, true )
bs.loadFramework( "System/Library/Frameworks/UIKit.framework", true, true )
BridgeSupport = bs

--------------------------------------------------------------------------------

require "config"
require "system"
require "book"

--------------------------------------------------------------------------------

PreparePageData = function( pageData )
    local pageData = IdCast( pageData )

    local cover_fmt = "book.cover.%04d"
    local index_fmt = "book.index.%04d"
    local content_fmt = "book.content.%04d"
    local pagepath

    for i = 1, BOOK_COVER_PAGES do
        pagepath = string.format( cover_fmt, i )
        pageData:addObject( NSStr(pagepath) )
    end

    for i = 1, BOOK_INDEX_PAGES do
        pagepath = string.format( index_fmt, i )
        pageData:addObject( NSStr(pagepath) )
    end

    for i = 1, BOOK_CONTENT_PAGES do
        pagepath = string.format( content_fmt, i )
        pageData:addObject( NSStr(pagepath) )
    end

    print( "pageData OK, count is " .. tostring(pageData:count()) )
end

--------------------------------------------------------------------------------

LoadPage = function(pagepath, view)
    -- reset current view
    ViewChange( IdCast(view) )
    ViewReset()
    PurgeCallback()

    -- prepare the page
    local processor = require( pagepath )
    if type(processor) == 'function' then
        processor()
    end

    -- show
    ViewShow()
end

GotoPage = function( pagepath )
    local page = PagepathToPage(pagepath)
    SBRootViewController:sharedRootVC():pageGoto(page)
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
