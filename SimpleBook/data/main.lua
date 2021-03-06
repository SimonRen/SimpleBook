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
bs.loadFramework( "System/Library/Frameworks/MediaPlayer.framework", true, true )
bs.loadFramework( "System/Library/Frameworks/CoreAudio.framework", true, true )
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

    CFG.STAGE_NOCOVER = false
end

PreparePageDataNoCover1 = function( pageData )
    local pageData = IdCast( pageData )

    local cover_fmt = "book.cover.%04d"
    local index_fmt = "book.index.%04d"
    local content_fmt = "book.content.%04d"
    local pagepath

    --cover不出现
    for i = 2, BOOK_COVER_PAGES do
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
    
    --page_history = {}

    CFG.STAGE_NOCOVER = true
end

--------------------------------------------------------------------------------

page_history = {}

local is_goto_page = 0

local curr_page_path = ""
local curr_page_index = -1

function check_page_history()
    print('page_history begin')
    for i, v in ipairs(page_history) do
        print(v)
    end
    print('page_history end')
end

LoadPage = function(pagepath, view)
    if is_goto_page == 0 then
          curr_page_path = pagepath
          if curr_page_path ~= "" then
            if (#page_history == 5) then
                table.remove(page_history, 1)
                print('remove--------------------------------------------------')
            end
        
            print("insert:"..curr_page_path)
            
            if (curr_page_path ~= "" and curr_page_path ~= 'book.cover.0001') then
                table.insert(page_history, curr_page_path)
                                    
                check_page_history()
            end
          end
        
        print('curr_page_path:'..curr_page_path)
    end

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
    
    if (is_goto_page >= 1) then
        is_goto_page = is_goto_page - 1
    end
end

GotoPage = function( pagepath )

    is_goto_page = 1
    local page = PagepathToPage(pagepath)
    SBRootViewController:sharedRootVC():pageGoto(page)

end

GotoPageNotRecord = function( pagepath )

    is_goto_page = 2
    local page = PagepathToPage(pagepath)
    SBRootViewController:sharedRootVC():pageGoto(page)
    
end

GotoPagePre = function()
    local try_pre = 0
    if curr_page_index == -1 then
        try_pre = #page_history - 1
    else
        try_pre = curr_page_index - 1
    end
    check_page_history()

    print("try_pre:"..tostring(try_pre)..'_'..tostring(page_history[try_pre]))

    if (try_pre < 1) then
        return
    end

    curr_page_index = try_pre

    if page_history[try_pre] ~= nil then
        GotoPageNotRecord(page_history[curr_page_index])
    end
end

GotoPageNext = function()
    local try_next = curr_page_index + 1
    
    check_page_history()
    
    print("try_next:"..tostring(try_next)..'_'..tostring(page_history[try_next]))
    
    if (try_next > 5) then
        return
    end

    curr_page_index = try_next

    if page_history[try_next] ~= nil then
        GotoPageNotRecord(page_history[curr_page_index])
    end

end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
