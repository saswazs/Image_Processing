% Logarithmic Transformation

a = imread('cameraman.tif');
ad= im2double(a);
cs = [0.5, 1, 2.1, 5];
figure;

for i = 1:length(cs)
    c = cs(i);
    s = c * log(1 + ad);

    subplot(2,2,i);
    imshow(s);
    title(['c=',num2str(c)]);
end
sgtitle('Logarithmic transform for various c values')
