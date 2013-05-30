--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/10/13
-- Time: 4:32 PM
--

local rep = 'book.(%w+).(%w+)'
PagepathToPage = function( pagepath )
    -- book.xxx.0001
    local pageAdjust = 0

    if CFG.STAGE_NOCOVER then
        pageAdjust = 1
    end

    local fun = string.gmatch( pagepath, rep )
    if not fun then return 0 end

    local part, page = fun()
    if not part then return 0 end
    if not page then return 0 end

    local config =
    {
        cover = 0 - pageAdjust;
        index = BOOK_COVER_PAGES - pageAdjust,
        content = BOOK_INDEX_PAGES + BOOK_COVER_PAGES - pageAdjust,
    }

    local basepage = config[ part ]
    if not basepage then return 0 end

    local totalpage = basepage + tonumber(page)
    
    print('totalpage:'..tostring(totalpage))
    return totalpage
end
