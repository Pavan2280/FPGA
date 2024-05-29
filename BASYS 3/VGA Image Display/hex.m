%%
im_in = imread('download.jpg');
im_in2 = imrotate(im_in, -90);
mirror_image = flip(im_in2, 2);
im = imresize(mirror_image, [256 256]);
im(:,:,1) = double(im(:,:,1))*7/255;
im(:,:,2) = double(im(:,:,2))*7/255;
im(:,:,3) = double(im(:,:,3))*3/255;
im2 = im(:,:,1)+im(:,:,2)*8+im(:,:,3)*64;
temph = fopen('temph.txt','w');
fprintf(temph,'%.2x\n', uint8(im2));
fclose(temph);
