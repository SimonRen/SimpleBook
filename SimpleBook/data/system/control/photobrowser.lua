NewPhotoBrowser = function ( param )

    do
        --return
    end
    
    local photos = {}

    for i, v in ipairs(param.images) do
        local image = UIImage:imageNamed( NSStr("data/book/images/"..v))
        local photo = MWPhoto:photoWithImage(image)
        table.insert(photos, photo)
    end
     
    local pb = MWPhotoBrowser:alloc()
    pb:initWithPhotos(NSArr(photos))
    pb.displayActionButton = true;

    PushViewCtl(pb)
end 

NewPanel = function( param )

    local panel = SBPanel:alloc()
    panel:initWithX_y_w_h(50, 50, 500, 700)

    ViewAdd(panel)
end 
