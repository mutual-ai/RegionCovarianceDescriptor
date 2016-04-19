%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Filename: integralImage.m
%
%  Description: This function calculates the integral image of a feature  
%  from the feature image.
%  Region Covariance: A Fast Descriptor for Detection and Classification
%
%  Nkosikhona Gumede
%  University of KwaZulu Natal
%  208504751@stu.ukzn.ac.za
%  Aug 2015
%
%  Fi - W x H matrix of feature (i) in F matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function intimage = integralImage(Fi)

   % Fi = double(Fi);
    
    [w,h] = size(Fi);

    P = zeros(w+1,h+1);    %   Template
    P(2:end,2:end) = cumsum(cumsum(Fi,1),2); %    Cumulative sum along row and column to get integral image
    
    intimage = P; 
end