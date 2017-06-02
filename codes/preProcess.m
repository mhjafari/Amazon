clear;clc;
parfor i = 0:40478

I = imread(strcat('JPEG/train_',num2str(i),'.jpg'));

% histogram(I)
% J = histeq(I);

m=1;n=m;
%// Find minimum intensity for each location for each channel
out_red = ordfilt2(I(:,:,1), 1, true(m, n));
out_green = ordfilt2(I(:,:,2), 1, true(m, n));
out_blue = ordfilt2(I(:,:,3), 1, true(m, n));

%// Create a new colour image that has these all stacked
out = cat(3, out_red, out_green, out_blue);
%// Find dark channel image
out_dark = min(out, [], 3);

imwrite(out_dark,strcat('postProcess/train_',num2str(i),'.jpg'))
end

% figure(1)
% imshow(out_dark)
% figure(2)
% histogram(out_dark)
% xlim([1 255])
