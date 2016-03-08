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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function intimage = integralImage(Fi)

    Fi = double(Fi);
    
    [n,m] = size(Fi);

    P = int64(zeros(n+1,m+1));    %   Template
    P(2:end,2:end) = cumsum(cumsum(Fi,1),2); %    Cumulative sum along row and column to get integral image
    
    intimage = P; 
end