    Image = imread('jpg/train_67.jpg');
    Image = double(Image)/256;
    imshow(Image)
    coord = [139,196];
    S = 5;
    
    window = Image( coord(2)-floor(S/2):coord(2)+floor(S/2), ...
                    coord(1)-floor(S/2):coord(1)+floor(S/2),:);
    imshow(window)
    template = template + window;
    imshow(template/4)
    
    template = zeros(S,S,3);