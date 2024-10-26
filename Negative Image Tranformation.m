% Negative Image Transformation 

a = imread('cameraman.tif'); %reading the input image
subplot(1,2,1);
imshow(a);

a_neg = 255 - a; %subtracting the pixel value from maximum intensity value

title('Original image');
subplot(1,2,2);
imshow(a_neg);
title('Negetive Image');