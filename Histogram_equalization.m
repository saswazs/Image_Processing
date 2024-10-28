%Histogram of an Image

a=imread('cameraman.tif');
%subplot(3,2,1);
%imshow(a);
%title('Input Image');
h=zeros(1,256); %creating a row matrix with 256 coloumns with all 0 value to store the frequency of intensity
xaxis = (0:255); %xaxis to map the value of intensity starting from minimum to maximum i.e. 0 to 255

for i = 1:256
    for j = 1:256
        in_val = a(i,j);
        h(in_val) = h(in_val)+1; %storing the frequency of internsity w.r.t intensity value
    end
end
% subplot(3,2,1);
% bar(xaxis,h);
% title('Histogram of Cameraman.tif');
% xlabel('Intensity Values');
% ylabel('Frequency');

%PDF of the histogram

pd = zeros(1,256);
for i = 1:256
    pd(i) = h(i)/(256*256); %dividing the frequency value by total number of values present in 256x256 matrix
end
% subplot(3,2,2);
% bar(pd);
% title('PDF');

%CDF of the histogram

cd = zeros(1,256);
cd(1)=pd(1); %manually assigned the cd(1) to pd(1)
for i = 2:256
    cd(i)=pd(i)+cd(i-1); %using summation to find the CDF from PDF
end
% subplot(3,2,3);
% bar(cd);
% title('CDF');

%Transformation
b = zeros(256,256); %created a matrix of original size of the i/p image to store the pixel value of transformed image
for i = 1:256
    for j = 1:256
        m=a(i,j);  %locally storing the pixel value of original image
        b(i,j)=cd(m+1)*255; %storing the value of pixel after multiplying it with the intensity value
        % m+1 is used as the indices of intensity starts from 0 but the
        % indices of matrix starts from 1
    end
end

% sas=uint8(b);
% subplot(3,2,5)
% bar(sas);
% subplot(3,2,5)
% imshow(a);
% title('Original Image');
% subplot(3,2,6)
% imshow(uint8(b)); %passing the equalized matrix through uint8 as double can't be transformed to an image
% title('Histogram Equalized Image');
% subplot(3,2,4)
% imhist(uint8(b));

subplot(2,2,2);
bar(xaxis,h);
title('Histogram of Cameraman.tif');
xlabel('Intensity Values');
ylabel('Frequency');
subplot(2,2,1)
imshow(a);
title('Original Image');
subplot(2,2,3)
imshow(uint8(b)); %passing the equalized matrix through uint8 as double can't be transformed to an image
title('Histogram Equalized Image');
subplot(2,2,4)
imhist(uint8(b));
title('Histogram of Equalized Image');
xlabel('Intensity Values');
ylabel('Frequency');


