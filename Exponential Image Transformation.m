% Exponential Image Transformation

a = imread('cameraman.tif'); %reading the input image
ad = double(a); %converting to double precision for computation

c=1;
gs = [0.05, 0.5, 0.67, 1, 2.5, 5, 10, 20];

figure;
hold on;

for i = 1:length(gs)
    g= gs(i);
    op = c*(ad.^g); % applying exponential transformation
  
    subplot(2,4,i);
    imshow(op);
    title(['g=',num2str(g)]);
end
sgtitle('Logarithmic transform for various g values')