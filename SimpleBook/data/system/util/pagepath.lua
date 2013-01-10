--
-- Created by IntelliJ IDEA.
-- User: jmulro
-- Date: 1/10/13
-- Time: 4:32 PM
--

local rep = 'book.(%w+).(%w+)'
PagepathToPage = function( pagepath )
    -- book.xxx.0001

    local fun = string.gmatch( pagepath, rep )
    if not fun then return 0 end

    local part, page = fun()
    if not part then return 0 end
    if not page then return 0 end

    local config =
    {
        cover = 0;
        index = BOOK_COVER_PAGES,
        content = BOOK_INDEX_PAGES + BOOK_COVER_PAGES,
    }

    local basepage = config[ part ]
    if not basepage then return 0 end

    local totalpage = basepage + tonumber(page)

    return totalpage
end
