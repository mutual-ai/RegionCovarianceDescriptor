%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Filename: FeatureImage.m
%
%  Description: function to calculates the feature image from the image. 
%  This function calculates the 9 features for each pixel in the image as described
%  by equation 13
%  Region Covariance: A Fast Descriptor for Detection and Classification
%
%  F(x,y) = [x y R(x,y) G(x,y) B(x,y) |dI/dx| |dI/dy| |d^2I/dx^2| |d^2I/dy^2|]
%
%  F - Output feature image (W x H x d)
%  RGB - 3 dimensional RGB color image (W x H x 3)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Author
%  Nkosikhona Gumede
%  University of KwaZulu Natal
%  208504751@stu.ukzn.ac.za
%  Aug 2015


function F = FeatureImage(RGB)

    I = rgb2gray(RGB);      % Convert to grayscale (intensity) image 
    I = im2double(I);       % convert intensity image I to double
    %I = squeeze(I(:,:,3));

    [h,w,~] = size(RGB);

    F = zeros(h,w,9);       % Feature image template  (H x W x d matrix)

    for i=1:h
        for j=1:w
            F(i,:,1) = i*ones(1,w);         % Pixel x location
            F(:,j,2) = j*ones(h,1);         % Pixel y location
        end
    end

    F(:,:,3:5) = im2double(RGB);            % double RGB pixel values

    xdev1 = [-1 0 1]';      % first derivate calculation kernel (dx)
    ydev1 = xdev1';         % transpose for dy    

    xdev2 = [-1 2 -1]';     % second derivate calculation  (dx^2)
    ydev2 = xdev2';         % transpose for dy^2

    F(:,:,6) = abs(conv2(I,xdev1,'same'));    % Absolute of first derivative w.r.t x |dI/dx|
    F(:,:,7) = abs(conv2(I,ydev1,'same'));    % Absolute of first derivative w.r.t y |dI/dy|
    F(:,:,8) = abs(conv2(I,xdev2,'same'));    % Absolute of second derivative w.r.t x |d^2I/dx^2|
    F(:,:,9) = abs(conv2(I,ydev2,'same'));    % Absolute of second derivative w.r.t y |d^2I/dy^2|

    F = permute(F,[2 1 3]); % permute F from H x W x d to W x H x d

end